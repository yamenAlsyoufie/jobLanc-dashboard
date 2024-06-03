import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/constants/colors.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/view/screens/job_info/task_and_tob_bar.dart';


class TaskTobBar extends StatelessWidget {
  final String userImage;
  final String userName;
  final String taskTitle;
  final String major;
  final String budget;
  final int id;
  final String duration;
  final bool isActive, isOwner;
  final void Function()? onDelete;
  const TaskTobBar(
      {super.key,
      required this.userImage,
      required this.userName,
      required this.taskTitle,
      required this.major,
      required this.isActive,
      required this.budget,
      required this.duration,
      required this.id,
      required this.isOwner,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TaskAndJobTobBar(
          onDelete: onDelete,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                //      Get.to(CompanyProfile(id: id));
                    },
                    child: Container(
                      width: 45.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                          child: Image.network(
                            AppLinks.IP + userImage,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              taskTitle,
                              style: TextStyles.w50015(context),
                            ),
                            Text(
                              userName,
                              style: TextStyles.w50013(context),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 15.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              size: 15.sp,
                              color: LightAppColors.greyColor,
                            ),
                            Text(
                              budget,
                              style: TextStyles.w40011grey(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              size: 15.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "excutingtime".tr + " : ",
                              style: TextStyles.w40011grey(context),
                            ),
                            Text(
                              duration + " " + "days".tr,
                              style: TextStyles.w40011grey(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work_outline, size: 15.sp),
                            SizedBox(width: 8.w),
                            Text(
                              "major".tr + ": " + major,
                              style: TextStyles.w40011grey(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month_outlined, size: 15.sp),
                            SizedBox(width: 8.w),
                            Text(
                              "2 weeks ago".tr,
                              style: TextStyles.w40011grey(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 10.w,
                              height: 12.h,
                              margin: EdgeInsetsDirectional.only(start: 2.w),
                              decoration: BoxDecoration(
                                  color: LightAppColors.greenColor,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "active".tr,
                              style: TextStyles.w40011grey(context),
                            ),
                          ],
                        ),
                      ]),
               
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
