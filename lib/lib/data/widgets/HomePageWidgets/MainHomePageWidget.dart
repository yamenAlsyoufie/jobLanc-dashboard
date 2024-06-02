import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:projectoneuniversity/controller/MainHomePageController.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';

class MainHomePageWidget extends StatelessWidget {
  Mainhomepagecontroller controller = Get.put(Mainhomepagecontroller());
  //overView for app
  final String numberOfUsers;
  final String numberOfCompanies;
  final String numberOftasks;
  //_________________________
  //company jobs offers
  //  final String jobTitleCompany;
  //  final String CompanyName;
  //  final String JobLocation;
  //  final String StatusOfJobs; //meaning onSite or remote
  //  final Image IconOfCompany;
  //  final String DateOfPopulactionComapny;
  //__________________________
  //task offers
  //  final String TaskTitle;
  //  final String OwnerOfTask;
  //  final String DateOfpopulactionTask;
  //  final Image IconOfOwnerTask;
  MainHomePageWidget({
    required this.numberOfUsers,
    required this.numberOfCompanies,
    required this.numberOftasks,
    // required this.jobTitleCompany,
    // required this.CompanyName,
    // required this.JobLocation,
    // required this.StatusOfJobs,
    // required this.IconOfCompany,
    // required this.DateOfPopulactionComapny,
    // required this.TaskTitle,
    // required this.OwnerOfTask,
    // required this.DateOfpopulactionTask,
    // required this.IconOfOwnerTask
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: [
          //         ImportantInfo('19'.tr, numberOfUsers),
          //         ImportantInfo('20'.tr, numberOftasks),
          //         ImportantInfo('21'.tr, numberOfCompanies)
          //       ],
          //     ),
          //     ),
          TabBar(
              controller: controller.tabController,
              indicatorColor: Colors.purple,
              labelColor: Colors.purple,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'About'),
                Tab(text: 'Projects'),
                Tab(text: 'Skills'),
                Tab(text: 'Tasks'),
                Tab(text: 'Contact'),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildJobCard(String Describtion, String numbers) {
    return Card(
      child: ListTile(
        title: Text(Describtion),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(numbers),
          ],
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget _buildTaskCard(String Describtion, String numbers) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(HomePageBackgroundItems),
          child: Image.network(
              'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png'),
        ),
        title: Text(Describtion),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(numbers),
            //Text('$time • $category'),
          ],
        ),
        // trailing: isActive ? Text('Active', style: TextStyle(color: Colors.green)) : null,
      ),
    );
  }

  Widget ImportantInfo(String Description, String numbers) {
    return Container(
        // color: Colors.blue,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          // color: Colors.blue
        ),
        width: 600,
        height: 150,
        child: 
        //Stack(
         // alignment: Alignment.center,
         // fit: StackFit.expand,
         // children: [
            Container(
              width: 600,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(HomePageBackgroundItems) , fit: BoxFit.contain),
                  borderRadius: BorderRadius.circular(30), color: Colors.red),
              child: Image.asset(
                HomePageBackgroundItems,
                width: 600,
                height: 150,
              ),
            ),
            // Positioned(
            //   top: 30,
            //   child: Text(
            //     Description,
            //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Positioned(
            //   child: Text(numbers),
            //   top: 90,
            // )
          //],
       // )
        );
  }
}
