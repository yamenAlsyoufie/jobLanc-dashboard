import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/StatisticPageController.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/colors.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/view/widgets/chart.dart';
import 'package:projectoneuniversity/view/widgets/statistics_container.dart';

// ignore: must_be_immutable
class StatisticsPageView extends StatelessWidget {
  StatisticsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(StatisticPageController());
    return Scaffold(
        body: SingleChildScrollView(
      child: GetBuilder<StatisticPageController>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  TopBar(name: "Admin", image: EnglishIconChooseLanguage),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 10.w, vertical: 10.h),
                    child: SafeArea(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Overview".tr,
                          style: TextStyles.w50018(context),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsetsDirectional.only(end: 10.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(EnglishIconChooseLanguage)),
                        ),
                      ],
                    )),
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10.w, bottom: 10.h, top: 10.h),
                    child: Text(
                      "7".tr,
                      style: TextStyles.w50017(context),
                    ),
                  ),
                  GridView.builder(
                    itemCount: controller.statistics.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var entry = controller.statistics[index].entries.first;
                      return StatisticsContainer(
                        title: entry.key,
                        content: Text(
                          entry.value.toString(),
                          style: TextStyle(
                              color: LightAppColors.primaryColor,
                              fontSize: 14.sp),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.7),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ChartContainer(
                      title: "77".tr,
                      content: Container(
                        width: Dimensions.screenWidth(context) - 30,
                        height: 300.h,
                        child: Chart(
                          ordersFirstWeek: controller.freelancers[0]
                              ['num_of_freelancers'],
                          ordersFourthWeek: controller.freelancers[1]
                              ['num_of_freelancers'],
                          ordersSecondWeek: controller.freelancers[2]
                              ['num_of_freelancers'],
                          ordersThirdWeek: controller.freelancers[3]
                              ['num_of_freelancers'],
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  ChartContainer(
                      title: "76".tr,
                      content: Container(
                        width: Dimensions.screenWidth(context) - 30,
                        height: 300.h,
                        child: Chart(
                          ordersFirstWeek: controller.companies[0]
                              ['num_of_companies'],
                          ordersFourthWeek: controller.companies[1]
                              ['num_of_companies'],
                          ordersSecondWeek: controller.companies[2]
                              ['num_of_companies'],
                          ordersThirdWeek: controller.companies[3]
                              ['num_of_companies'],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10.w, top: 20.h, bottom: 10.h),
                    child: Text(
                      "51".tr,
                      style: TextStyles.w50017(context),
                    ),
                  ),
                  // FreeLancerDesign(
                  //     name: "Salah Aldeen Mdaghmesh",
                  //     bio: "The best in the east and west",
                  //     location: "Syria",
                  //     image: EnglishIconChooseLanguage,
                  //     major: "Technology",
                  //     id: 2,
                  //     rateLevel: 5,
                  //     numOfRates: 3,
                  //     openToWork: 1),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10.w, top: 10.h, bottom: 10.h),
                    child: Text(
                      "52".tr,
                      style: TextStyles.w50017(context),
                    ),
                  ),
                  // FreeLancerDesign(
                  //     name: controller.companyOfThemonth['name'],
                  //     bio: controller.companyOfThemonth['email'],
                  //     location: controller.companyOfThemonth['location'],
                  //     image: controller.companyOfThemonth['image'],
                  //     major: controller.companyOfThemonth['major']['name'],
                  //     id: controller.companyOfThemonth['id'],
                  //     rateLevel: 5,
                  //     numOfRates: 3,
                  //     openToWork: 0)
                ],
              ),
      ),
    ));
  }
}
