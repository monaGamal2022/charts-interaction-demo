import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FinalDemo extends StatefulWidget {
  FinalDemo({Key? key}) : super(key: key);

  @override
  State<FinalDemo> createState() => _FinalDemoState();
}

class _FinalDemoState extends State<FinalDemo> {
//TODO markers (Done)
//TODO thinkness of lines (Done) width of SplineSeriesline
//TODO curved points (Done) SplineChart
//TODO grid color (Done) MajorGridLines in
//TODO click on tooltip (Not achieveble directly it can be done with external action ex: button click)

  final TooltipBehavior tool = TooltipBehavior(
    enable: false,
    activationMode: ActivationMode.singleTap,
    header: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SfCartesianChart(
          title: ChartTitle(
            alignment: ChartAlignment.center,
            text: "market movement",
          ),
          primaryXAxis: DateTimeAxis(
            // intervalType: DateTimeIntervalType.days,
            // enableAutoIntervalOnZooming: true,
            // // interval: 1,
            // associatedAxisName: "Market Date",
            majorGridLines: const MajorGridLines(
              width: 0.1,
              color: Colors.red,
            ),
            // minorGridLines: const MinorGridLines(width: 0.5, color: Colors.red),
            labelRotation: -25,
          ),
          crosshairBehavior: CrosshairBehavior(
            enable: true,
            activationMode: ActivationMode.singleTap,
            lineWidth: 0.3,
            shouldAlwaysShow: true,
          ),
          trackballBehavior: TrackballBehavior(
            enable: true,
            builder: (_, TrackballDetails details) {
              // log("HI" + details.point!.xValue);
              return GestureDetector(
                onTap: () {
                  print("Iam atool tip ive been tapedss");
                },
                child: IntrinsicHeight(
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
                              Text(DateTime.fromMicrosecondsSinceEpoch(
                                details.point!.xValue,
                              ).toString()),
                              const SizedBox(height: 8),
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
                ),
              );
            },
            lineWidth: 0.3,
            lineColor: Colors.transparent,
            // shouldAlwaysShow: true,
            lineDashArray: const [6, 6],
            activationMode: ActivationMode.singleTap,
            tooltipAlignment: ChartAlignment.near,
            tooltipDisplayMode: TrackballDisplayMode.floatAllPoints,
            tooltipSettings: const InteractiveTooltip(
              borderWidth: 1,
              borderColor: Colors.red,
              arrowLength: 10,
              arrowWidth: 0,
              color: Colors.white,
            ),
          ),
          primaryYAxis: NumericAxis(
            majorGridLines: const MajorGridLines(
              color: Colors.black,
              width: .1,
            ),
          ),
          legend: Legend(
            isVisible: true,
            position: LegendPosition.right,
          ),
          zoomPanBehavior: ZoomPanBehavior(
            enableMouseWheelZooming: true,
            // enableDoubleTapZooming: true,
            enableSelectionZooming: true,
            enablePanning: true,
            enablePinching: true,
            // maximumZoomLevel: 0.3,
          ),
          series: <ChartSeries>[
            SplineSeries<DataSource, DateTime>(
              dataSource: dataSource1,
              width: 5,
              color: Colors.red,
              markerSettings: const MarkerSettings(
                width: 20,
                height: 20,
                isVisible: true,
                // color: Colors.black,
                borderWidth: 3,
              ),
              xValueMapper: (DataSource data, _) => data.date,
              yValueMapper: (DataSource data, _) => data.value,
            ),
            SplineSeries<DataSource, DateTime>(
              dataSource: dataSource2,
              color: Colors.black,
              width: 5,
              markerSettings: const MarkerSettings(
                width: 20,
                height: 20,
                isVisible: true,
                // color: Colors.black,
                borderWidth: 3,
              ),
              xValueMapper: (DataSource dataSource, _) => dataSource.date,
              yValueMapper: (DataSource dataSource, _) => dataSource.value,
            ),
          ],
        ),
      ),
    );
  }
}

class DataSource {
  final DateTime date;
  final double value;

  DataSource(
    this.date,
    this.value,
  );
}

List<DataSource> dataSource1 = [
  DataSource(DateTime(2000, 1, 1), 50),
  DataSource(DateTime(2002, 2, 1), 100),
  DataSource(DateTime(2003, 2, 1), 100),
  DataSource(DateTime(2004, 3, 15), 40),
  DataSource(DateTime(2005, 4, 15), 140),
];

List<DataSource> dataSource2 = [
  DataSource(DateTime(2000, 1, 1), 90),
  DataSource(DateTime(2002, 2, 1), 70),
  DataSource(DateTime(2003, 2, 3), 120),
  DataSource(DateTime(2004, 3, 20), 20),
  DataSource(DateTime(2005, 4, 15), 100),
];
