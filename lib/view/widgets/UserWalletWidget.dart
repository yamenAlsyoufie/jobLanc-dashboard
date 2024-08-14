import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/wallet_controller.dart';
import 'package:projectoneuniversity/core/constants/buttons.dart';
import 'package:projectoneuniversity/core/constants/custom_text_form_filed.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';

class UserWalletWidget extends StatelessWidget {
  final String name;
  final String email;
  final String image;
  final int id;
  final bool isSelected;
  final WalletController controller;
  const UserWalletWidget(
      {super.key,
      required this.name,
      required this.email,
      required this.image,
      required this.id,
      required this.isSelected,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth(context),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Row(children: [
            Container(
              width: 35.sp,
              height: 35.sp,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                // child:
                // Image.network(
                //   AppLinks.IP +"/"+ image,
                //   fit: BoxFit.cover,
                // )
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(name, style: TextStyles.w50013(context)),
          ]),
          // SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 25.w),
            child: Text(
              email,
              style: TextStyles.w40012grey(context),
              maxLines: 2,
            ),
          ),
          Visibility(
              visible: isSelected,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Customtextformfiled(
                    hintText: "balance".tr,
                    labelText: "",
                    iconData: null,
                    controller: controller.balance,
                    min: 1,
                    max: 5,
                    isNumber: true,
                    isPassword: false,
                    isFilled: true,
                    isBorder: false,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.chargeUser(
                        id,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 5.h),
                      width: 80.w,
                      height: 35.h,
                      alignment: Alignment.center,
                      decoration: AppButtons.buttonDecoration,
                      child: Text("confirm".tr,
                          style: TextStyles.w50013White(context)),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
