import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';

class ChooseLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[300],
            child: Column(
              // main column contain the page and the 3 buttons (english and arabic and next)
              children: [
                Container(
                    // contain the main photo for the page
                    margin: EdgeInsets.only(top: 50),
                    child: Image.asset(
                      mainImageChooseLanguage,
                      width: 400,
                      height:200,
                    ),
                    ),
                Container(//contain the button for Arabic language
                child:GestureDetector(
                  onTap: () {
                   // isarabic = true;
                   // isenglish = false;
                   // controller.changeColor();
                    //controller.changeLang("ar");
                  },
                  child: Container(
                      width: double.infinity,
                     // height: Dimensions.screenHeight(context) / 13,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color:
                             Colors.blue[700],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                ),
                )
               // Container(// contian the button for the English language

                //    ),
               // Container(// contian the button to move to next page
                 //   )
              ],
            )));
  }
}
