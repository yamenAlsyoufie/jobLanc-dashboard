import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projectoneuniversity/controller/ReportsPageController.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';
import 'package:projectoneuniversity/view/ReplyReport.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReportsPagecontrollerImpl());
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ReportsPagecontrollerImpl>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Text(
                  "reports".tr,
                  style: TextStyles.w50018(context),
                ),
              )),
              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.reports.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(Replyreport(
                            id: controller.reports[index]['user_id']));
                      },
                      child: Container(
                        width: Dimensions.screenWidth(context),
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color:
                                Theme.of(context).colorScheme.primaryContainer),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Jiffy.parse(
                                      controller.reports[index]['created_at'])
                                  .Hm
                                  .toString(),
                              style: TextStyles.w40012grey(context),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              controller.reports[index]['title'],
                              style: TextStyles.w50015(context),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              controller.reports[index]['body'],
                              style: TextStyles.w40013grey(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
