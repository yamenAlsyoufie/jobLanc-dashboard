import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/prices_controller.dart';
import 'package:projectoneuniversity/core/constants/buttons.dart';
import 'package:projectoneuniversity/core/constants/custom_text_form_filed.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';

class PricesPage extends StatelessWidget {
  const PricesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PricesController());
    return Scaffold(
        body: SingleChildScrollView(
      child: GetBuilder<PricesController>(
        builder: (controller) =>
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  child: const Icon(Icons.arrow_back_outlined)),
              SizedBox(width: 10.w),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "80".tr,
                      style: TextStyles.w50019(context),
                    ),
                    GestureDetector(
                        onTap: () {
                          controller.isEditing = !controller.isEditing;
                          controller.update();
                        },
                        child: Icon(
                          Icons.edit,
                          size: 20.sp,
                        ))
                  ],
                ),
              ),
            ],
          )),
          SizedBox(
            height: 20.h,
          ),
          ListView.builder(
              itemCount: controller.data.length,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  width: Dimensions.screenWidth(context),
                  //height: 40.h,
                  alignment: AlignmentDirectional.centerStart,
                  margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.primaryContainer),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.data[index]['name'],
                          style: TextStyles.w50012(context),
                        ),
                        Visibility(
                          visible: !controller.isEditing,
                          child: Text(
                            controller.data[index]['price'],
                            style: TextStyles.w50012(context),
                          ),
                        ),
                        Visibility(
                          visible: controller.isEditing,
                          child: Customtextformfiled(
                            hintText: "",
                            labelText: "",
                            iconData: null,
                            controller: controller.prices[index],
                            min: 1,
                            max: 4,
                            isNumber: false,
                            isPassword: false,
                            isFilled: true,
                            isBorder: true,
                            isLabel: false,
                            isValidation: true,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Visibility(
                          visible: controller.isEditing,
                          child: GestureDetector(
                            onTap: () {
                              controller.editPrice(context);
                            },
                            child: Container(
                              width: Dimensions.screenWidth(context),
                              height: 35.h,
                              margin: EdgeInsets.symmetric(horizontal: 40.w),
                              alignment: Alignment.center,
                              decoration: AppButtons.buttonDecoration,
                              child: Text(
                                'save'.tr,
                                style: TextStyles.w50013White(context),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })
        ]),
      ),
    ));
  }
}
