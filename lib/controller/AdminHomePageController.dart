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
    //token = myservices.sharedPreferences.getString("token")!;
    super.onInit();
    await getTasks();
  }

  getTasks() async {
    statusRequest = StatusRequest.loading;
    var response =
        await taskBack.getData({}, AppLinks.task + "?user_id=2", "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjczYWQzNmE4MTc4ZjUwZGNlNTA2YzI3ZTgxZjhhNzc2OGU4ZDFkODNiODFlOGJlZWQyY2MyZjY2ODg0Mzc2NTZhMTJjYTUwOWI3ZDQ2YTkiLCJpYXQiOjE3MTY5MjY0OTQuMDM4MDA2LCJuYmYiOjE3MTY5MjY0OTQuMDM4MDIxLCJleHAiOjE3NDg0NjI0OTMuNjYzNjIyLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.Dg9fWhyNFvDhuzta2-lz5jg_Tin4Si9viW8pAmWabO-hs237oHKoLFuK2e45tp89lPuS2IOcAy5ZA40Cmw2i-NxY5VjJ7gX86P4knE8VJs6HPJvH6BmqWkW30eqLBwp1fiRz6UaJM41eG5JFnvhCkK6FsSRk1fVDk5rNpGrWQGjxNUgY6iLaqO8Pzb4HHhnSBqB7vYed6ZdIzQV1CXvVBzk3eFuzJQOQ5f6M6t0FAX3_Gnd4VFBPJEuFWex3k-LPB3qcD1Jz1ATRx2p8lh3_79j4yLDo3OTfbwSmwH9jihVhrnuwGxXgXpJQiCi3DCd7RSjPsJWrgUNYWVTtIx9LUmgwXEMnJhGyLclO7NfMKxdkrwwTATtRJSUALluDdSGmj9uzhOjBJrYkQBw63SlJNHkVxQC2lZbEhojVK7Qyl80MspqfoOCz0u_HuZUgG1dM7esJ9WGq3PaBknVeEGEW6Sh6kCF6QhTWRCj-NdiDDOVzZ7i1J6B1ELmiHua9KwWB2O0KXeOrnlwULxhpxlnfMHVVmhvZKUuLLgPziBkdbMva8jvWFEkkagENYlZQ5nYfV5Xuq7vXXL21s0MPX-Rlx3vDARxQUTApBVF5ghpsg3i_eLH5aVPq5NR89eykw4yQqPOS_X_vV8iTS8UeHF9uMG2B3rf-hKPaUJUX9VcZd88");
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
