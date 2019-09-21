import 'package:fcharts/fcharts.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class Sales {
  const Sales(this.name, this.value1, this.value2);

  final String name;
  final double value1;
  final double value2;
}

class SimpleBarChart extends StatelessWidget {
  // X value -> Y value
  static const myData = [
    const Sales("M", 50, 50),
    const Sales("T", 10, 23),
    const Sales("W", 35, 18),
    const Sales("T1", 18, 24),
    const Sales("F", 20, 24),
    const Sales("S", 18, 23),
    const Sales("S1", 56, 75),
  ];

  @override
  Widget build(BuildContext context) {
    final xAxis = new ChartAxis<String>(
      span: new ListSpan(myData.map((sales) => sales.name).toList()),
    );

    final yAxis = new ChartAxis<double>(
      span: new DoubleSpan(0, 100),
      tickGenerator: IntervalTickGenerator.byN(15),
    );

    final barStack1 = new BarStack<double>();

    return new AspectRatio(
      aspectRatio: 1.5,
      child: new BarChart<Sales, String, double>(
        data: myData,
        xAxis: xAxis,
        yAxis: yAxis,
        bars: [
          new Bar<Sales, String, double>(
            xFn: (sales) => sales.name,
            valueFn: (sales) => sales.value1,
            fill: new PaintOptions.fill(color: Color.fromRGBO(84, 70, 219, 1)),
            stack: barStack1,
          ),
          new Bar<Sales, String, double>(
            xFn: (sales) => sales.name,
            valueFn: (sales) => sales.value2,
            fill: new PaintOptions.fill(color: Color.fromRGBO(237, 90, 77, 1)),
            stack: barStack1,
          ),
        ],
      ),
    );
  }
}
