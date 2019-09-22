/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_app/config/SizeConfig.dart';

class StackedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedBarChart(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory StackedBarChart.withSampleData() {
    return new StackedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(

              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: SizeConfig.getPt(14).toInt(), // size in Pts.
                  color: charts.Color.fromHex(code: '#7985a3')),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 0, // size in Pts.
                  color: charts.MaterialPalette.black),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),
      vertical: true,
      defaultRenderer: charts.BarRendererConfig(
          groupingType: charts.BarGroupingType.grouped,
          cornerStrategy: charts.ConstCornerStrategy(SizeConfig.getPt(30).toInt()),
      ),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('Mo', 5),
      new OrdinalSales('Tu', 25),
      new OrdinalSales('We', 100),
      new OrdinalSales('Th', 75),
      new OrdinalSales('Fr', 75),
      new OrdinalSales('Sa', 45),
      new OrdinalSales('Su', 75),
    ];

    final tableSalesData = [
      new OrdinalSales('Mo', 25),
      new OrdinalSales('Tu', 50),
      new OrdinalSales('We', 10),
      new OrdinalSales('Th', 20),
      new OrdinalSales('Fr', 34),
      new OrdinalSales('Sa', 32),
      new OrdinalSales('Su', 22),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Value1',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
        colorFn: (_, __) => charts.Color.fromHex(code: '#ed5a4d'),
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Value2',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        colorFn: (_, __) => charts.Color.fromHex(code: '#5446db'),
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
