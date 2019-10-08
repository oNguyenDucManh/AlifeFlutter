import 'package:flutter/material.dart';
import 'package:flutter_app/config/Config.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:flutter_app/model/HappyDayResponse.dart';
import 'package:flutter_app/myWidget/DialogAddSuccess.dart';
import 'package:flutter_app/screen/itemHappyDay.dart';
import 'package:flutter_app/utils/UserBloc.dart';

class HappyDayScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HappyDayState();
  }
}

class HappyDayState extends State<HappyDayScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<HappyDayScreen>  {
  int _angle = 90;
  Color _color = MyColors.colorPrimary;
  bool _isRotated = true;

  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _animation;
  Animation<double> _animation2;
  Animation<double> _animation3;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );

    _animation = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 1.0, curve: Curves.linear),
    );

    _animation2 = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.5, 1.0, curve: Curves.linear),
    );

    _animation3 = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.8, 1.0, curve: Curves.linear),
    );

    _colorAnimation =
        ColorTween(begin: MyColors.colorPrimary, end: MyColors.colorPrimaryDark)
            .animate(this._controller);
    _controller.reverse();
    super.initState();
    bloc.getListHappyDay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this._controller.dispose();
  }

  void _rotate() {
    setState(() {
      if (_isRotated) {
        _angle = 45;
        _isRotated = false;
        _color = MyColors.colorPrimaryDark;
        _controller.forward();
      } else {
        _angle = 90;
        _isRotated = true;
        _color = MyColors.colorPrimary;
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
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
                          left: SizeConfig.getPt(24),
                          right: SizeConfig.getPt(24)),
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
                                        topLeft: Radius.circular(
                                            SizeConfig.getPt(8)),
                                        topRight: Radius.circular(
                                            SizeConfig.getPt(8)),
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
                                        bottomRight: Radius.circular(
                                            SizeConfig.getPt(8)),
                                        bottomLeft: Radius.circular(
                                            SizeConfig.getPt(8)),
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
                              margin:
                              EdgeInsets.only(left: SizeConfig.getPt(16)),
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
                      child: StreamBuilder<HappyDayResponse>(
                          stream: bloc.subject.stream,
                          builder: (context,
                              AsyncSnapshot<HappyDayResponse> snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.error != null && snapshot.data
                                  .error.length > 0) {
                                return Center(
                                  child: Text(snapshot.data.error),
                                );
                              } else {
                                return Container(
                                  color: MyColors.backgroudGrey,
                                  child: ListView.builder(
                                    itemBuilder: (context, position) {
                                      return ItemHappyDay(snapshot.data.data[position], position);
                                    },
                                    itemCount: snapshot.data
                                        .data.length,
                                  ),
                                );
                              }
                            }
                            else {
                              return Container();
                            }
                          }
                      ),
                    )
                  ]),
            ),
            Positioned(
                bottom: SizeConfig.getPt(24),
                right: SizeConfig.getPt(200),
                child: new Container(
                  child: new ScaleTransition(
                    scale: _animation3,
                    alignment: FractionalOffset.center,
                    child: new Material(
                        color: MyColors.blue,
                        type: MaterialType.circle,
                        elevation: 6.0,
                        child: new GestureDetector(
                          child: new Container(
                              width: SizeConfig.getPt(50),
                              height: SizeConfig.getPt(50),
                              child: new InkWell(
                                onTap: () {
                                  if (_angle == 45.0) {
                                    _showDialog();
                                  }
                                },
                                child: new Center(
                                  child: Icon(
                                    Icons.title,
                                    color: Colors.white,
                                    size: SizeConfig.getPt(32),
                                  ),
                                ),
                              )),
                        )),
                  ),
                )),
            Positioned(
                bottom: SizeConfig.getPt(24),
                right: SizeConfig.getPt(140),
                child: new Container(
                  child: ScaleTransition(
                    scale: _animation2,
                    alignment: FractionalOffset.center,
                    child: new Material(
                        color: MyColors.red,
                        type: MaterialType.circle,
                        elevation: 6.0,
                        child: new GestureDetector(
                          child: new Container(
                              width: SizeConfig.getPt(50),
                              height: SizeConfig.getPt(50),
                              child: new InkWell(
                                onTap: () {
                                  if (_angle == 45.0) {
                                    _showDialog();
                                  }
                                },
                                child: new Center(
                                  child: new Icon(
                                    Icons.camera_alt,
                                    size: SizeConfig.getPt(32),
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        )),
                  ),
                )),
            Positioned(
                bottom: SizeConfig.getPt(24),
                right: SizeConfig.getPt(82),
                child: new Container(
                  child: new ScaleTransition(
                    scale: _animation,
                    alignment: FractionalOffset.center,
                    child: new Material(
                        color: MyColors.colorPrimary,
                        type: MaterialType.circle,
                        elevation: 6.0,
                        child: new GestureDetector(
                          child: new Container(
                              width: SizeConfig.getPt(50),
                              height: SizeConfig.getPt(50),
                              child: new InkWell(
                                onTap: () {
                                  if (_angle == 45.0) {
                                    _showDialog();
                                  }
                                },
                                child: new Center(
                                  child: new Icon(
                                    Icons.mic,
                                    size: SizeConfig.getPt(32),
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        )),
                  ),
                )),
            Positioned(
                bottom: SizeConfig.getPt(24),
                right: SizeConfig.getPt(24),
                child: new Material(
                    color: _color,
                    type: MaterialType.circle,
                    elevation: 6.0,
                    child: new GestureDetector(
                      child: new Container(
                          width: SizeConfig.getPt(44),
                          height: SizeConfig.getPt(44),
                          child: new InkWell(
                            onTap: _rotate,
                            child: new Center(
                                child: new RotationTransition(
                                  turns: new AlwaysStoppedAnimation(
                                      _angle / 360),
                                  child: new Icon(
                                    Icons.add,
                                    color: new Color(0xFFFFFFFF),
                                  ),
                                )),
                          )),
                    )))
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.getPt(24)))),
          content: DialogAddSuccess(onPositionClick: () {
            Navigator.of(context).pop();
          }),
          contentPadding: EdgeInsets.all(0),
        );
      },
    );
  }
}
