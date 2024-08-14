import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/model/add_review_back.dart';
import 'package:projectoneuniversity/data/model/project_or_product_model.dart';
import 'package:projectoneuniversity/data/model/task_model.dart';
import 'package:projectoneuniversity/data/remote/add_project_or_product_back.dart';
import 'package:projectoneuniversity/data/remote/profile_back.dart';
import 'package:projectoneuniversity/data/remote/task_back.dart';

import '../../core/class/crud.dart';


class FreelancerProfileControllerImpl extends GetxController {
  StatusRequest? statusRequest, reviewStatus, followStatus;
  final int id;
  SharedPrefrencesServices myServices = Get.find();
  List<TaskModel> tasks = [];
  List<ProjectOrProductModel> projects = [];
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  Map data = {};
  bool followed = false;
  late String language, token;
  List<Widget> tabs = [
    Tab(
      text: "about".tr,
    ),
    Tab(text: "projects".tr),
    Tab(text: "tasks".tr),
    Tab(
      text: "skills".tr,
    ),
    Tab(text: "contact".tr),
  ];
  ProfileBack profileBack = new ProfileBack(Get.put(Crud()));
  AddProjectOrProductBack addProjectOrProductBack =
      new AddProjectOrProductBack(Get.put(Crud()));
  AddReviewBack addReviewBack = new AddReviewBack(Get.put(Crud()));
  FreelancerProfileControllerImpl({required this.id});
  List userSkills = [];
  @override
  void onInit() async {
    token = myServices.sharedPreferences.getString("token")!;
    language = myServices.sharedPreferences.getString("lang")!;
    await getUserData();
    await getSkills();
    await getProjects();
    await getTasks();
    super.onInit();
  }

  getTasks() async {
    statusRequest = StatusRequest.loading;
    var response = await taskBack.getData({},
        AppLinks.task + "?user_id=" + id.toString() + "&&lang=" + language,
        token);
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

  getProjects() async {
    statusRequest = StatusRequest.loading;
    var response = await addProjectOrProductBack
        .getData({}, AppLinks.project + "?user_id=" + id.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data'].length; i++) {
          projects.add(ProjectOrProductModel(
              id: response['data'][i]['id'],
              projectName: response['data'][i]['project_name'],
              projectDescription: response['data'][i]['project_description'],
              link: response['data'][i]['link'],
              userId: response['data'][i]['user_id']));
        }
        print(projects.length);
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
        followed = response['data']['followed'];
      }
    }
    update();
  }

  Future<void> getSkills() async {
    statusRequest = StatusRequest.loading;
    var response = await profileBack.getSkills(
      AppLinks.skills + "?id=" + id.toString(),
      token,
    );
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        userSkills.addAll(response['data']);
      }
    } else {}
    print(response);
    update();
  }
}
