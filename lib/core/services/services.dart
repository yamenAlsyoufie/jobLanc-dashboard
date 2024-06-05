import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<SharedPrefrencesServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => SharedPrefrencesServices().init());
}
