import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/ChooseLanguageController.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/view/screens/Intros/PageViewIntros.dart';
import 'package:projectoneuniversity/view/widgets/LanguageButton%20.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class ChooseLanguage extends StatelessWidget {
  ChooseLanguageController controller = Get.put(ChooseLanguageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '1'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                mainImageChooseLanguage, // Add your illustration image asset here
                height: 200,
              ),
              SizedBox(height: 20),
              // Obx(
              // () =>
              LanguageButton(
                //this class i create it and it show in static file
                text: '2'.tr,
                flagAsset:
                    ArabicIconChooseLanguage, // Add your Arabic flag image asset here
                onPressed: () {
                  Get.updateLocale(Locale('ar', 'SA'));
                  //controller.toggleLanguage(true);
                },
                // )
              ),
              SizedBox(height: 10),
              //  Obx(
              //() =>
              LanguageButton(
                text: '3'.tr,
                flagAsset:
                    EnglishIconChooseLanguage, // Add your English flag image asset here
                onPressed: () {
                  Get.updateLocale(Locale('en', 'US'));
                },
              ),
              //),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Get.to(PageViewIntros());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  '4'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        );
  }
}
