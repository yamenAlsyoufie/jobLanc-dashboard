import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Chart extends StatelessWidget {
  final int ordersFirstWeek;
  final int ordersSecondWeek;
  final int ordersThirdWeek;
  final int ordersFourthWeek;

  const Chart(
      {super.key,
      required this.ordersFirstWeek,
      required this.ordersSecondWeek,
      required this.ordersThirdWeek,
      required this.ordersFourthWeek});

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        backgroundColor: Theme.of(context).colorScheme.background,
        gridData: const FlGridData(
            drawHorizontalLine: true,
            drawVerticalLine: false,
            horizontalInterval: 5),
        borderData: FlBorderData(
            border: const Border(
                bottom: BorderSide(width: 2), left: BorderSide(width: 2))),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30),
            axisNameSize: 25,
            // axisNameWidget: Text(
            //   "users".tr,
            //   style: TextStyle(fontSize: 12.sp),
            // )
          ),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 30),
              axisNameSize: 27,
              axisNameWidget: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Text(
                  "week".tr,
                  style: TextStyle(fontSize: 12.sp),
                ),
              )),
          topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false, reservedSize: 30),
              axisNameSize: 22),
          rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false), axisNameSize: 22),
        ),
        barGroups: [
          BarChartGroupData(
              groupVertically: true,
              x: 1,
              barsSpace: 2,
              barRods: [
                BarChartRodData(
                    toY: ordersFirstWeek.toDouble(),
                    width: 20,
                    borderRadius: BorderRadius.circular(5))
              ]),
          BarChartGroupData(x: 2, barsSpace: 5, barRods: [
            BarChartRodData(
                toY: ordersSecondWeek.toDouble(),
                width: 20,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 3, barsSpace: 5, barRods: [
            BarChartRodData(
                toY: ordersThirdWeek.toDouble(),
                width: 20,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 4, barsSpace: 5, barRods: [
            BarChartRodData(
                toY: ordersFourthWeek.toDouble(),
                width: 20,
                borderRadius: BorderRadius.circular(5))
          ]),
        ]));
  }
}

class Chart2 extends StatelessWidget {
  final double tabletsValue;
  final double capsulesValue;
  final double drposValue;
  final double ampulseValue;
  final double tubesValue;
  final double syrupsValue;
  const Chart2(
      {super.key,
      required this.tabletsValue,
      required this.capsulesValue,
      required this.drposValue,
      required this.ampulseValue,
      required this.tubesValue,
      required this.syrupsValue});

  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(sections: [
      PieChartSectionData(
        radius: 70,
        color: Colors.blue,
        value: syrupsValue,
      ),
      PieChartSectionData(
        radius: 70,
        color: Colors.red,
        value: tabletsValue,
      ),
      PieChartSectionData(
        radius: 70,
        color: Colors.green,
        value: ampulseValue,
      ),
      PieChartSectionData(
        radius: 70,
        color: Colors.indigo,
        value: tubesValue,
      ),
      PieChartSectionData(
        radius: 70,
        color: Colors.yellow,
        value: capsulesValue,
      ),
      PieChartSectionData(
        radius: 70,
        color: Colors.cyan,
        value: drposValue,
      )
    ]));
  }
}
