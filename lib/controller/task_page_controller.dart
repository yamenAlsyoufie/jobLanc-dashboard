import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/functions/alerts.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/model/task_model.dart';
import 'package:projectoneuniversity/data/remote/task_back.dart';

import '../core/constants/animations.dart';


abstract class TaskPageController extends GetxController {
  getData();
  deleteData();
}

class TaskPageControllerImpl extends TaskPageController {
  final int id, taskId;
  final BuildContext context;
  StatusRequest? statusRequest, updateStatus;
  late String token;
  TaskModel task = TaskModel();
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late int userId;
  bool isEditing = false, isOwner = false;
  Myservices myServices = Get.find();
  TaskPageControllerImpl(this.context,
      {required this.taskId, required this.id});
  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    update();
    token = myServices.sharedPreferences.getString("token")!;
    userId = myServices.sharedPreferences.getInt("id")!;
    if (userId == id) {
      isOwner = true;
    }
    await getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack
        .getData({}, AppLinks.task + "/" + taskId.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        task = TaskModel.fromJson(response['data']);
      }
    } else {
      Get.back();
      animationedAlert(AppAnimations.wrong, "couldn'tloadinfo".tr);
    }
    update();
  }

  @override
  deleteData() async {
    Get.back();
    var response = await taskBack.deleteData(taskId.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        snackBar("", "yourtaskhasbeendeleted".tr, context);
        Get.back();
      } else {
        animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "couldn'tdelete".tr);
    }
  }


}
