import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/wallet_controller.dart';
import 'package:projectoneuniversity/core/constants/custom_text_form_filed.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/view/widgets/UserWalletWidget.dart';

class WalletPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(WalletController());
    return Scaffold(
        body: SingleChildScrollView(
      child: GetBuilder<WalletController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: SafeArea(
                  child: Text(
                "47".tr,
                style: TextStyles.w50018(context),
              )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Text(
                "46".tr,
                style: TextStyles.w40013grey(context),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Customtextformfiled(
              hintText: "48".tr,
              labelText: "",
              iconData: Icons.search,
              controller: controller.user,
              min: 2,
              max: 30,
              isNumber: false,
              isPassword: false,
              isFilled: true,
              isBorder: true,
              isLabel: false,
              isValidation: false,
              ontapicon: () {
                controller.searchUser();
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.users.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // if (controller.selectedUser != 0) {
                      //   controller.users[controller.selectedUser].isSelected =
                      //       false;
                      // }
                      controller.users[index].isSelected =
                          !controller.users[index].isSelected;
                      controller.selectedUser = index;

                      controller.update();
                    },
                    child: UserWalletWidget(
                        name: controller.users[index].name!,
                        email: controller.users[index].email!,
                        image: controller.users[index].image!,
                        id: controller.users[index].id!,
                        isSelected: controller.users[index].isSelected,
                        controller: controller),
                  );
                })
          ],
        ),
      ),
    ));
  }
}
