import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/view/screens/introOne.dart';
import 'package:projectoneuniversity/view/screens/introThree.dart';
import 'package:projectoneuniversity/view/screens/introTwo.dart';

class PageViewFirstOfAppController extends GetxController
{
 final List<Widget> pages = 
 [
   // ChooseLanguage(),
    introOne(),
    introTwo(),
   introThree()
  ]; // list contain four page

}