import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/animations.dart';
import 'package:projectoneuniversity/core/functions/alerts.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/remote/JobTypeBack.dart';

class JobtypesController extends GetxController {
  TextEditingController arabicName = new TextEditingController();
  TextEditingController englishName = new TextEditingController();
  bool isAdding = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  List data = [];
  JobTypeBack jobTypeBack = new JobTypeBack(Get.put(Crud()));
  StatusRequest? statusRequest;
  SharedPrefrencesServices myServices = Get.find();
  late String token, lang;
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    lang = myServices.sharedPreferences.getString("lang")!;
    getJobTypes();
    super.onInit();
  }

  getJobTypes() async {
    statusRequest = StatusRequest.loading;
    var response = await jobTypeBack.getJobTypes(token, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    }
    update();
  }

  addJobType(BuildContext context) async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "61".tr);
      var response = await jobTypeBack.addJobType(
          token, {"name_AR": arabicName.text, "name_EN": englishName.text});
      statusRequest = handelingData(response);
      Get.back();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          animationedAlert(AppAnimations.done, "68".tr);
        }
      } else {
        animationedAlert(AppAnimations.wrong, "69".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "69".tr);
    }
  }
}
