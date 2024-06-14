import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/skill_controller.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';
import 'package:projectoneuniversity/view/screens/Skills/add_skill.dart';
import 'package:projectoneuniversity/view/widgets/divider.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SkillController());
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<SkillController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SafeArea(
                  child: Row(
                children: [
                  SizedBox(width: 10.w),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_outlined)),
                  SizedBox(width: 10.w),
                  Text(
                    "56".tr,
                    style: TextStyles.w50019(context),
                  ),
                ],
              )),
              SizedBox(height: 30.h),
              AddSkill(controller: controller),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: TextFormField(
                  controller: controller.serchSkill,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // FocusScope.of(context).unfocus();
                        controller.getSkills();
                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                          size: 25,
                        ),
                      ),
                    ),
                    enabled: true,
                    hintText: "60".tr,
                    hintStyle: const TextStyle(fontSize: 17),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.only(
                        left: 15.w, right: 5.w, top: 15.h, bottom: 15.h),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: Dimensions.screenWidth(context),
                height: 500.h,
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: ListView.builder(
                    itemCount: controller.skills.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.skills[index]['name'],
                                style: TextStyles.w50012(context),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.deleteSkill(
                                      controller.skills[index]['id'], context);
                                },
                                child: Icon(
                                  Icons.delete_outlined,
                                  size: 17.sp,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                          MyDivider(
                            height: 10,
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
