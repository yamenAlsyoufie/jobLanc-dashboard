import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/model/job_info_model.dart';
import 'package:projectoneuniversity/data/model/task_model.dart';
import 'package:projectoneuniversity/data/remote/AdminHomePageBack.dart';
import 'package:projectoneuniversity/data/remote/job_info_back.dart';
import 'package:projectoneuniversity/data/remote/task_back.dart';



class AdminHomePageControllerImpl extends GetxController {
  StatusRequest? statusRequest;
  AdminHomePageBack freeLnacerHomePageBack =
      new AdminHomePageBack(Get.put(Crud()));
  String? token, id, lang;
  SharedPrefrencesServices myServices = Get.find();
  List<TaskModel> tasks = [];
  List<JobModel> jobs = [];
  TaskBack taskBack = TaskBack(Get.put(Crud()));
  JobBack jobBack = JobBack(Get.put(Crud()));
  @override
  void onInit() async {
    token = myServices.sharedPreferences.getString("token")!;
    lang = myServices.sharedPreferences.getString('lang')!;
    super.onInit();
    await getTasks();
    await getJobs();
  }

   getTasks() async {
    statusRequest = StatusRequest.loading;
    var response =
        await taskBack.getData({}, AppLinks.task + "?lang=" + lang!, token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data'].isNotEmpty)
          for (var data in response['data']) {
            tasks.add(TaskModel.fromJson(data));
          }
      }
    }
    update();
  }

  getJobs() async {
    statusRequest = StatusRequest.loading;
    var response =
        await jobBack.getData(token, AppLinks.jobInfo + "?lang=" + lang!);
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
