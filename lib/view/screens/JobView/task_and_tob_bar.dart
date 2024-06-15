import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/constants/animations.dart';
import 'package:projectoneuniversity/core/functions/alerts.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';

class TaskAndJobTobBar extends StatelessWidget {
  final void Function()? onDelete;
  const TaskAndJobTobBar({super.key, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Dimensions.screenWidth(context),
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.arrow_back),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    animationedAlertWithActions(AppAnimations.info,
                        "64".tr, onDelete!);
                  },
                  child: Container(
                      width: 35.w,
                      height: 40.h,
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.h, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.red[800],
                        size: 19.sp,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
