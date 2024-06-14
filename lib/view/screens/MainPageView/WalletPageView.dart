import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/constants/custom_text_form_filed.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';

class WalletPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: SafeArea(
                child: Text(
              "47".tr,
              style: TextStyles.w50018(context),
            )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Text(
              "46".tr,
              style: TextStyles.w40013grey(context),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Customtextformfiled(
            hintText: "48".tr,
            labelText: "",
            iconData: Icons.person_outline,
            controller: null,
            min: 2,
            max: 30,
            isNumber: false,
            isPassword: false,
            isFilled: true,
            isBorder: true,
            isLabel: false,
            isValidation: false,
          )
        ],
      ),
    ));
  }
}
