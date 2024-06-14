import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/SettingsPageViewController.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';
import 'package:projectoneuniversity/view/screens/CategoriesPage.dart';
import 'package:projectoneuniversity/view/screens/ChangeLanguage.dart';
import 'package:projectoneuniversity/view/screens/ReportsPage.dart';
import 'package:projectoneuniversity/view/screens/skills/skills.dart';
import 'package:projectoneuniversity/view/widgets/divider.dart';
import 'package:projectoneuniversity/view/widgets/list_tile.dart';

class SettingsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SettingsPageViewControllerImpl());
    return Scaffold(
        body: SingleChildScrollView(
      child: GetBuilder<SettingsPageViewControllerImpl>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Icon(Icons.person, size: 120.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Joblance Admin",
              style: TextStyles.w50015(context),
            ),
            SizedBox(
              height: 30.h,
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w, bottom: 10.h),
                child: Text("24".tr, style: TextStyles.w40013grey(context)),
              ),
            ),
            Container(
              width: Dimensions.screenWidth(context),
              padding: const EdgeInsets.all(7),
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 5.w,
                    ),
                    child: SwitchListTile(
                        inactiveTrackColor: Colors.grey,
                        //contentPadding: EdgeInsetsDirectional.only(end: 2),
                        //shape: BorderShape,
                        visualDensity: VisualDensity.comfortable,
                        title: Text(
                          "27".tr,
                          style: TextStyles.w50012(context),
                        ),
                        value: controller.isDarkMode,
                        onChanged: (val) {
                          if (val)
                            controller.changeMode("dark");
                          else
                            controller.changeMode("light");
                        }),
                  ),
                  MyDivider(),
                  GestureDetector(
                    onTap: () {
                      Get.to(ChangeTheLanguage());
                    },
                    child: ListTiles(
                        leadingIcon: null,
                        trailingIcon: Icons.arrow_forward_ios,
                        listText: "28".tr),
                  ),
                  MyDivider(),
                  ListTiles(
                      leadingIcon: null,
                      trailingIcon: Icons.arrow_forward_ios,
                      listText: "29".tr),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w, bottom: 10.h),
                child: Text("25".tr, style: TextStyles.w40013grey(context)),
              ),
            ),
            Container(
              width: Dimensions.screenWidth(context),
              padding: const EdgeInsets.all(7),
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(CategoriesPage());
                    },
                    child: ListTiles(
                        leadingIcon: null,
                        trailingIcon: Icons.arrow_forward_ios,
                        listText: "30".tr),
                  ),
                  MyDivider(),
                  ListTiles(
                      leadingIcon: null,
                      trailingIcon: Icons.arrow_forward_ios,
                      listText: "31".tr),
                  MyDivider(),
                  GestureDetector(
                    onTap: () {
                      Get.to(Skills());
                    },
                    child: ListTiles(
                        leadingIcon: null,
                        trailingIcon: Icons.arrow_forward_ios,
                        listText: "32".tr),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w, bottom: 10.h),
                child: Text("26".tr, style: TextStyles.w40013grey(context)),
              ),
            ),
            Container(
              width: Dimensions.screenWidth(context),
              padding: const EdgeInsets.all(7),
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Column(
                children: [
                  ListTiles(
                      leadingIcon: null,
                      trailingIcon: Icons.arrow_forward_ios,
                      listText: "33".tr),
                  MyDivider(),
                  GestureDetector(
                    onTap: () {
                      Get.to(ReportsPage());
                    },
                    child: ListTiles(
                        leadingIcon: null,
                        trailingIcon: Icons.arrow_forward_ios,
                        listText: "34".tr),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
