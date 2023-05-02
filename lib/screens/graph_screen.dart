import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:smartfarm/services/api_service.dart';

class _InternalTemperatureData {
  final DateTime date;
  final double value;

  _InternalTemperatureData({
    required this.date,
    required this.value,
  });
}

List<_InternalTemperatureData> _generateData(int max) {
  final random = Random();

  return List.generate(
    31, // 31개를 만드는데
    (index) => _InternalTemperatureData(
      date: DateTime(2023, 4, index + 1),
      value: random.nextDouble() * max,
    ),
  );
}

class GraphScreen extends StatefulWidget {
  const GraphScreen({
    super.key,
    required this.userId,
    required this.userSite,
  });

  final String userId;
  final String userSite;

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late List<_InternalTemperatureData> _yesterdayData;
  late List<_InternalTemperatureData> _todayData;

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  void initState() {
    _yesterdayData = _generateData(20);
    _todayData = _generateData(20);

    ApiService.getHumiditis(widget.userId, widget.userSite);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final spots = _yesterdayData
        .asMap()
        .entries
        .map((element) => FlSpot(
              element.key.toDouble(),
              element.value.value,
            ))
        .toList();
    final spots2 = _todayData
        .asMap()
        .entries
        .map((element) => FlSpot(
              element.key.toDouble(),
              element.value.value,
            ))
        .toList();
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.5,
      child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                dotData: FlDotData(show: false),
                color: gradientColors[0],
              ),
              LineChartBarData(
                spots: spots2,
                dotData: FlDotData(show: false),
                color: gradientColors[1],
              ),
            ],
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              show: false,
            ),
          ),
          swapAnimationDuration: const Duration(milliseconds: 150),
          swapAnimationCurve: Curves.linear),
    );
  }
}
