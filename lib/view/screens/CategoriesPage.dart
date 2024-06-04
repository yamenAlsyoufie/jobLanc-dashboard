import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/CategoryController.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryControllerImpl());
    return Scaffold(
      body: GetBuilder<CategoryControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                  child: Text(
                    "30".tr,
                    style: TextStyles.w50018(context),
                  ),
                )),
                SizedBox(
                  height: 10.h,
                ),
                GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.categories.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.3),
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        // padding: EdgeInsets.all(8.sp),
                        margin: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color:
                                Theme.of(context).colorScheme.primaryContainer),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              AppLinks.IP +
                                  "/" +
                                  controller.categories[index].image!,
                              width: 35.w,
                              height: 35.h,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(controller.categories[index].name!),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
