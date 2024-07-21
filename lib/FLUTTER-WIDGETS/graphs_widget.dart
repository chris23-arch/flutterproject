
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphsWidget extends StatelessWidget {
  const GraphsWidget({super.key});




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Quadratic Graph')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LineChartWidget(),
        ),
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  // Define the quadratic function f(x) = x^2 - x - 6
  double f(double x) {
    return x * x - x - 6;
  }

  @override
  Widget build(BuildContext context) {
    // Generate data points
    List<FlSpot> dataPoints = [];
    for (double x = -5; x <= 5; x += 0.1) {
      dataPoints.add(FlSpot(x, f(x)));
    }

    return LineChart(
      LineChartData(
        minX: -5,
        maxX: 5,
        minY: -10,
        maxY: 10,
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 28),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: dataPoints,
            isCurved: true,
            barWidth: 3,
            color: Colors.blue,
            dotData: FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}
