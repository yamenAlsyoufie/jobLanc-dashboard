import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/remote/StatisticBack.dart';

class StatisticPageController extends GetxController {
  StatusRequest? statusRequest;
  late String token, lang;
  SharedPrefrencesServices myServices = Get.find();
  Statisticback statisticback = new Statisticback(Get.put(Crud()));
  List data = [];
  @override
  void onInit() async {
    token = myServices.sharedPreferences.getString("token")!;
    lang = myServices.sharedPreferences.getString("lang")!;
    await getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await statisticback.getStatistics(token, lang, {});
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    }
    update();
  }
}
