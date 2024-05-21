import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/view/PageViewFirst.dart';
import 'View/chooselanguage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      //translations: ChooseLanguagelocal(),
      //initialBinding: ChooseLanguageWithIntroBindings(),
      initialRoute: "/",
      home:PageViewFirst()
      ,
      getPages: [
        
      ],
      // home: chooselanguage(),
    );
  }
}
