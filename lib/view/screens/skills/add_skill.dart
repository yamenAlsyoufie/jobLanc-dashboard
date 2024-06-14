import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/skill_controller.dart';
import 'package:projectoneuniversity/core/constants/buttons.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';

import '../../../core/constants/custom_text_form_filed.dart';

class AddSkill extends StatelessWidget {
  final SkillController controller;
  const AddSkill({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.isAdding = !controller.isAdding;
        controller.update();
      },
      child: Container(
        width: Dimensions.screenWidth(context),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsetsDirectional.only(
            top: 15.h, bottom: 5.h, end: 5.w, start: 5.w),
        // alignment: AlignmentDirectional.centerStart,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("59".tr, style: TextStyles.w50015(context)),
                  Icon(Icons.add),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Visibility(
                visible: controller.isAdding,
                child: Container(
                    padding: EdgeInsets.all(5.sp),
                    child: Form(
                        key: controller.formState,
                        child: Column(children: [
                          Customtextformfiled(
                              hintText: "55".tr,
                              labelText: "",
                              iconData: null,
                              controller: controller.addedSkill,
                              min: 3,
                              max: 15,
                              isBorder: true,
                              isFilled: true,
                              isLabel: false,
                              filledColor:
                                  Theme.of(context).colorScheme.background,
                              isNumber: false,
                              isPassword: false),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {
                              controller.addSkill(context);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 50.w),
                              alignment: Alignment.center,
                              width: Dimensions.screenWidth(context),
                              height: 35.h,
                              decoration: AppButtons.buttonDecoration,
                              child: Text(
                                "54".tr,
                                style: TextStyles.w50013White(context),
                              ),
                            ),
                          )
                        ])))),
          ],
        ),
      ),
    );
  }
}
