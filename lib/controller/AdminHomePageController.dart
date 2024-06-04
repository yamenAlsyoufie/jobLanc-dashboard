import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/model/task_model.dart';
import 'package:projectoneuniversity/data/remote/freelancer_home_page_back.dart';
import 'package:projectoneuniversity/data/remote/task_back.dart';

abstract class AdminHomePageController extends GetxController {
  getJobs();
  getTasks();
}

class AdminHomePageControllerImpl extends AdminHomePageController {
  StatusRequest? statusRequest;
  AdminHomePageBack freeLnacerHomePageBack =
      new AdminHomePageBack(Get.put(Crud()));
  String? token, id;
  Myservices myservices = Get.find();
  List<TaskModel> tasks = [];
  TaskBack taskBack = new TaskBack(Get.put(Crud()));
  @override
  void onInit() async {
    token = myservices.sharedPreferences.getString("token")!;
    super.onInit();
    await getTasks();
  }

  getTasks() async {
    statusRequest = StatusRequest.loading;
    var response =
        await taskBack.getData({}, AppLinks.task + "?user_id=2", token);
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

  @override
  getJobs() {
    throw UnimplementedError();
  }
}
