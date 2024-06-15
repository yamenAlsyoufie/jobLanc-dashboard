import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/model/project_or_product_model.dart';
import 'package:projectoneuniversity/data/model/review_model.dart';
import 'package:projectoneuniversity/data/remote/add_project_or_product_back.dart';
import 'package:projectoneuniversity/data/remote/add_review_back.dart';
import 'package:projectoneuniversity/data/remote/profile_back.dart';
import 'package:projectoneuniversity/data/remote/task_back.dart';
import '../../data/model/task_model.dart';

abstract class CompanyProfileController extends GetxController {
  getReviews();
  getProduts();
  getUserData();
  getTasks();
}

class CompanyProfileControllerImpl extends CompanyProfileController {
  final int id;
  StatusRequest? statusRequest;
  late String language, token;
  SharedPrefrencesServices myServices = Get.find();
  AddProjectOrProductBack addProjectOrProductBack =
      AddProjectOrProductBack(Get.put(Crud()));
  ReviewBack reviewBack = new ReviewBack(Get.put(Crud()));
  Map data = {};
  List<ReviewModel> reviews = [];
  List<TaskModel> tasks = [];
  TaskBack taskBack = new TaskBack(Get.put(Crud()));

  List<ProjectOrProductModel> products = [];
  List<Widget> tabs = [
    Tab(
      text: "jobs".tr,
    ),
    Tab(
      text: "tasks".tr,
    ),
    Tab(text: "about".tr),
    Tab(text: "products".tr),
    Tab(text: "contact".tr)
  ];
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));

  CompanyProfileControllerImpl({required this.id});
  @override
  void onInit() async {
    language = myServices.sharedPreferences.getString("lang")!;
    token = myServices.sharedPreferences.getString("token")!;
    await getUserData();
    await getProduts();
    await getReviews();
    await getTasks();
    super.onInit();
  }

  getReviews() async {
    statusRequest = StatusRequest.loading;
    var response = await reviewBack.getData({}, token, id.toString());
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var reviewData in response['data']) {
          reviews.add(ReviewModel.fromJson(reviewData));
        }
      }
    }
    update();
  }

  getTasks() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack
        .getData({}, AppLinks.task + "?user_id" + id.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var reviewData in response['data']) {
          tasks.add(TaskModel.fromJson(reviewData));
        }
      }
    }
    update();
  }

  getUserData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileBack.getData(token, id.toString(), language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    }
    update();
  }

  getProduts() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addProjectOrProductBack.getData({}, AppLinks.project, token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var reviewData in response['data']) {
          products.add(ProjectOrProductModel.fromJson(reviewData));
        }
      }
    }
    update();
  }
}
