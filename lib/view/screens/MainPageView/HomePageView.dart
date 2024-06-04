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
                      JobDesign(
                          jobTitle: "Ai developer",
                          companyName: "Google",
                          location: "Germany",
                          date: "5 days ago",
                          jobId: 2,
                          remote: "onsite".tr,
                          image: EnglishIconChooseLanguage,
                          isActive: true),
                      JobDesign(
                          jobTitle: "Flutter developer",
                          companyName: "Linkedin",
                          location: "United states",
                          date: "2 days ago",
                          jobId: 2,
                          remote: "remote".tr,
                          image: EnglishIconChooseLanguage,
                          isActive: true),
                      JobDesign(
                          jobTitle: "Java developer",
                          companyName: "Meta",
                          location: "United kingdomdawdw",
                          date: "2 weeks ago",
                          remote: "remote".tr,
                          jobId: 2,
                          image: EnglishIconChooseLanguage,
                          isActive: true),
                    ],
                  ),
      ),
    ));
  }
}
