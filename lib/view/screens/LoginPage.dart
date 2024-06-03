import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/login_controller.dart';
import 'package:projectoneuniversity/core/constants/custom_text_form_filed.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImpl());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<LogInControllerImpl>(
        builder: (controller) => Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            margin: EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  LoginPageImage, // Ensure you have this image in your assets folder
                  height: 150,
                ),
                SizedBox(height: 16.0),
                Text(
                  // text (welcome to admin app)
                  '15'.tr,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 60.0), // text field Email
                Customtextformfiled(
                    hintText: "16".tr,
                    labelText: "",
                    iconData: Icons.person,
                    controller: controller.emailController,
                    min: 10,
                    max: 30,
                    isNumber: false,
                    isFilled: true,
                    isBorder: true,
                    isLabel: false,
                    isPassword: false),
                Customtextformfiled(
                    hintText: "17".tr,
                    labelText: "",
                    iconData: Icons.person,
                    controller: controller.emailController,
                    min: 10,
                    max: 30,
                    isNumber: false,
                    isFilled: true,
                    isBorder: true,
                    isLabel: false,
                    isPassword: false),
                SizedBox(height: 100.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.logIn();
                    },
                    child: Text(
                      '18'.tr,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
