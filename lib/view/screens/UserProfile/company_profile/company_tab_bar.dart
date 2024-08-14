import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/profiles_controller/company_profile_controller.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/view/widgets/divider.dart';
import 'package:projectoneuniversity/view/widgets/job_design.dart';
import 'package:projectoneuniversity/view/widgets/project_design.dart';
import 'package:projectoneuniversity/view/widgets/review_design.dart';
import 'package:projectoneuniversity/view/widgets/task_design.dart';

class CompanyTabBar extends StatelessWidget {
  final CompanyProfileControllerImpl controller;
  const CompanyTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      jobs(
        context,
      ),
      tasks(context, controller),
      aboutCompany(context, controller),
      products(context, controller),
      contactInfo(context)
    ]);
  }
}

Widget tasks(BuildContext context, var controller) {
  return RefreshIndicator(
    onRefresh: () async {
      await Future.delayed(Duration(seconds: 2));
      controller.refreshPage();
    },
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: Text(
              "mytasks".tr,
              style: TextStyles.w50015(context),
            ),
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return TaskDesign(
                  taskTitle: controller.tasks[index].taskTitle,
                  userName: controller.tasks[index].name,
                  major: controller.tasks[index].majorName,
                  date: controller.tasks[index].createdAt,
                  duration: controller.tasks[index].taskDuration.toString(),
                  image: controller.tasks[index].image,
                  isActive: controller.tasks[index].active == 1 ? true : false,
                  aboutTask: controller.tasks[index].aboutTask,
                  taskId: controller.tasks[index].id,
                  id: controller.tasks[index].userId,
                );
              }),
        ],
      ),
    ),
  );
}

Widget aboutCompany(
    BuildContext context, CompanyProfileControllerImpl controller) {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "aboutcompany".tr,
            style: TextStyles.w50015(context),
          ).animate().fade(duration: 600.ms).slideY(begin: 0.9),
          SizedBox(
            height: 20.h,
          ),
          Text(
            controller.data['description'],
            style: TextStyles.w40012grey(context),
          ).animate().fade(duration: 700.ms).slideY(begin: 0.1),
          SizedBox(height: 10.h),
          MyDivider(
            height: 10,
          ),
          Text("reviews".tr, style: TextStyles.w50015(context)),
          SizedBox(height: 20.h),
          ListView.builder(
              itemCount: controller.reviews.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ReviewDesign(
                  image: controller.reviews[index].image!,
                  review: controller.reviews[index].comment!,
                  name: controller.reviews[index].firstName! +
                      " " +
                      controller.reviews[index].lastName!,
                  level: controller.reviews[index].level!,
                  date: controller.reviews[index].createdAt!,
                  userId: controller.reviews[index].userId!.toString(),
                );
              })
        ],
      ),
    ),
  );
}

Widget jobs(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Text(
            "myjobs".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        ListView.builder(
          itemCount: controller.jobs.length,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return JobDesign(
              jobTitle: controller.jobs[index].jobTitle!,
              companyName: controller.jobs[index].companyName!,
              location: controller.jobs[index].location,
              date: controller.jobs[index].date!,
              remote: controller.jobs[index].remoteName!,
              image: controller.jobs[index].companyImage!,
              isActive: controller.jobs[index].active == 1 ? true : false,
              companyId: controller.jobs[index].companyId!,
              jobId: controller.jobs[index].id!,
              isFavourite: controller.jobs[index].isFavorite,
              onFavouriteTap: () {
                controller.addRemoveFavourite(
                    controller.jobs[index].id!, false, index);
              },
            );
          },
        )
      ],
    ),
  );
}

Widget products(BuildContext context, CompanyProfileControllerImpl controller) {
  return SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Text(
            "companyproducts".tr,
            style: TextStyles.w50015(context),
          ),
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProjectDesign(
                projectTitle: controller.products[index].projectName!,
                projectDescription:
                    controller.products[index].projectDescription!,
                projectLink: controller.products[index].link!,
                project_id: controller.products[index].id!,
                user_id: controller.products[index].userId!,
              );
            })
      ],
    ).animate().fade(duration: 600.ms).slideY(begin: 0.1),
  );
}

Widget contactInfo(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "contactinfo".tr,
          style: TextStyles.w50015(context),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            Icon(Icons.call_outlined),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "+963996541809",
              style: TextStyles.w50013(context),
            )
          ],
        ),
        MyDivider(
          height: 10,
        ),
        Row(children: [
          Icon(Icons.mail_outlined),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              "salahaldeenmdaghmesh@gmail.com",
              style: TextStyles.w50013(context),
            ),
          ),
        ]),
        MyDivider(
          height: 10,
        ),
        MyDivider(
          height: 10,
        ),
        Row(children: [
          Icon(Icons.location_on_outlined),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              "Syria",
              style: TextStyles.w50013(context),
            ),
          ),
        ]),
        Row(children: [
          Icon(Icons.link_outlined),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              "www.google.com",
              style: TextStyles.w50013(context),
            ),
          )
        ])
      ],
    ),
  ).animate().fade(duration: 600.ms).slideY(begin: 0.1);
}
