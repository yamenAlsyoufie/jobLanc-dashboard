import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/functions/alerts.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/remote/login_back.dart';
import 'package:projectoneuniversity/view/screens/MainPageView.dart';
import '../core/constants/animations.dart';

abstract class LogiInController extends GetxController {
  login();
  goToHomePage();
  showPassword();
}

class LogInControllerImpl extends LogiInController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email, password;
  LoginBack loginData = LoginBack(Get.put(Crud()));
  StatusRequest? statusRequest;
  SharedPrefrencesServices myServices = Get.find();
  bool isShown = true;
  String deviceToken = "da";

  @override
  goToHomePage() {
    update();
    Get.offAllNamed("HomePage");
  }

  @override
  showPassword() {
    isShown = !isShown;
    update();
  }

  saveUserData(Map data) {
    myServices.sharedPreferences.setInt("id", data["id"]);
    myServices.sharedPreferences.setString("token", data["accessToken"]);
    myServices.sharedPreferences.setString("step", "2");
  }

  @override
  login() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "pleasewait".tr);
      var response = await loginData.login({
        "email": email.text,
        "password": password.text,
        "device_token": "da"
      });
      statusRequest = handelingData(response);
      Get.back();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['role_id'] != 1) {
            animationedAlert(AppAnimations.wrong, "44".tr);
            return;
          }
          saveUserData(response['data']);
          Get.off(MainPageView());
        } else {
          animationedAlert(AppAnimations.wrong, "44".tr);
          update();
        }
      } else {
        animationedAlert(AppAnimations.wrong, "45".tr);
        update();
      }
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
