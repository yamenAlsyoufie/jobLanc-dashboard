import 'package:flutter/material.dart';
import 'package:projectoneuniversity/data/widgets/HomePageWidgets/MainHomePageWidget.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:MainHomePageWidget(numberOfCompanies: "1111", numberOfUsers: "423432", numberOftasks: "433334",)
    );
  }
}
