import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/animations.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/functions/alerts.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';

import '../data/remote/add_project_or_product_back.dart';


abstract class ProjectScreenController extends GetxController {
  getData();
}

class ProjectScreenControllerImpl extends ProjectScreenController {
  final int id, projectId;
  final BuildContext context;
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController link;
  bool isProduct = true;
  StatusRequest? statusRequest, updateStatus;
  late String role, token;
  List<Map> images = [];

  List deletedImages = [], imagesId = [];
  AddProjectOrProductBack addProjectOrProductBack =
      new AddProjectOrProductBack(Get.put(Crud()));
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late int userId;
  Myservices myServices = Get.find();
  ProjectScreenControllerImpl(this.context,
      {required this.projectId, required this.id});

  void onInit() {
    statusRequest = StatusRequest.loading;
    update();
    title = TextEditingController();
    link = TextEditingController();
    description = TextEditingController();
    role = myServices.sharedPreferences.getString("role_id")!;
    token = myServices.sharedPreferences.getString("token")!;
    userId = myServices.sharedPreferences.getInt("id")!;
    if (role == "1") {
      isProduct = true;
    } else {
      isProduct = false;
    }
    getData();
    super.onInit();
  }

  void dispose() {
    title.dispose();
    description.dispose();
    link.dispose();
    super.dispose();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addProjectOrProductBack
        .getData({}, AppLinks.project + "/" + projectId.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        title.text = response['data']['project']['project_name'];
        description.text = response['data']['project']['project_description'];
        link.text = response['data']['project']['link'];
        for (int i = 0; i < response['data']['images'].length; i++) {
          imagesId.add(response['data']['images'][i]['id']);
          images.add({"network": response['data']['images'][i]['image_path']});
        }
      }
    } else {
      Get.back();
      animationedAlert(AppAnimations.wrong, "couldn'tloadinfo".tr);
    }
    update();
  }

  deleteData() async {
    Get.back();
    var response =
        await addProjectOrProductBack.deleteData(projectId.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
      }
    }else{
      animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
    }
  }

}
