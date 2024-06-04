import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              "Charge wallet",
              style: TextStyles.w50018(context),
            )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Text(
              "please enter the name of the user you want to charge its wallet",
              style: TextStyles.w40013grey(context),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Customtextformfiled(
            hintText: "username",
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
