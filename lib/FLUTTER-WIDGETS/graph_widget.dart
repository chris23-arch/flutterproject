import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Graph'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.black, width: 1),
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: true,
                  interval: 2,
                  getTitlesWidget: (value, meta) {
                    if (value % 2 == 0) {
                      return Text(value.toInt().toString());
                    }
                    return Text('');
                  },
                )),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      if (value % 2 == 0) {
                        return Text(value.toInt().toString());
                      }
                      return Text('');
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false, // Hide right side titles
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false, // Hide top side titles
                  ),
                ),
              ),
              minX: 0,
              maxX: 10,
              minY: 0,
              maxY: 52,
              lineBarsData: [
                LineChartBarData(
                    isCurved: false,
                    color: Colors.blue,
                    barWidth: 2,
                    spots: [
                      FlSpot(0, 5 * 0 + 2),
                      FlSpot(1, 5 * 1 + 2),
                      FlSpot(2, 5 * 2 + 2),
                      FlSpot(3, 5 * 3 + 2),
                      FlSpot(4, 5 * 4 + 2),
                      FlSpot(5, 5 * 5 + 2),
                      FlSpot(6, 5 * 6 + 2),
                      FlSpot(7, 5 * 7 + 2),
                      FlSpot(8, 5 * 8 + 2),
                      FlSpot(9, 5 * 9 + 2),
                      FlSpot(10, 5 * 10 + 2),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
