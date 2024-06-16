import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/constants/colors.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/view/screens/TaskView/task_page.dart';


class TaskDesign extends StatelessWidget {
  final String taskTitle;
  final String userName;
  final String major;
  final String date;
  final String duration;
  final String aboutTask;
  final String image;
  final bool isActive;
  final int taskId, id;

  const TaskDesign(
      {super.key,
      required this.taskTitle,
      required this.userName,
      required this.major,
      required this.date,
      required this.duration,
      required this.image,
      required this.isActive,
      required this.aboutTask,
      required this.taskId,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(TaskPage(
          taskId: taskId,
          id: id,
        ));
      },
      child: Container(
        alignment: Alignment.topRight,
        width: 240.w,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: LightAppColors.greyColor!, width: 0.5),
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                             AppLinks.IP+ image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              taskTitle,
                              style: TextStyles.w50013(context),
                            ),
                            //SizedBox(height: .h),
                            Text(
                              userName,
                              style: TextStyles.w50012(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_filled,
                          size: 12.sp,
                          color: LightAppColors.greyColor,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          duration + " " + "days".tr,
                          style: TextStyles.w40010grey(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                          size: 12.sp,
                          color: LightAppColors.greyColor,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          major,
                          style: TextStyles.w40010grey(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 60.w,
                        height: 25,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
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
            SizedBox(height: 15.h),
            Text(
              aboutTask,
              style: TextStyles.w40010grey(context),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
