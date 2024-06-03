import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/functions/alerts.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/remote/login_back.dart';

import '../core/constants/animations.dart';


abstract class LogiInController extends GetxController {
  logIn();
  goToHomePage();
  showPassword();
}

class LogInControllerImpl extends LogiInController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController ip = new TextEditingController();
  late TextEditingController phoneController;
  LoginBack loginBata = LoginBack(Get.put(Crud()));
  StatusRequest? statusRequest;
  Myservices myServices = Get.find();
  bool isshown = true;
  double containerWidth = 300.w;
  String deviceToken = "";

  @override
  goToHomePage() {
    update();
    Get.offAllNamed("HomePage");
  }

  @override
  showPassword() {
    isshown = !isshown;
    update();
  }

  saveUserData(Map data) {
    myServices.sharedPreferences.setInt("id", data["id"]);
    myServices.sharedPreferences.setString("token", data["accessToken"]);
    myServices.sharedPreferences.setString("step", "2");
    myServices.sharedPreferences.setString("ip", ip.text);
  }

  @override
  logIn() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      AppLinks.IP = ip.text;
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "pleasewait".tr);
      var response = await loginBata.login({
        "email": emailController.text,
        "password": passwordController.text,
        "device_token": deviceToken
      });
      statusRequest = handelingData(response);
      Get.back();

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          saveUserData(response['data']);
          Get.offNamed("HomePage");
        }else {
          animationedAlert(AppAnimations.wrong, "wronglogin".tr);
          update();
        }
      } else {
        animationedAlert(AppAnimations.wrong, "errorloggingin".tr);
        update();
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  
}
