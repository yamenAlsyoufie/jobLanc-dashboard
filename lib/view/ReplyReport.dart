import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/ReportsPageController.dart';
import 'package:projectoneuniversity/core/constants/buttons.dart';
import 'package:projectoneuniversity/core/constants/custom_text_form_filed.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';

class Replyreport extends StatelessWidget {
  final int id;
  const Replyreport({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ReportsPagecontrollerImpl>(
          builder: (controller) => Form(
            key: controller.formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  child: Text(
                    "38".tr,
                    style: TextStyles.w50018(context),
                  ),
                )),
                Customtextformfiled(
                  hintText: "39".tr,
                  labelText: "",
                  iconData: null,
                  controller: controller.title,
                  min: 2,
                  max: 20,
                  isNumber: false,
                  isPassword: false,
                  isFilled: true,
                  isBorder: true,
                  isLabel: false,
                ),
                Customtextformfiled(
                  hintText: "40".tr,
                  labelText: "",
                  iconData: null,
                  controller: controller.body,
                  min: 10,
                  max: 200,
                  maxLines: 5,
                  textInputAction: TextInputAction.newline,
                  isNumber: false,
                  isPassword: false,
                  isFilled: true,
                  isBorder: true,
                  isLabel: false,
                ),
                GestureDetector(
                  onTap: () {
                    controller.sendReply(id, context);
                  },
                  child: Container(
                    width: Dimensions.screenWidth(context),
                    height: 40.h,
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
                    decoration: AppButtons.buttonDecoration,
                    child: Text(
                      "43".tr,
                      style: TextStyles.w50016White(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
