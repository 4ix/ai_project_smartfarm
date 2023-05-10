import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:smartfarm/services/api_service.dart';

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
  late final List<double> _humiditiesList = [];
  late final List<double> _shumiditiesList = [];

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  initState() {
    super.initState();
    ApiService.getHumiditis(widget.userId, widget.userSite).then((humidities) {
      for (var i = 0; i < humidities.length; i++) {
        _humiditiesList.add(humidities[i].humidity);
      }
    });
    ApiService.getSoilHumiditis(widget.userId, widget.userSite)
        .then((shumidities) {
      for (var i = 0; i < shumidities.length; i++) {
        _shumiditiesList.add(shumidities[i].soilHumidity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final spots = _humiditiesList
        .asMap()
        .entries
        .map((element) => FlSpot(
              element.key.toDouble(),
              element.value,
            ))
        .toList();
    final spots2 = _shumiditiesList
        .asMap()
        .entries
        .map((element) => FlSpot(
              element.key.toDouble(),
              element.value,
            ))
        .toList();
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.5,
      child: LineChart(
          LineChartData(
            maxY: 80,
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
