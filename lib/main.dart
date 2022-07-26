import 'dart:developer';

import 'package:demo_movement_line_chart/final_demo.dart';
import 'package:demo_movement_line_chart/images.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  late TooltipBehavior tooltipBehavior;
  @override
  void initState() {
    super.initState();

    tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData1 = [
      ChartData(2010, 35),
      ChartData(2011, 28),
      ChartData(2012, 34),
      ChartData(2013, 32),
      ChartData(2014, 40),
    ];

    final List<ChartData> chartData2 = [
      ChartData(2000, 180),
      ChartData(2001, 150),
      ChartData(2002, 200),
      ChartData(2003, 220),
      ChartData(2004, 250),
    ];

    final List<ChartData> chartData3 = [
      ChartData(1000, 180),
      ChartData(1991, 150),
      ChartData(2002, 200),
      ChartData(2103, 210),
      ChartData(2204, 250),
    ];

    return Scaffold(
      body: // ..
          FinalDemo(),
      // Images(),
      /*

          SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
            child: SfCartesianChart(
              enableMultiSelection: true,
              primaryXAxis: NumericAxis(
                enableAutoIntervalOnZooming: true,
              ),
              primaryYAxis: NumericAxis(
                interval: 100,
                enableAutoIntervalOnZooming: true,
                numberFormat: NumberFormat.decimalPattern(),
              ),
              // tooltipBehavior: TooltipBehavior(
              //   enable: true,
              //   header: "",
              //   activationMode: ActivationMode.singleTap,
              //   color: Colors.white,
              //   builder: (dynamic data, dynamic point, dynamic series,
              //       int pointIndex, int seriesIndex) {
              //     final dataValue = data as ChartData;
              //     final pointValue = point as CartesianChartPoint;

              //     return IntrinsicHeight(
              //       child: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Container(
              //             decoration: BoxDecoration(
              //               color: Colors.red,
              //               borderRadius: BorderRadius.circular(3),
              //             ),
              //             child: Padding(
              //               padding: const EdgeInsets.only(left: 8.0),
              //               child: Container(
              //                 decoration: const BoxDecoration(
              //                   border: Border(
              //                     left: BorderSide(
              //                       color: Colors.red,
              //                       width: 4,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           const SizedBox(width: 4),
              //           Padding(
              //             padding: const EdgeInsets.all(4.0),
              //             child: Column(
              //               mainAxisSize: MainAxisSize.min,
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Text(dataValue.x.toString()),
              //                 const SizedBox(height: 4),
              //                 Text(
              //                   pointValue.y.toString(),
              //                   style: TextStyle(
              //                     color:
              //                         Theme.of(context).colorScheme.secondary,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
              zoomPanBehavior: ZoomPanBehavior(
                enablePinching: true,
                enableDoubleTapZooming: true,
                enableMouseWheelZooming: true,
                enableSelectionZooming: true,
                enablePanning: true,
                zoomMode: ZoomMode.x,
                selectionRectBorderWidth: 4,
                selectionRectBorderColor: Colors.black,
                selectionRectColor: Colors.amber,
              ),
              trackballBehavior: TrackballBehavior(
                enable: true,
                builder: (_, TrackballDetails details) {
                  return IntrinsicHeight(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.red,
                                      width: 4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(details.point!.yValue.toString()),
                                const SizedBox(height: 4),
                                Text(
                                  details.point!.yValue.toString(),
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                lineType: TrackballLineType.vertical,
                lineWidth: 0.3,
                lineColor: Colors.black,
                shouldAlwaysShow: true,
                lineDashArray: const [6, 6],
                activationMode: ActivationMode.singleTap,
                tooltipAlignment: ChartAlignment.near,
                tooltipDisplayMode: TrackballDisplayMode.floatAllPoints,
                tooltipSettings: const InteractiveTooltip(
                  borderWidth: 1,
                  borderColor: Colors.red,
                  enable: true,
                  arrowLength: 10,
                  arrowWidth: 0,
                  color: Colors.white,
                ),
              ),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.top,
              ),
              crosshairBehavior: CrosshairBehavior(
                enable: true,
                lineWidth: 0.3,
                activationMode: ActivationMode.singleTap,
                lineColor: Colors.red,
                lineType: CrosshairLineType.both,
                shouldAlwaysShow: true,
                lineDashArray: <double>[5, 5],
              ),
              series: <ChartSeries>[
                LineSeries<ChartData, int>(
                  dataSource: chartData1,
                  isVisibleInLegend: true,
                  enableTooltip: true,
                  color: Colors.black,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  selectionBehavior: SelectionBehavior(
                    enable: true,
                    unselectedColor: Colors.grey,
                    selectedColor: Colors.black,
                  ),
                ),
                LineSeries<ChartData, int>(
                    dataSource: chartData2,
                    color: Colors.red,
                    enableTooltip: true,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y),
              ],
            ),
          ),
        ),
      ),

//  */
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
