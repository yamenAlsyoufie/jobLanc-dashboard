import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/profiles_controller/company_profile_controller.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/buttons.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/view/screens/UserProfile/company_profile/company_tab_bar.dart';
import 'package:projectoneuniversity/view/widgets/profile_tob_bar.dart';
import 'package:projectoneuniversity/view/widgets/tab_bar.dart';


class CompanyProfile extends StatelessWidget {
  final int id;
  const CompanyProfile({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyProfileControllerImpl(id: id));
    return Scaffold(
        body: GetBuilder<CompanyProfileControllerImpl>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? Container()
          : DefaultTabController(
              length: controller.tabs.length,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TobBar(
                          image: controller.data['image'],
                          name: controller.data['name'],
                          description: controller.data['major'],
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 40.h,
                                alignment: Alignment.center,
                                decoration: AppButtons.buttonDecoration,
                                child: Text("follow".tr,
                                    style: TextStyles.w50013White(context)),
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
                        ),
                      ],
                    ),
                  ),
                ],
                body: CompanyTabBar(
                  controller: controller,
                ),
              ),
            ),
    ));
  }
}
