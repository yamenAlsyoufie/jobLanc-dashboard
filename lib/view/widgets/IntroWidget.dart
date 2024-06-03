import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/PageViewIntrosController.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';

class IntroWidget extends StatelessWidget {
  final Image image;
  final String mainTitleText;
  final String textIntro;
  final VoidCallback onPressed;
  IntroWidget(
      {required this.image,
      required this.textIntro,
      required this.mainTitleText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    PageViewIntrosController controller = Get.put(PageViewIntrosController());
    //print(controller.currentPage);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Placeholder for the image
                  image,//Image Widget
                  SizedBox(height: 20),
                  Text( // MainTitleText
                    mainTitleText.tr,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 60),
                  Container(// describiton
                    width: 300,
                    child: Text(
                      textIntro.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Pagination Dots
            Obx(
              () => Row( //i use obx becuase i change in Ui when i change the intro
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)//for loop to create 5 point in the Ui
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration( //meaning convert color of the point to primary color if i am in this intro
                        shape: BoxShape.circle,
                        color: controller.currentPage == i
                            ? primaryColor
                            : Colors.grey,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Button color
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text( //buttom if in the first or second or third fourth intro put(continue) or in the fifth put skip
                  controller.currentPage == 3 ? '4'.tr : 'Skip',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
