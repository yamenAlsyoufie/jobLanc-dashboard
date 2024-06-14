import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/constants/buttons.dart';
import 'package:projectoneuniversity/core/constants/colors.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';

class CompanyInfo extends StatelessWidget {
  final Image companyImage;
  final String companyName;
  final String numOfEmployees;
  final String jobType;
  final String jobTitle;
  final String remote;
  final String jobLocation;
  final Function() onTap;
  final String major;
  final bool isVisible;
  final String roleId;
  const CompanyInfo(
      {super.key,
      required this.companyImage,
      required this.companyName,
      required this.numOfEmployees,
      required this.jobType,
      required this.jobTitle,
      required this.jobLocation,
      required this.remote,
      required this.major,
      required this.isVisible,
      required this.onTap,
      required this.roleId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                //  Get.to(CompanyProfile(id: 3));
                },
                child: Container(
                  width: 50.w,
                  height: 60.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: ClipRRect(
                      child: companyImage,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    jobTitle,
                    style: TextStyles.w50017(context),
                  ),
                  Text(
                    companyName,
                    style: TextStyles.w50014(context),
                  ),
                  Row(
                    children: [
                      Text(
                        jobLocation + " - " + remote,
                        style: TextStyles.w40012grey(context),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Icon(Icons.work_outline, size: 18),
                    SizedBox(width: 8.w),
                    Text(
                      "major".tr + ": " + major,
                      style: TextStyles.w40012grey(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.apartment_outlined, size: 18),
                    SizedBox(width: 8.w),
                    Text(
                      "employees".tr + ": " + numOfEmployees,
                      style: TextStyles.w40012grey(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 18),
                    SizedBox(width: 8.w),
                    Text(
                      "2 weeks ago".tr,
                      style: TextStyles.w40012grey(context),
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
                      style: TextStyles.w40012grey(context),
                    ),
                  ],
                ),
              ]),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 65.h),
                    child: Container(
                      width: 90.w,
                      height: 30.h,
                      alignment: Alignment.center,
                      decoration: AppButtons.buttonDecoration,
                      child: Text(
                        roleId == "2" ? "applay".tr : "applicants".tr,
                        style: TextStyles.w50013White(context),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
