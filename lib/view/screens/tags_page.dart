import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/tags_controller.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/view/widgets/divider.dart';

class TagsPage extends StatelessWidget {
  const TagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TagsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            SafeArea(
                child: Row(
              children: [
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "74".tr,
                  style: TextStyles.w50018(context),
                ),
              ],
            )),
            SizedBox(height: 20.h),
            GetBuilder<TagsController>(
              builder: (controller) => controller.tags.length == 0
                  ? Center(
                      child: Padding(
                      padding: EdgeInsets.only(top: 300.h),
                      child: Text(
                        "There are no tags",
                        style: TextStyles.w40013grey(context),
                      ),
                    ))
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.tags.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.tags[index]['name'],
                                        style: TextStyles.w50013(context),
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        "(" +
                                            controller.tags[index]['count']
                                                .toString() +
                                            ")",
                                        style: TextStyles.w40011grey(context),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        controller.addTag(
                                            context,
                                            controller.tags[index]['id'],
                                            index);
                                      },
                                      child: Icon(Icons.add))
                                ],
                              ),
                            ),
                            MyDivider()
                          ],
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}
