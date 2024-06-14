import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/profiles_controller/freelancer_profile_controller.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/buttons.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/view/screens/UserProfile/freelancer_profile/tab_bar_widgets.dart';
import 'package:projectoneuniversity/view/screens/status_screen.dart';
import 'package:projectoneuniversity/view/widgets/profile_tob_bar.dart';
import 'package:projectoneuniversity/view/widgets/tab_bar.dart';

class FreelancerProfile extends StatelessWidget {
  final int id;
  const FreelancerProfile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(FreelancerProfileControllerImpl(id: id));
    return Scaffold(
      body: GetBuilder<FreelancerProfileControllerImpl>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? Container()
            : controller.statusRequest == StatusRequest.success
                ? DefaultTabController(
                    length: controller.tabs.length,
                    child: NestedScrollView(
                        headerSliverBuilder: (BuildContext context,
                                bool innerBoxIsScrolled) =>
                            [
                              SliverToBoxAdapter(
                                  child: Column(children: [
                                TobBar(
                                  image: controller.data['image'] != null
                                      ? controller.data['image']
                                      : "",
                                  name: controller.data['first_name'] +
                                      " " +
                                      controller.data['last_name'],
                                  description: controller.data['major']['name'],
                                ),
                                SizedBox(height: 10.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        height: 40.h,
                                        alignment: Alignment.center,
                                        decoration: AppButtons.buttonDecoration,
                                        child: Text("follow".tr,
                                            style: TextStyles.w50013White(
                                                context)),
                                      )),
                                      SizedBox(width: 10.w),
                                  
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 0.5,
                                ),
                                TabBarWidget(
                                  tabs: controller.tabs,
                                )
                              ]))
                            ],
                        body: TabBarWidgets(
                          controller: controller,
                        )),
                  )
                : StatusScreen(statusRequest: controller.statusRequest),
      ),
    );
  }
}