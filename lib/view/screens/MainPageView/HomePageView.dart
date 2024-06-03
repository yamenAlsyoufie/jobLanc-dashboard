import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectoneuniversity/core/constants/text_styles.dart';
import 'package:projectoneuniversity/core/functions/dimenesions.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/view/widgets/chart.dart';
import 'package:projectoneuniversity/view/widgets/statistics_container.dart';
import 'package:projectoneuniversity/view/widgets/top_bar.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(name: "Salah", image: EnglishIconChooseLanguage),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 10.w, top: 20.h, bottom: 10.h),
            child: Text(
              "Statistics",
              style: TextStyles.w50018(context),
            ),
          ),
          GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return StatisticsContainer(title: "Total users", content: "222");
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.7),
          ),
          SizedBox(
            height: 20.h,
          ),
          ChartContainer(
              title: "Total users during this month",
              content: Container(
                width: Dimensions.screenWidth(context) - 30,
                height: 300,
                child: Chart(
                  ordersFirstWeek: 2,
                  ordersFourthWeek: 4,
                  ordersSecondWeek: 1,
                  ordersThirdWeek: 5,
                ),
              ))
        ],
      ),
    ));
  }
}
