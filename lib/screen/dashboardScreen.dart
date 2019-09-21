import 'package:flutter/material.dart';
import 'package:flutter_app/config/Config.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:flutter_app/myWidget/CustomCard.dart';
import 'package:flutter_app/myWidget/MyBarChart.dart';

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
                    height: SizeConfig.getPt(200),
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
                CustomCard(
                  elevation: SizeConfig.getPt(8),
                  color: Colors.white,
                  shadowColor: Color.fromRGBO(52, 68, 110, 0.16),
                  borderRadius: SizeConfig.getPt(24),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: SizeConfig.getPt(16),
                        bottom: SizeConfig.getPt(16),
                        left: SizeConfig.getPt(24),
                        right: SizeConfig.getPt(24)),
                    child: SimpleBarChart(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
