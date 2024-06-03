import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:projectoneuniversity/view/screens/Intros/introFiveSettings.dart';
import 'package:projectoneuniversity/view/screens/Intros/introFourAddCategory.dart';
import 'package:projectoneuniversity/view/screens/Intros/introOneHomePage.dart';
import 'package:projectoneuniversity/view/screens/Intros/introThreeWallet.dart';
import 'package:projectoneuniversity/view/screens/Intros/introTwoStatistics.dart';

class PageViewIntrosController extends GetxController
{
   var currentPage = 0.obs;
  PageController pageController = PageController();

  void onPageChanged(int page) 
  {
    currentPage.value = page;
  }
 final List<Widget> pages = 
 [
   // ChooseLanguage(),
  introOneHomePage(),
  introTwoStatistics(),
  introThreeWallet(),
  introFourAddCategory(),
  introFiveSettings(),
  ]; // list contain four page

}