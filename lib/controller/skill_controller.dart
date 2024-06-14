import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/functions/alerts.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/remote/skill_back.dart';
import '../core/constants/animations.dart';

class SkillController extends GetxController {
  StatusRequest? statusRequest, addStatusRequest;
  late String token;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  SharedPrefrencesServices myServices = Get.find();
  TextEditingController addedSkill = TextEditingController();
  TextEditingController serchSkill = TextEditingController();
  SkillBack skillBack = SkillBack(Get.put(Crud()));
  bool isAdding = false;
  List skills = [];
  @override
  void onInit() async {
    token = myServices.sharedPreferences.getString("token")!;
    super.onInit();
  }

  getSkills() async {
    skills.clear();
    update();
    if (serchSkill.text != "") {
      statusRequest = StatusRequest.loading;
      var response = await skillBack.getSkills(token,
          "${AppLinks.IP}/api/skills/search", {"search": serchSkill.text});
      statusRequest = handelingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          skills.addAll(response['data']);
          update();
        }
      }
    }
  }

  addSkill(BuildContext context) async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      addStatusRequest = StatusRequest.loading;
      animationedAlert(AppAnimations.loadings, "61".tr);
      var response = await skillBack.addSkill(token, {"name": addedSkill.text});
      addStatusRequest = handelingData(response);
      Get.back();
      if (StatusRequest.success == addStatusRequest) {
        if (response['status'] == "success") {
          addedSkill.clear();
          snackBar("", "57".tr, context);
        } else {
          animationedAlert(AppAnimations.wrong, "58".tr);
        }
      } else {
        animationedAlert(AppAnimations.wrong, "58".tr);
      }
    }

    update();
  }

  deleteSkill(int id, BuildContext context) async {
    Get.back();
    StatusRequest skillStatus = StatusRequest.loading;
    var response = await skillBack.deleteSkill(token, id.toString());
    skillStatus = handelingData(response);
    if (StatusRequest.success == skillStatus) {
      if (response['status'] == "success") {
        animationedAlert(AppAnimations.done, "62".tr);
      } else {
        animationedAlert(AppAnimations.wrong, "63".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "63".tr);
    }
    update();
  }
}
