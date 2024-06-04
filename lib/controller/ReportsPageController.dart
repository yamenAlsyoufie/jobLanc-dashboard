import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/functions/alerts.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/remote/ReportsBack.dart';

abstract class ReportsPagecontroller extends GetxController {
  getReports();
}

class ReportsPagecontrollerImpl extends ReportsPagecontroller {
  Myservices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ReportsBack reportBack = new ReportsBack(Get.put(Crud()));
  late String token;
  late String language;
  StatusRequest? statusRequest, sendReplyStatus;
  TextEditingController title = new TextEditingController();
  TextEditingController body = new TextEditingController();
  List reports = [];
  var image;
  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    getReports();
    super.onInit();
  }

  @override
  getReports() async {
    statusRequest = StatusRequest.loading;
    var response = await reportBack.getReports(token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        reports.addAll(response['data']);
      }
    }
    update();
  }

  sendReply(int id, BuildContext context) async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      sendReplyStatus = StatusRequest.loading;
      var response = await reportBack.sendReply(token,
          {"title": title.text, "body": body.text, "user_id": id.toString()});
      sendReplyStatus = handelingData(response);
      Get.back();
      if (StatusRequest.success == sendReplyStatus) {
        if (response['status'] == "success") {
          title.clear();
          body.clear();
          snackBar("", "41".tr, context);
        } else {
          snackBar("", "42".tr, context);
        }
      } else {
        snackBar("", "42".tr, context);
      }
    }
    update();
  }
}
