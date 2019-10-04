import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/arguments/DetailHappyDayArguments.dart';
import 'package:flutter_app/config/Config.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

class DetailHappyDayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailHappyDayStateful();
  }
}

class DetailHappyDayStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailHappyDayState();
  }
}

class DetailHappyDayState extends State<DetailHappyDayStateful> {
  @override
  Widget build(BuildContext context) {
    final DetailHappyDayArguments _detailArgument =
        ModalRoute.of(context).settings.arguments;
    final int _position = _detailArgument.position;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: MyColors.colorPrimary,
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz, color: MyColors.colorPrimary),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
            left: SizeConfig.getPt(24), right: SizeConfig.getPt(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: "imageHappyDay$_position",
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(SizeConfig.getPt(16)),
                child: Image.network(
                  _detailArgument.happyDayModel.imgUrl,
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.getPt(
                      (_detailArgument.happyDayModel.imgUrl != null &&
                              _detailArgument.happyDayModel.imgUrl.isNotEmpty)
                          ? 200
                          : 0),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
                height: SizeConfig.getPt(
                    (_detailArgument.happyDayModel.imgUrl != null &&
                            _detailArgument.happyDayModel.imgUrl.isNotEmpty)
                        ? 24
                        : 0)),
            Text(
              _detailArgument.happyDayModel.title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: MyColors.colorPrimaryDark,
                  fontSize: SizeConfig.getPt(24),
                  fontFamily: Config.fontFamily,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: SizeConfig.getPt(24)),
            Text(
              _detailArgument.happyDayModel.content ?? "",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: MyColors.colorPrimaryDark,
                  fontSize: SizeConfig.getPt(18),
                  fontFamily: Config.fontFamily,
                  fontStyle: FontStyle.normal),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: SizeConfig.getPt(94),
        padding: EdgeInsets.only(
            left: SizeConfig.getPt(24), right: SizeConfig.getPt(24)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.twitter,
                      size: SizeConfig.getPt(14),
                      color: MyColors.greyLight,
                    ),
                    SizedBox(width: SizeConfig.getPt(16)),
                    Icon(
                      FontAwesomeIcons.instagram,
                      size: SizeConfig.getPt(14),
                      color: MyColors.greyLight,
                    ),
                    SizedBox(width: SizeConfig.getPt(16)),
                    Icon(
                      FontAwesomeIcons.facebookF,
                      size: SizeConfig.getPt(14),
                      color: MyColors.greyLight,
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.getPt(14)),
                Text(
                  _detailArgument.happyDayModel.countLike.toString() + " likes",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: Config.fontFamily,
                      fontSize: SizeConfig.getPt(14),
                      color: MyColors.greyLight,
                      fontStyle: FontStyle.normal),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
//                _showBottomSheet(context);
                Toast.show("aaaa", context,
                    duration: Toast.LENGTH_SHORT,
                    gravity: Toast.BOTTOM);
              },
              child: Container(
                child: Center(
                  child: Text(
                    "Share",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: Config.fontFamily,
                        fontSize: SizeConfig.getPt(16),
                        color: Colors.white),
                  ),
                ),
                height: SizeConfig.getPt(50),
                width: SizeConfig.getPt(190),
                decoration: BoxDecoration(
                    color: MyColors.colorPrimary,
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.getPt(24)))),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: MyColors.shadow,
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  10.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              )
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeConfig.getPt(24)),
                topRight: Radius.circular(SizeConfig.getPt(24)))),
      ),
    );
  }

  int indexClick = 0;

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, state) {
            return Wrap(
              children: <Widget>[
                Container(
                  width: SizeConfig.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(SizeConfig.getPt(16)),
                            child: Icon(
                              Icons.remove_circle,
                              size: SizeConfig.getPt(24),
                              color: MyColors.grey,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(SizeConfig.getPt(8)),
                        child: Text(
                          "Choose the social network\nyou want to share",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: MyColors.colorPrimaryDark,
                              fontFamily: Config.fontFamily,
                              fontSize: SizeConfig.getPt(18),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getPt(24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              if (indexClick != 0) {
                                updateIndex(state, 0);
                              }
                            },
                            child: Container(
                              height: SizeConfig.getPt(100),
                              width: SizeConfig.getPt(80),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(SizeConfig.getPt(16))),
                                border: Border.all(
                                    width: SizeConfig.getPt(1),
                                    color: indexClick == 0
                                        ? MyColors.colorPrimary
                                        : Colors.white),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.facebookF,
                                    size: SizeConfig.getPt(30),
                                    color: indexClick == 0
                                        ? MyColors.colorPrimary
                                        : MyColors.textLight,
                                  ),
                                  SizedBox(height: SizeConfig.getPt(18)),
                                  Text(
                                    "Facebook",
                                    style: TextStyle(
                                        color: indexClick == 0
                                            ? MyColors.colorPrimary
                                            : MyColors.textLight,
                                        fontSize: SizeConfig.getPt(12),
                                        fontFamily: Config.fontFamily,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.getPt(6)),
                          GestureDetector(
                            onTap: () {
                              if (indexClick != 1) {
                                updateIndex(state, 1);
                              }
                            },
                            child: Container(
                              height: SizeConfig.getPt(100),
                              width: SizeConfig.getPt(80),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(SizeConfig.getPt(16))),
                                border: Border.all(
                                    width: SizeConfig.getPt(1),
                                    color: indexClick == 1
                                        ? MyColors.colorPrimary
                                        : Colors.white),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.instagram,
                                    size: SizeConfig.getPt(30),
                                    color: indexClick == 1
                                        ? MyColors.colorPrimary
                                        : MyColors.textLight,
                                  ),
                                  SizedBox(height: SizeConfig.getPt(18)),
                                  Text(
                                    "Instagram",
                                    style: TextStyle(
                                        color: indexClick == 1
                                            ? MyColors.colorPrimary
                                            : MyColors.textLight,
                                        fontSize: SizeConfig.getPt(12),
                                        fontFamily: Config.fontFamily,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.getPt(6)),
                          GestureDetector(
                            onTap: () {
                              if (indexClick != 2) {
                                updateIndex(state, 2);
                              }
                            },
                            child: Container(
                              height: SizeConfig.getPt(100),
                              width: SizeConfig.getPt(80),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(SizeConfig.getPt(16))),
                                border: Border.all(
                                    width: SizeConfig.getPt(1),
                                    color: indexClick == 2
                                        ? MyColors.colorPrimary
                                        : Colors.white),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.twitter,
                                    size: SizeConfig.getPt(30),
                                    color: indexClick == 2
                                        ? MyColors.colorPrimary
                                        : MyColors.textLight,
                                  ),
                                  SizedBox(height: SizeConfig.getPt(18)),
                                  Text(
                                    "Twitter",
                                    style: TextStyle(
                                        color: indexClick == 2
                                            ? MyColors.colorPrimary
                                            : MyColors.textLight,
                                        fontSize: SizeConfig.getPt(12),
                                        fontFamily: Config.fontFamily,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.getPt(36),
                      ),
                      Container(
                        height: SizeConfig.getPt(94),
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: MyColors.shadow,
                                blurRadius: 20.0,
                                // has the effect of softening the shadow
                                spreadRadius: 5.0,
                                // has the effect of extending the shadow
                                offset: Offset(
                                  10.0, // horizontal, move right 10
                                  10.0, // vertical, move down 10
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(SizeConfig.getPt(24)),
                                topRight:
                                    Radius.circular(SizeConfig.getPt(24)))),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.getPt(16)),
                                  child: Center(
                                    child: Text(
                                      "Share",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: Config.fontFamily,
                                          fontSize: SizeConfig.getPt(16),
                                          color: Colors.white),
                                    ),
                                  ),
                                  height: SizeConfig.getPt(50),
                                  width: SizeConfig.getPt(190),
                                  decoration: BoxDecoration(
                                      color: MyColors.colorPrimary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              SizeConfig.getPt(24)))),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          });
        });
  }

  Future<Null> updateIndex(StateSetter updateState, int newIndex) async {
    updateState(() {
      indexClick = newIndex;
    });
  }
}
