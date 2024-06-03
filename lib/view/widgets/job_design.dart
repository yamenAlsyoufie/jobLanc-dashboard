import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/constants/colors.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';

class JobDesign extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String location;
  final String date;
  final int jobId;
  final String remote;
  final String image;
  final bool isActive;
  const JobDesign(
      {super.key,
      required this.jobTitle,
      required this.companyName,
      required this.location,
      required this.date,
      required this.remote,
      required this.image,
      required this.isActive,
      required this.jobId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Get.to(JobInfo(id: jobId));
      },
      child: Container(
        width: Dimensions.screenWidth(context),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  width: 40.sp,
                  height: 40.sp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobTitle,
                      style: TextStyles.w50014(context),
                    ),
                    Text(
                      companyName,
                      style: TextStyles.w50012(context),
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      width: 160.w,
                      child: Text(
                        remote + " - " + location,
                        style: TextStyles.w40011grey(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    //SizedBox(height: 3.h),
                    Text(
                      date,
                      style: TextStyles.w4009grey(context),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.h, top: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 60.w,
                    height: 25.h,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 7.sp,
                          height: 7.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: isActive
                                  ? LightAppColors.greenColor
                                  : Colors.red[800]),
                        ),
                        Text(
                          isActive ? "active".tr : "inactive".tr,
                          style: TextStyles.w40010(context),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ).animate().fade(duration: 600.ms).slideY(begin: 0.5),
    );
  }
}
