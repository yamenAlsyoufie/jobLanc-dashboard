import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/model/add_review_back.dart';
import 'package:projectoneuniversity/data/model/job_info_model.dart';
import 'package:projectoneuniversity/data/model/project_or_product_model.dart';
import 'package:projectoneuniversity/data/model/review_model.dart';
import 'package:projectoneuniversity/data/remote/add_project_or_product_back.dart';
import 'package:projectoneuniversity/data/remote/job_info_back.dart';
import 'package:projectoneuniversity/data/remote/profile_back.dart';
import 'package:projectoneuniversity/data/remote/task_back.dart';
import '../../data/model/task_model.dart';

class CompanyProfileControllerImpl extends GetxController {
  final int id;
  StatusRequest? statusRequest, followStatus;
  late String language, token;
  SharedPrefrencesServices myServices = Get.find();
  AddProjectOrProductBack addProjectOrProductBack =
      AddProjectOrProductBack(Get.put(Crud()));
  Map data = {};
  List<TaskModel> tasks = [];
  List<JobModel> jobs = [];
  List<ReviewModel> reviews = [];
  AddReviewBack addReviewBack = new AddReviewBack(Get.put(Crud()));
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  List<ProjectOrProductModel> products = [];
  bool followed = false;
  JobBack jobBack = new JobBack(Get.put(Crud()));
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
    await getJobs();
    super.onInit();
  }

  getReviews() async {
    statusRequest = StatusRequest.loading;
    var response = await addReviewBack.getData({}, token, id.toString());
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

  getUserData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileBack.getData(token, id.toString(), language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        followed = data['followed'];
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


  getJobs() async {
    statusRequest = StatusRequest.loading;
    var response = await jobBack.getData(
        token,
        AppLinks.jobInfo +
            "?lang=" +
            language +
            "&&company_id=" +
            id.toString());
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var data in response['data']) {
          jobs.add(JobModel.fromJson(data));
        }
      }
    }
    update();
  }
}
