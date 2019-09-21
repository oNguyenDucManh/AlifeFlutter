import 'package:flutter/material.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:flutter_app/myWidget/CustomCard.dart';

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
                top: SizeConfig.getPt(11)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Dashboard",
                    style: TextStyle(
                        fontSize: SizeConfig.getPt(36),
                        fontFamily: 'AvenirNext',
                        color: MyColors.colorPrimaryDark,
                        fontWeight: FontWeight.w600)),
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.getPt(25), bottom: SizeConfig.getPt(14)),
                  child: Text("Overview",
                      style: TextStyle(
                          fontSize: SizeConfig.getPt(16),
                          fontFamily: 'AvenirNext',
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
                                    fontFamily: 'AvenirNext',
                                    fontSize: SizeConfig.getPt(36)),
                              ),
                              SizedBox(height: SizeConfig.getPt(5)),
                              Text(
                                "120 task",
                                style: TextStyle(
                                    color: MyColors.colorPrimaryDark,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'AvenirNext',
                                    fontSize: SizeConfig.getPt(14)),
                              ),
                              SizedBox(height: SizeConfig.getPt(10)),
                              Text(
                                "Task done",
                                style: TextStyle(
                                    color: MyColors.textLight,
                                    fontFamily: 'AvenirNext',
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
                                    fontFamily: 'AvenirNext',
                                    fontSize: SizeConfig.getPt(36)),
                              ),
                              SizedBox(height: SizeConfig.getPt(5)),
                              Text(
                                "55 posts",
                                style: TextStyle(
                                    color: MyColors.colorPrimaryDark,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'AvenirNext',
                                    fontSize: SizeConfig.getPt(14)),
                              ),
                              SizedBox(height: SizeConfig.getPt(10)),
                              Text(
                                "Likes",
                                style: TextStyle(
                                    color: MyColors.textLight,
                                    fontFamily: 'AvenirNext',
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
                          color: Color.fromRGBO(52, 68, 110, 0.16),height: SizeConfig.getPt(1),
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
                            )
                          ],
                        ),
                      ],
                    ),
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
