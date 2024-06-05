import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/change_language.dart';
import 'package:projectoneuniversity/controller/dark_mode.dart';
import 'package:projectoneuniversity/core/localization.dart';
import 'package:projectoneuniversity/core/middlewere/midlleware.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/core/themes/app_theme.dart';
import 'package:projectoneuniversity/view/screens/LoginPage.dart';
import 'package:projectoneuniversity/view/screens/MainPageView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    DarkModeImpl themeController = Get.put(DarkModeImpl());
    LanguageController controller = Get.put(LanguageController());
    return ScreenUtilInit(
      designSize: const Size(320, 790),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeController.themeMode,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        locale: controller.language,
        translations: localization(),
        initialRoute: "/",
        getPages: [
          GetPage(
              name: "/", page: () => LoginPage(), middlewares: [MiddleWare()]),
          GetPage(name: "/HomePage", page: () => MainPageView()),
          GetPage(name: "/Login", page: () => LoginPage()),
        ],
        // home: chooselanguage(),
      ),
    );
  }
}
