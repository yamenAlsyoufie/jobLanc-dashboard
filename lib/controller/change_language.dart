import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/services/services.dart';

class LanguageController extends GetxController {
  Locale? language;
  SharedPrefrencesServices myservices = Get.find();
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myservices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  void onInit() {
    String? sharedpreflang = myservices.sharedPreferences.getString("lang");
    if (sharedpreflang == "ar") {
      language = const Locale("ar");
    } else if (sharedpreflang == "en") {
      language = const Locale("en");
    } else {
      language = Locale("en");
    }
    super.onInit();
  }

  changeColor() {
    update();
  }
}
