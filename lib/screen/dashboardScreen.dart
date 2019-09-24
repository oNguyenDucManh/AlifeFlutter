import 'package:flutter/material.dart';
import 'package:flutter_app/config/Config.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:flutter_app/myWidget/CustomCard.dart';
import 'package:flutter_app/myWidget/StackAvatarWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}

class DashboardState extends State<DashboardScreen> with AutomaticKeepAliveClientMixin<DashboardScreen>{
  bool isThisWeekSelected = true;
  final List<_ChartData> chartData = <_ChartData>[
    _ChartData('Mo', 50, 55),
    _ChartData('Tu', 80, 75),
    _ChartData('We', 35, 45),
    _ChartData('Th', 65, 50),
    _ChartData('Fr', 65, 12),
    _ChartData('Sa', 12, 34),
    _ChartData('Su', 56, 76),
  ];
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
                        fontFamily: 'AvenirNext',
                        fontWeight: FontWeight.w500)),
                SizedBox(height: SizeConfig.getPt(16)),
                CustomCard(
                  elevation: SizeConfig.getPt(8),
                  color: Colors.white,
                  shadowColor: Color.fromRGBO(52, 68, 110, 0.16),
                  borderRadius: SizeConfig.getPt(24),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.getPt(16),
                        right: SizeConfig.getPt(16),
                        top: SizeConfig.getPt(29),
                        bottom: SizeConfig.getPt(24)),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: SizeConfig.getPt(50),
                              height: SizeConfig.getPt(50),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: SizeConfig.getPt(1),
                                      color: Color.fromRGBO(
                                          121, 133, 163, 10 / 100)),
                                  shape: BoxShape.circle),
                              //       <--- BoxDecoration here
                              child: Text(
                                "1",
                                style:
                                    TextStyle(fontSize: SizeConfig.getPt(24)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(width: SizeConfig.getPt(8)),
                            Text(
                              "Achievement",
                              style: TextStyle(
                                  color: MyColors.textLight,
                                  fontFamily: 'AvenirNext',
                                  fontSize: SizeConfig.getPt(12),
                                  fontStyle: FontStyle.normal),
                            )
                          ],
                        ),
                        SizedBox(height: SizeConfig.getPt(20)),
                        Divider(
                          color: Color.fromRGBO(52, 68, 110, 0.16),
                          height: SizeConfig.getPt(1),
                        ),
                        SizedBox(height: SizeConfig.getPt(20)),
                        Row(
                          children: <Widget>[
                            Container(
                              width: SizeConfig.getPt(50),
                              height: SizeConfig.getPt(50),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: SizeConfig.getPt(1),
                                      color: Color.fromRGBO(
                                          121, 133, 163, 10 / 100)),
                                  shape: BoxShape.circle),
                              //       <--- BoxDecoration here
                              child: Text(
                                "4",
                                style:
                                    TextStyle(fontSize: SizeConfig.getPt(24)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(width: SizeConfig.getPt(8)),
                            Text(
                              "Friends",
                              style: TextStyle(
                                  color: MyColors.textLight,
                                  fontFamily: 'AvenirNext',
                                  fontSize: SizeConfig.getPt(12),
                                  fontStyle: FontStyle.normal),
                            ),
                            Expanded(
                              flex: 1,
                              child: StackAvatarWidget(
                                listAvatarUrl: [
                                  "https://taoanhonline.com/wp-content/uploads/2019/08/hinh-anh-avatar-0.jpg",
                                  "https://thuthuatnhanh.com/wp-content/uploads/2019/08/avatar-cap-doi-de-thuong-nam.jpg",
                                  "https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png"
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.getPt(30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Your emotion",
                        style: TextStyle(
                            fontSize: SizeConfig.getPt(16),
                            color: MyColors.textLight,
                            fontFamily: Config.fontFamily,
                            fontWeight: FontWeight.w500)),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if (!isThisWeekSelected) {
                              setState(() {
                                isThisWeekSelected = true;
                              });
                            }
                          },
                          child: Container(
                            width: SizeConfig.getPt(87),
                            height: SizeConfig.getPt(28),
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                                color: isThisWeekSelected
                                    ? MyColors.greenA8
                                    : Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: isThisWeekSelected
                                      ? MyColors.colorPrimary
                                      : MyColors.textLight,
                                  width: SizeConfig.getPt(1),
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(SizeConfig.getPt(18)))),
                            child: Text(
                              "This Week",
                              style: TextStyle(
                                  fontFamily: Config.fontFamily,
                                  fontSize: SizeConfig.getPt(14),
                                  color: isThisWeekSelected
                                      ? MyColors.colorPrimary
                                      : MyColors.textLight,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (isThisWeekSelected) {
                              setState(() {
                                isThisWeekSelected = false;
                              });
                            }
                          },
                          child: Container(
                            width: SizeConfig.getPt(87),
                            height: SizeConfig.getPt(28),
                            margin: EdgeInsets.only(left: SizeConfig.getPt(8)),
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                                color: !isThisWeekSelected
                                    ? MyColors.greenA8
                                    : Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: !isThisWeekSelected
                                      ? MyColors.colorPrimary
                                      : MyColors.textLight,
                                  width: SizeConfig.getPt(1),
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(SizeConfig.getPt(18)))),
                            child: Text(
                              "This Month",
                              style: TextStyle(
                                  fontFamily: Config.fontFamily,
                                  fontSize: SizeConfig.getPt(14),
                                  color: !isThisWeekSelected
                                      ? MyColors.colorPrimary
                                      : MyColors.textLight,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.getPt(16)),
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
                SizedBox(height: SizeConfig.getPt(30)),
                Text("Best photo this week",
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
                  borderRadius: SizeConfig.getPt(16),
                  child: ClipRRect(
                    borderRadius:
                        new BorderRadius.circular(SizeConfig.getPt(16)),
                    child: Image.network(
                      "https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      fit: BoxFit.fill,
                      height: SizeConfig.getPt(200),
                      width: SizeConfig.screenWidth,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.getPt(16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getPt(16)),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.twitter,
                            size: SizeConfig.getPt(14),
                            color: MyColors.textLight,
                          ),
                          SizedBox(width: SizeConfig.getPt(16)),
                          Icon(
                            FontAwesomeIcons.instagram,
                            size: SizeConfig.getPt(14),
                            color: MyColors.textLight,
                          ),
                          SizedBox(width: SizeConfig.getPt(16)),
                          Icon(
                            FontAwesomeIcons.facebookF,
                            size: SizeConfig.getPt(14),
                            color: MyColors.textLight,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: SizeConfig.getPt(16)),
                      child: Text(
                        "12403 likes",
                        style: TextStyle(
                            fontFamily: Config.fontFamily,
                            fontSize: SizeConfig.getPt(14),
                            color: MyColors.textLight,
                            fontStyle: FontStyle.normal),
                      ),
                    )
                  ],
                )
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _ChartData {
  _ChartData(this.x, this.y1, this.y2);

  final String x;
  final num y1;
  final num y2;
}
