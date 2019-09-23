import 'package:flutter/material.dart';
import 'package:flutter_app/config/Config.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';

class HappyDayScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HappyDayState();
  }
}

class HappyDayState extends State<HappyDayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: SizeConfig.screenWidth,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: SizeConfig.getPt(11)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.getPt(24),
                    right: SizeConfig.getPt(24),
                  ),
                  child: Text("Happy Day",
                      style: TextStyle(
                          fontSize: SizeConfig.getPt(36),
                          fontFamily: Config.fontFamily,
                          color: MyColors.colorPrimaryDark,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height: SizeConfig.getPt(30),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.getPt(24), right: SizeConfig.getPt(24)),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: SizeConfig.getPt(20),
                            width: SizeConfig.getPt(50),
                            decoration: BoxDecoration(
                                color: MyColors.red,
                                border: Border.all(
                                    color: MyColors.red,
                                    width: SizeConfig.getPt(1.5)),
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(SizeConfig.getPt(8)),
                                    topRight:
                                        Radius.circular(SizeConfig.getPt(8)),
                                    bottomLeft: Radius.zero,
                                    bottomRight: Radius.zero)),
                            child: Center(
                              child: Text(
                                "Today",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: Config.fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeConfig.getPt(10)),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.getPt(30),
                            width: SizeConfig.getPt(50),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: MyColors.red,
                                    width: SizeConfig.getPt(1.5)),
                                borderRadius: BorderRadius.only(
                                    bottomRight:
                                        Radius.circular(SizeConfig.getPt(8)),
                                    bottomLeft:
                                        Radius.circular(SizeConfig.getPt(8)),
                                    topLeft: Radius.zero,
                                    topRight: Radius.zero)),
                            child: Center(
                              child: Text(
                                "24",
                                style: TextStyle(
                                    color: MyColors.red,
                                    fontFamily: Config.fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: SizeConfig.getPt(18)),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(left: SizeConfig.getPt(16)),
                          child: Text(
                            "Tell with your heart!\nWhat made you happy today?",
                            style: TextStyle(
                                fontSize: SizeConfig.getPt(18),
                                fontFamily: Config.fontFamily,
                                fontStyle: FontStyle.normal,
                                color: MyColors.colorPrimaryDark),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.getPt(24),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: MyColors.backgroudGrey,
                  ),
                )
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: MyColors.colorPrimary,
      ),
    );
  }
}
