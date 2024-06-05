import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/change_language.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/view/widgets/divider.dart';

class ChangeTheLanguage extends GetView<LanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          SafeArea(
              child: Row(
            children: [
              SizedBox(width: 10.w),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_outlined)),
              SizedBox(width: 10.w),
              Text(
                "changelanguage".tr,
                style: TextStyles.w50019(context),
              ),
            ],
          )),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              controller.changeLang("ar");
              Get.back();
            },
            child: Container(
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "arabic".tr,
                        style: TextStyles.bold17(context),
                      ),
                      Container(
                          width: 35.w,
                          height: 35.h,
                          child: Image.asset(ArabicIconChooseLanguage)),
                    ])),
          ),
          MyDivider(),
          GestureDetector(
            onTap: () {
              controller.changeLang("en");

              Get.back();
            },
            child: Container(
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "english".tr,
                    style: TextStyles.bold17(context),
                  ),
                  Container(
                      width: 35.w,
                      height: 35.h,
                      child: Image.asset(EnglishIconChooseLanguage))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
