import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/job_info_controller.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/view/screens/job_info/about_company.dart';
import 'package:projectoneuniversity/view/screens/job_info/about_job.dart';
import 'package:projectoneuniversity/view/screens/job_info/additiona_info.dart';
import 'package:projectoneuniversity/view/screens/job_info/company_info.dart';
import 'package:projectoneuniversity/view/screens/job_info/requirments.dart';
import 'package:projectoneuniversity/view/screens/job_info/task_and_tob_bar.dart';


class JobInfo extends StatelessWidget {
  final int id;
  const JobInfo({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(JobInfoControllerImpl(jobId: id));
    return Scaffold(
      body: GetBuilder<JobInfoControllerImpl>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              TaskAndJobTobBar(
                onDelete: (){},
              ),
              CompanyInfo(
                companyImage: Image.asset(EnglishIconChooseLanguage),
                companyName: "Linkedin",
                numOfEmployees: "51 - 100",
                jobType: "Full time",
                jobTitle: "Flutter developer",
                jobLocation: "United states",
                remote: "Remote",
                major: "Engineering",
                roleId: controller.roleId,
                isVisible: controller.isVisible,
                onTap: () {
                  controller.buttonFunction();
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              AboutCompany(),
              AboutJob(),
              Requirements(requirements: "dadawwa\nwdawdawda"),
              AdditionalInfo(
                additionalInfo: "daas dasdasdas\nfd;smfod sd\nfsklmfsdmf",
              )
            ],
          ),
        ),
      ),
    );
  }
}
