import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/CategoryController.dart';
import 'package:projectoneuniversity/core/constants/buttons.dart';
import 'package:projectoneuniversity/core/constants/custom_text_form_filed.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    return Scaffold(
      body: GetBuilder<CategoryController>(
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
                    itemCount: controller.categories.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.3),
                    itemBuilder: (context, index) {
                      return index == controller.categories.length
                          ? GestureDetector(
                              onTap: () {
                                controller.isAdding = !controller.isAdding;
                                controller.update();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                // padding: EdgeInsets.all(8.sp),
                                margin: EdgeInsets.all(10.sp),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer),
                                child: controller.isAdding
                                    ? Icon(
                                        Icons.block,
                                        size: 25.sp,
                                      )
                                    : Icon(
                                        Icons.add,
                                        size: 25.sp,
                                      ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.topCenter,
                              // padding: EdgeInsets.all(8.sp),
                              margin: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 90.w, top: 10.h),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.deleteCategory(controller.categories[index].id!);
                                      },
                                      child: Icon(
                                        Icons.delete_outline,
                                        size: 18.sp,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
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
                SizedBox(height: 20.h),
                Visibility(
                    visible: controller.isAdding,
                    child: Container(
                      width: Dimensions.screenWidth(context),
                      //  margin: EdgeInsets.symmetric(horizontal: 5.w),
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                      child: Form(
                        key: controller.formState,
                        child: Column(
                          children: [
                            Customtextformfiled(
                              hintText: "35".tr,
                              labelText: "",
                              iconData: null,
                              controller: controller.englishName,
                              min: 3,
                              max: 20,
                              isNumber: false,
                              filledColor:
                                  Theme.of(context).colorScheme.background,
                              isPassword: false,
                              isFilled: true,
                              isLabel: false,
                              isBorder: true,
                            ),
                            Customtextformfiled(
                              hintText: "53".tr,
                              labelText: "",
                              iconData: null,
                              controller: controller.arabicName,
                              min: 3,
                              max: 20,
                              isNumber: false,
                              filledColor:
                                  Theme.of(context).colorScheme.background,
                              isPassword: false,
                              isFilled: true,
                              isLabel: false,
                              isBorder: true,
                            ),
                            SizedBox(height: 20.h),
                            GestureDetector(
                              onTap: () {
                                controller.pickImage();
                              },
                              child: Container(
                                  width: Dimensions.screenWidth(context) - 10,
                                  height: 60.h,
                                  alignment: AlignmentDirectional.centerStart,
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  padding: EdgeInsets.all(10.sp),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "36".tr,
                                        style: TextStyles.w50014(context),
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 18.sp,
                                      )
                                    ],
                                  )),
                            ),
                            Visibility(
                                visible: controller.image != null,
                                child: Container(
                                  width: 120.w,
                                  margin: EdgeInsets.symmetric(vertical: 20.h),
                                  height: 120.h,
                                  child: controller.image == null
                                      ? null
                                      : Image.file(
                                          File(controller.image.path),
                                          fit: BoxFit.cover,
                                        ),
                                )),
                            GestureDetector(
                              onTap: () {
                                controller.addCategory();
                              },
                              child: Container(
                                width: Dimensions.screenWidth(context),
                                height: 40.h,
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 40.w, vertical: 20.h),
                                decoration: AppButtons.buttonDecoration,
                                child: Text(
                                  "37".tr,
                                  style: TextStyles.w50016White(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
