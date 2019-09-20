import 'package:flutter/material.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';

//class MyPlansScreen extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//          primaryColor: MyColors.colorPrimary),
//      home: MyPlansStateful(),
//    );
//  }
//
//}

class MyPlansScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyPlansState();
  }
}

class MyPlansState extends State<MyPlansScreen> {
  String linkAvt =
      "https://scontent.fhan5-5.fna.fbcdn.net/v/t1.0-9/61109468_1057276004465467_4065373393921245184_n.jpg?_nc_cat=101&_nc_oc=AQk2vP9lBxD4uORqYRmuMGjOmjrtt2FUPYd0xp8cXgB1vwR6o2S9FwpuzQgfhoVnz3c&_nc_ht=scontent.fhan5-5.fna&oh=38a65a064dad26fbf1f0e8896a18b10f&oe=5DF39D03";
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                  top: SizeConfig.safeBlockVertical * 2,
                  left: SizeConfig.safeBlockHorizontal * 8,
                  right: SizeConfig.safeBlockHorizontal * 8),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                          radius: SizeConfig.safeBlockVertical * 3,
                          backgroundImage: NetworkImage(linkAvt)),
                      Column(
                        children: <Widget>[
                          Text(
                            "Your time today",
                            style: TextStyle(
                                color: Color.fromRGBO(165, 174, 194, 1),
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 1.2),
                          Text(
                            "750 min",
                            style: TextStyle(
                                color: MyColors.colorPrimaryDark,
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 1.5,
                        bottom: SizeConfig.safeBlockVertical * 1.5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Good Morning",
                        style: TextStyle(
                            color: Color.fromRGBO(136, 147, 174, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.safeBlockHorizontal * 4),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Nguyen Duc Manh",
                        style: TextStyle(
                            color: MyColors.colorPrimaryDark,
                            fontSize: SizeConfig.safeBlockHorizontal * 5,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.safeBlockHorizontal * 8,
                          left: SizeConfig.safeBlockHorizontal * 4,
                          right: SizeConfig.safeBlockHorizontal * 4,
                          bottom: SizeConfig.safeBlockHorizontal * 6),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: new TextSpan(
                            style: TextStyle(
                                color: MyColors.colorPrimaryDark,
                                fontSize: SizeConfig.safeBlockHorizontal * 9,
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              new TextSpan(text: "Setup your plans "),
                              new TextSpan(
                                  text: "make you happy ",
                                  style:
                                      TextStyle(color: MyColors.colorPrimary)),
                              new TextSpan(text: "today...")
                            ]),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.safeBlockHorizontal * 8),
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 18,
                        height: SizeConfig.safeBlockHorizontal * 18,
                        decoration: new BoxDecoration(
                          color: MyColors.red,
                          shape: BoxShape.circle,
                        ),
                        child: new Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ))
                ],
              ))),
    );
  }
}
