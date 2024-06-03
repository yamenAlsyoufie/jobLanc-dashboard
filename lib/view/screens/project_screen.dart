import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/project_or_product_controller.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/animations.dart';
import 'package:projectoneuniversity/core/constants/colors.dart';
import 'package:projectoneuniversity/core/constants/custom_text_form_filed.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/alerts.dart';
import 'package:projectoneuniversity/view/widgets/divider.dart';


class ProjectScreen extends StatelessWidget {
  final int projectId;
  final int userId;
  const ProjectScreen({
    super.key,
    required this.userId,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ProjectScreenControllerImpl(id: userId, projectId: projectId,context));
    return Scaffold(
      body: GetBuilder<ProjectScreenControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: controller.statusRequest == StatusRequest.loading
              ? Container()
              : Form(
                  key: controller.formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SafeArea(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(Icons.arrow_back)),
                                SizedBox(width: 10.w),
                                Text(
                                    !controller.isProduct
                                        ? "project".tr
                                        : "product".tr,
                                    style: TextStyles.w50018(context)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              
                                        GestureDetector(
                                          onTap: () {
                                            animationedAlertWithActions(
                                                AppAnimations.info,
                                                "doyoureallywanttodelete".tr,
                                                controller.deleteData);
                                            controller.update();
                                          },
                                          child: Icon(
                                            Icons.delete_outline,
                                            color: Colors.red[800],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        )
                                      ],
                                    )
                              ],
                            )
                          
                        )),
                      
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "title".tr,
                          style: TextStyles.w50014(context),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Customtextformfiled(
                        hintText: "",
                        labelText: "".tr,
                        iconData: null,
                        controller: controller.title,
                        min: 2,
                        max: 25,
                        maxLines: 3,
                        minLines: 1,
                        styleText: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                        isNumber: false,
                        isPassword: false,
                        padding: 1,
                        isBorder: false,
                        isLabel: false,
                        isFilled: false,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      MyDivider(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "link".tr,
                          style: TextStyles.w50014(context),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Customtextformfiled(
                        hintText: "",
                        labelText: "".tr,
                        iconData: null,
                        controller: controller.link,
                        min: 10,
                        max: 100,
                        maxLines: 8,
                        minLines: 1,
                        isNumber: false,
                        styleText: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 12.sp,
                        ),
                        isPassword: false,
                        padding: 1,
                        isBorder: false,
                        isLabel: false,
                        isFilled: false,
                      ),
                      SizedBox(height: 10.h),
                      MyDivider(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "description".tr,
                          style: TextStyles.w50014(context),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                              child: Customtextformfiled(
                            hintText: "".tr,
                            labelText: "",
                            iconData: null,
                            controller: controller.description,
                            min: 5,
                            max: 250,
                            isNumber: false,
                            isPassword: false,
                            maxLines: 8,
                            styleText: TextStyle(
                                color: LightAppColors.greyColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp),
                            minLines: 1,
                            isBorder: false,
                            isLabel: false,
                            isFilled: false,
                            padding: 0,
                          )),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      MyDivider(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "images".tr,
                              style: TextStyles.w50014(context),
                            ),
                          
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GridView.builder(
                          padding: EdgeInsets.only(bottom: 20.h),
                          itemCount: controller.images.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.h),
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        AppLinks.IP +
                                            
                                            controller
                                                .images[index].values.last,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                          }),
                   
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
