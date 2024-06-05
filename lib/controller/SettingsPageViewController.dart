import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/services/services.dart';

abstract class SettingsPageViewController extends GetxController {
  changeMode(String theme);
}

class SettingsPageViewControllerImpl extends SettingsPageViewController {
  SharedPrefrencesServices myServices = Get.find();
  late ThemeMode themeMode;
  late bool isDarkMode;
  @override
  changeMode(String theme) {
    ThemeMode mode;
    if (theme == "dark") {
      mode = ThemeMode.dark;
      isDarkMode = true;
    } else {
      mode = ThemeMode.light;
      isDarkMode = false;
    }
    myServices.sharedPreferences.setString("mode", theme);
    Get.changeThemeMode(mode);
    update();
  }

  @override
  void onInit() {
    String? sharedpreflang = myServices.sharedPreferences.getString("mode");
    if (sharedpreflang == "dark") {
      themeMode = ThemeMode.dark;
      isDarkMode = true;
    } else if (sharedpreflang == "light") {
      themeMode = ThemeMode.light;
      isDarkMode = false;
    } else {
      themeMode = ThemeMode.light;
      myServices.sharedPreferences.setString("mode", "light");
    }
    super.onInit();
  }
}
