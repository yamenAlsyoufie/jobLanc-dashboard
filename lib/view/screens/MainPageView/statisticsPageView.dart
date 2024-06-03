import 'package:flutter/material.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/view/widgets/top_bar.dart';

class statisticsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(name: "Admin", image:EnglishIconChooseLanguage),
          
        ],
      ),
    ));
  }
}
