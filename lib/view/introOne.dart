import 'package:flutter/material.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';

class introOne extends StatelessWidget
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        color:primaryColor,
        child:Column( //main widget contian(1.icon , 2.text in two languages , 3.controller)
        children: [
          Container(
            child:Image.asset(StatisticPhotoIntro ,width: 300 , height: 200,),
          ),
          Container(),
          Container()
        ],
        )        
      ),
    );
  }
  }