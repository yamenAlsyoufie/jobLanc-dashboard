import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/view/Intros/introFiveSettings.dart';
import 'package:projectoneuniversity/view/Intros/introFourAddCategory.dart';
import 'package:projectoneuniversity/view/Intros/introOneHomePage.dart';
import 'package:projectoneuniversity/view/Intros/introThreeWallet.dart';
import 'package:projectoneuniversity/view/Intros/introTwoStatistics.dart';

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