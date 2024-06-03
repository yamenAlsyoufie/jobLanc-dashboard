import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tasks extends StatelessWidget {
  //final FreelancerHomePageControllerImpl controller;
  //const Tasks({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 195,
      // width: Dimensions.screenWidth(context),
      // child: ListView.builder(
      //   padding: EdgeInsets.zero,
      //   shrinkWrap: true,
      //   scrollDirection: Axis.horizontal,
      //   itemCount: controller.tasks.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return TaskDesign(
      //       taskTitle: controller.tasks[index].taskTitle!,
      //       userName: "Google",
      //       major: "Technology",
      //       date: controller.tasks[index].createdAt!,
      //       duration: controller.tasks[index].taskDuration.toString(),
      //       image: EnglishIconChooseLanguage,
      //       isActive: true,
      //       aboutTask: controller.tasks[index].aboutTask!,
      //        taskId: controller.tasks[index].id!, id: controller.tasks[index].userId!,
      //     );
      //   },
      // ),
    );
  }
}
