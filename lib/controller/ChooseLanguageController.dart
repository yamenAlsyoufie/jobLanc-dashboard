import 'package:get/get.dart';

class ChooseLanguageController extends GetxController {
  var isArabic = false.obs;

  void toggleLanguage(bool isArabicSelected) {
    isArabic.value = isArabicSelected;
  }
}