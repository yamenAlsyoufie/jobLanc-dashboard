import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/constants/buttons.dart';
import 'package:projectoneuniversity/core/constants/colors.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';

Future<bool> exitAlert() {
  Get.defaultDialog(
      title: "",
      middleText: "warningbody".tr,
      middleTextStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
      actions: [
        TextButton(
          onPressed: () {
            exit(0);
          },
          child: Text(
            "yes".tr,
            style: const TextStyle(color: Colors.blue),
          ),
        ),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "no".tr,
              style: const TextStyle(color: Colors.blue),
            ))
      ]);
  return Future.value(false);
}

Future<bool> exitAlertt() async {
  return await (Get.defaultDialog(
          title: "",
          middleText: "warningbody".tr,
          middleTextStyle:
              TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          actions: [
            TextButton(
              onPressed: () {
                exit(0);
              },
              child: Text(
                "yes".tr,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "no".tr,
                  style: const TextStyle(color: Colors.blue),
                ))
          ])) ??
      false;
}

Future<bool> animationedAlertWithActions(
    var animation, String title, Function() onYesTap) {
  Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      titlePadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      content: animation != null
          ? Container(
              alignment: Alignment.topCenter, height: 100.h, child: animation)
          : null,
      barrierDismissible: false,
      actions: [
        TextButton(
            onPressed: onYesTap,
            child: Text(
              "yes".tr,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            )),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("no".tr,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)))
      ]);
  return Future.value(true);
}

deleteMessages(
    BuildContext context, void Function() func1, void Function() func2) {
  TextStyle style = TextStyle(
      fontSize: 12.sp,
      color: LightAppColors.primaryColor,
      fontWeight: FontWeight.w500);
  Get.defaultDialog(
      title: "",
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      buttonColor: LightAppColors.primaryColor,
      titlePadding: EdgeInsets.zero,
      confirmTextColor: LightAppColors.whiteColor,
      content: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: func1,
                child: Container(
                  child: Text(
                    "deleteforeveryone".tr,
                    style: style,
                  ),
                )),
            SizedBox(
              height: 3.h,
            ),
            GestureDetector(
                onTap: func2,
                child: Container(
                  child: Text(
                    "deleteforme".tr,
                    style: style,
                  ),
                )),
            SizedBox(
              height: 3.h,
            ),
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  child: Text(
                    "cancel".tr,
                    style: style,
                  ),
                ))
          ],
        ),
      ));
}

bool normalAlert(
  String title,
  String body,
  BuildContext context,
) {
  bool action = false;
  Get.defaultDialog(
      title: "",
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      buttonColor: LightAppColors.primaryColor,
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      confirmTextColor: LightAppColors.whiteColor,
      content: Text(
        body,
        style: TextStyles.w40012grey(context),
      ),
      barrierDismissible: true,
      actions: [
        TextButton(
            onPressed: () {
              action = true;
              Get.back();
            },
            child: Text("yes".tr)),
        TextButton(
            onPressed: () {
              action = false;
              Get.back();
            },
            child: Text("no".tr))
      ]);
  return action;
}


Future<double> rateDialog(String title, BuildContext context) async {
  var level = 4.0;
  Completer<double> completer = Completer<double>();

  await Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
    titlePadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
    content: Column(
      children: [
        RatingBar.builder(
          direction: Axis.horizontal,
          allowHalfRating: true,
          initialRating: 4,
          itemCount: 5,
          itemSize: 30,
          unratedColor: Colors.grey,
          itemBuilder: (context, index) {
            return Icon(
              Icons.star,
              size: 20.sp,
              color: Colors.yellow[700],
            );
          },
          onRatingUpdate: (rate) {
            level = rate;
          },
        ),
        SizedBox(height: 30.h),
        GestureDetector(
          onTap: () {
            completer.complete(level);
            Get.back();
          },
          child: Container(
            width: 90.w,
            height: 27.h,
            decoration: AppButtons.buttonDecoration,
            alignment: Alignment.center,
            child: Text(
              "confirm".tr,
              style: TextStyles.w50012White(context),
            ),
          ),
        ),
      ],
    ),
  );

  return completer.future;
}

Future<bool> animationedAlert(var animation, String title) {
  Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
    titlePadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
    content: animation != null
        ? Container(
            alignment: Alignment.center, height: 100.h, child: animation)
        : null,
    barrierDismissible: false,
  );
  return Future.value(true);
}

snackBar(String title, String message, BuildContext context) {
  Get.snackbar(title, message,
      duration: const Duration(seconds: 4),
      titleText: Text(
        title,
        style: TextStyles.w50012(context),
      ),
      borderWidth: 0.8,
      borderColor: LightAppColors.primaryColor,
      padding: EdgeInsets.only(bottom: 18.h, left: 10.w, right: 10.w, top: 0),
      messageText: Text(
        message,
        style: TextStyles.w50013(context),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w));
}

