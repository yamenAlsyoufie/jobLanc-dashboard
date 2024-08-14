import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/JobTypesController.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';
import 'package:projectoneuniversity/view/screens/JobTypes/AddJobType.dart';

class JobTypes extends StatelessWidget {
  const JobTypes({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JobtypesController());
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<JobtypesController>(
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
                    "67".tr,
                    style: TextStyles.w50019(context),
                  ),
                ],
              )),
              SizedBox(
                height: 20.h,
              ),
              AddJobType(controller: controller),
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
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.h, vertical: 8.w),
                                child: Text(
                                  controller.data[index]['name'],
                                  style: TextStyles.w50012(context),
                                ),
                              ),
                              Icon(
                                Icons.delete_outline,
                                size: 17.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
