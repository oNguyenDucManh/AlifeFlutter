import 'package:flutter/material.dart';
import 'package:flutter_app/config/Config.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:flutter_app/model/SalesData.dart';
import 'package:flutter_app/myWidget/CustomCard.dart';
import 'package:flutter_app/myWidget/MyBarChart.dart';

//import 'package:flutter_app/myWidget/StackedBarChart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}

class DashboardState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: SizeConfig.screenWidth,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: SizeConfig.getPt(24),
                right: SizeConfig.getPt(24),
                top: SizeConfig.getPt(11),
                bottom: SizeConfig.getPt(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Dashboard",
                    style: TextStyle(
                        fontSize: SizeConfig.getPt(36),
                        fontFamily: Config.fontFamily,
                        color: MyColors.colorPrimaryDark,
                        fontWeight: FontWeight.w600)),
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.getPt(25), bottom: SizeConfig.getPt(14)),
                  child: Text("Overview",
                      style: TextStyle(
                          fontSize: SizeConfig.getPt(16),
                          fontFamily: Config.fontFamily,
                          color: MyColors.textLight,
                          fontWeight: FontWeight.w500)),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomCard(
                        elevation: SizeConfig.getPt(8),
                        color: Colors.white,
                        shadowColor: Color.fromRGBO(52, 68, 110, 0.16),
                        borderRadius: SizeConfig.getPt(24),
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.getPt(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.dashboard,
                                color: MyColors.red,
                              ),
                              SizedBox(height: SizeConfig.getPt(35)),
                              Text(
                                "80%",
                                style: TextStyle(
                                    color: MyColors.colorPrimaryDark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: Config.fontFamily,
                                    fontSize: SizeConfig.getPt(36)),
                              ),
                              SizedBox(height: SizeConfig.getPt(5)),
                              Text(
                                "120 task",
                                style: TextStyle(
                                    color: MyColors.colorPrimaryDark,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Config.fontFamily,
                                    fontSize: SizeConfig.getPt(14)),
                              ),
                              SizedBox(height: SizeConfig.getPt(10)),
                              Text(
                                "Task done",
                                style: TextStyle(
                                    color: MyColors.textLight,
                                    fontFamily: Config.fontFamily,
                                    fontSize: SizeConfig.getPt(14),
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    SizedBox(width: SizeConfig.getPt(17)),
                    Expanded(
                      child: CustomCard(
                        elevation: SizeConfig.getPt(8),
                        color: Colors.white,
                        shadowColor: Color.fromRGBO(52, 68, 110, 0.16),
                        borderRadius: SizeConfig.getPt(24),
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.getPt(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                color: MyColors.colorPrimary,
                              ),
                              SizedBox(height: SizeConfig.getPt(35)),
                              Text(
                                "16k",
                                style: TextStyle(
                                    color: MyColors.colorPrimaryDark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: Config.fontFamily,
                                    fontSize: SizeConfig.getPt(36)),
                              ),
                              SizedBox(height: SizeConfig.getPt(5)),
                              Text(
                                "55 posts",
                                style: TextStyle(
                                    color: MyColors.colorPrimaryDark,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Config.fontFamily,
                                    fontSize: SizeConfig.getPt(14)),
                              ),
                              SizedBox(height: SizeConfig.getPt(10)),
                              Text(
                                "Likes",
                                style: TextStyle(
                                    color: MyColors.textLight,
                                    fontFamily: Config.fontFamily,
                                    fontSize: SizeConfig.getPt(14),
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.getPt(30)),
                Text("Friends connected",
                    style: TextStyle(
                        fontSize: SizeConfig.getPt(16),
                        color: MyColors.textLight,
                        fontFamily: Config.fontFamily,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: SizeConfig.getPt(16)),
                CustomCard(
                  elevation: SizeConfig.getPt(8),
                  color: Colors.white,
                  shadowColor: Color.fromRGBO(52, 68, 110, 0.16),
                  borderRadius: SizeConfig.getPt(24),
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.getPt(16)),
                  ),
                ),
                SizedBox(height: SizeConfig.getPt(30)),
                Text("Your emotion",
                    style: TextStyle(
                        fontSize: SizeConfig.getPt(16),
                        color: MyColors.textLight,
                        fontFamily: Config.fontFamily,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: SizeConfig.getPt(16)),
//                CustomCard(
//                  elevation: SizeConfig.getPt(8),
//                  color: Colors.white,
//                  shadowColor: Color.fromRGBO(52, 68, 110, 0.16),
//                  borderRadius: SizeConfig.getPt(24),
//                  child: Container(
//                    padding: EdgeInsets.only(
//                        top: SizeConfig.getPt(16),
//                        bottom: SizeConfig.getPt(16),
//                        left: SizeConfig.getPt(24),
//                        right: SizeConfig.getPt(24)),
//                    child: SimpleBarChart(),
//                  ),
//                ),
//                SizedBox(height: SizeConfig.getPt(16)),
                CustomCard(
                  elevation: SizeConfig.getPt(8),
                  color: Colors.white,
                  shadowColor: Color.fromRGBO(52, 68, 110, 0.16),
                  borderRadius: SizeConfig.getPt(24),
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.getPt(16)),
                    height: SizeConfig.getPt(200),
                    child: getStackedColumnChart(true),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SfCartesianChart getStackedColumnChart(bool isTileView) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: isTileView ? '' : 'Quarterly wise sales of products'),
      legend: Legend(
          isVisible: !isTileView, overflowMode: LegendItemOverflowMode.none),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0, color: Colors.white),
          labelFormat: '{value}',
          isVisible: false,
          maximum: 200,
          majorTickLines: MajorTickLines(size: 0)),
      series: getStackedColumnSeries(isTileView),
      tooltipBehavior: TooltipBehavior(
          enable: true,
          header: '',
          canShowMarker: true,
          color: MyColors.colorPrimary,
//          format: '{value}%',
          textStyle: ChartTextStyle(
              color: Colors.white,
              fontSize: SizeConfig.getPt(14),
              fontFamily: Config.fontFamily,
              fontWeight: FontWeight.w500)),
    );
  }

  List<StackedColumnSeries<_ChartData, String>> getStackedColumnSeries(
      bool isTileView) {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData('Mo', 50, 55),
      _ChartData('Tu', 80, 75),
      _ChartData('We', 35, 45),
      _ChartData('Th', 65, 50),
      _ChartData('Fr', 65, 12),
      _ChartData('Sa', 12, 34),
      _ChartData('Su', 56, 76),
    ];
    return <StackedColumnSeries<_ChartData, String>>[
      StackedColumnSeries<_ChartData, String>(
          enableTooltip: true,
          color: MyColors.blue,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y1,
          width: 1 / 3,
          name: 'Product A'),
      StackedColumnSeries<_ChartData, String>(
          enableTooltip: true,
//          borderRadius: BorderRadius.vertical(
//              top: Radius.circular(10), bottom: Radius.circular(0)),
          color: MyColors.red,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          width: 1 / 3,
          name: 'Product B')
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y1, this.y2);

  final String x;
  final num y1;
  final num y2;
}
