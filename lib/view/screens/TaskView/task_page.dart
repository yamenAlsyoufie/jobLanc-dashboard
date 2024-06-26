import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/view/screens/JobView/additiona_info.dart';
import 'package:projectoneuniversity/view/screens/JobView/requirments.dart';
import 'package:projectoneuniversity/view/screens/TaskView/about_task.dart';
import 'package:projectoneuniversity/view/screens/TaskView/top_bar.dart';

import '../../../controller/task_page_controller.dart';


class TaskPage extends StatelessWidget {
  final int taskId, id;
  const TaskPage({super.key, required this.taskId, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPageControllerImpl(context, taskId: taskId, id: id));
    return Scaffold(
      body: GetBuilder<TaskPageControllerImpl>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? Container()
            : SingleChildScrollView(
                child: Form(
                  key: controller.formState,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TaskTobBar(
                          userImage: controller.task.image!,
                          userName: controller.task.name!,
                          taskTitle: controller.task.taskTitle!,
                          major: controller.task.majorName!,
                          isActive: true,
                          onDelete: controller.deleteData,
                          isOwner: controller.isOwner,
                          budget: controller.task.budgetMin.toString() +
                              "-" +
                              controller.task.budgetMax.toString(),
                          id: controller.task.id!,
                          duration: controller.task.taskDuration.toString(), date: controller.task.createdAt!,active: controller.task.active==1?true:false,),
                      SizedBox(
                        height: 5.h,
                      ),
                      AbouTask(
                        aboutTask: controller.task.aboutTask!,
                      ),
                      Requirements(
                        requirements: controller.task.requirements!,
                      ),
                      controller.task.additionalInformation != null
                          ? AdditionalInfo(
                              additionalInfo:
                                  controller.task.additionalInformation!,
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
