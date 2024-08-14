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

class TagsController extends GetxController {
  StatusRequest? statusRequest, addStatusRequest;
  late String token;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  SharedPrefrencesServices myServices = Get.find();
  SkillBack skillBack = SkillBack(Get.put(Crud()));
  bool isAdding = false;
  List tags = [];
  @override
  void onInit() async {
    token = myServices.sharedPreferences.getString("token")!;
    getTags();
    super.onInit();
  }

  getTags() async {
    statusRequest = StatusRequest.loading;
    var response =
        await skillBack.getSkillsTags(token, "${AppLinks.IP}/api/tag", {});
    statusRequest = handelingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        tags.addAll(response['data']);
      }
    }
    update();
    print(statusRequest);
  }

  addTag(BuildContext context, int id,int index) async {
    addStatusRequest = StatusRequest.loading;
    var response = await skillBack.addSkillTag(
        token, {}, "${AppLinks.IP}/api/tag/addToSkills/" + id.toString());
    addStatusRequest = handelingData(response);
    if (StatusRequest.success == addStatusRequest) {
      if (response['status'] == "success") {
        snackBar("", "72".tr, context);
        tags.removeAt(index);
      } else {
        animationedAlert(AppAnimations.wrong, "73".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "73".tr);
    }
    update();
  }
}
