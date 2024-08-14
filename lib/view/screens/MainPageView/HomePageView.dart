import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/AdminHomePageController.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/colors.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/view/screens/tasks.dart';
import 'package:projectoneuniversity/view/widgets/job_design.dart';
import 'package:projectoneuniversity/view/widgets/top_bar.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(AdminHomePageControllerImpl());
    return Scaffold(
        body: SingleChildScrollView(
      child: GetBuilder<AdminHomePageControllerImpl>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loading
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopBar(name: "Admin", image: EnglishIconChooseLanguage),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 15.w,
                                end: 15.w,
                                top: 20.h,
                                bottom: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "tasks".tr,
                                  style: TextStyles.bold17(context),
                                ),
                                Text(
                                  "showall".tr,
                                  style: TextStyle(
                                      color: LightAppColors.primaryColor,
                                      fontSize: 12.sp),
                                ),
                              ],
                            )),
                      ).animate().fade(duration: 500.ms).slideY(begin: 0.5),
                      Tasks(
                        controller: controller,
                      ).animate().fade(duration: 500.ms).slideY(begin: 0.5),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 15.w, top: 5.h, bottom: 5.h),
                            child: Text(
                              "recentjobs".tr,
                              style: TextStyles.bold17(context),
                            )),
                      ),
                        ListView.builder(
                              itemCount: controller.jobs.length,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return JobDesign(
                                  jobTitle: controller.jobs[index].jobTitle!,
                                  companyName:
                                      controller.jobs[index].companyName!,
                                  location: controller.jobs[index].location,
                                  date: controller.jobs[index].date!,
                                  remote: controller.jobs[index].remoteName!,
                                  image: controller.jobs[index].companyImage!,
                                  isActive: controller.jobs[index].active == 1
                                      ? true
                                      : false,
                                  companyId: controller.jobs[index].companyId!,
                                  jobId: controller.jobs[index].id!,
                                  
                                );
                              },
                            )
                    ],
                  ),
      ),
    ));
  }
}
