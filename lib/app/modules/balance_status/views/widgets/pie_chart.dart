import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartView extends StatelessWidget {
  PieChartView({Key? key}) : super(key: key);

  Map<String, double> dataMap = {
    "Rent paid": 35000,
    "Rent due": 15000,
  };

  List<Color> colorList = [
    // const Color(0xffD95AF3),
    // const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    // const Color(0xffFE9539)
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(seconds: 3),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        // colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        centerText: "Rent\nStatus",

        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: true,
          decimalPlaces: 1,
        ),
        legendOptions: const LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // gradientList: gradientList,
        colorList: colorList,
      ),
    );
  }
}
