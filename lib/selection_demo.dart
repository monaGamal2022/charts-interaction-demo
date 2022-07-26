import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SelectableChart extends StatelessWidget {
  SelectableChart({Key? key}) : super(key: key);
  final List<ChartData> chartData = [
    ChartData('USA', 6),
    ChartData('China', 11),
    ChartData('UK', 9),
    ChartData('Japan', 14),
    ChartData('France', 10),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SfCartesianChart(
            series: <CartesianSeries>[
              ColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                selectionBehavior: SelectionBehavior(
                  enable: true,
                  selectedColor: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
