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
                  top: SizeConfig.getPt(16),
                  left: SizeConfig.getPt(24),
                  right: SizeConfig.getPt(24)),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                          radius: SizeConfig.getPt(25),
                          backgroundImage: NetworkImage(linkAvt)),
                      Column(
                        children: <Widget>[
                          Text(
                            "Your time today",
                            style: TextStyle(
                                color: Color.fromRGBO(165, 174, 194, 1),
                                fontSize: SizeConfig.getPt(10)),
                          ),
                          SizedBox(height: SizeConfig.getPt(8)),
                          Text(
                            "750 min",
                            style: TextStyle(
                                color: MyColors.colorPrimaryDark,
                                fontSize: SizeConfig.getPt(16),
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.getPt(9.3),
                        bottom: SizeConfig.getPt(12)),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Good Morning",
                        style: TextStyle(
                            color: Color.fromRGBO(121, 133, 163, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.getPt(14)),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Nguyen Duc Manh",
                        style: TextStyle(
                            color: MyColors.colorPrimaryDark,
                            fontSize: SizeConfig.getPt(18),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.getPt(36),
                          left: SizeConfig.getPt(24),
                          right: SizeConfig.getPt(24),
                          bottom: SizeConfig.getPt(8)),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: new TextSpan(
                            style: TextStyle(
                                color: Color.fromRGBO(34, 52, 94, 1),
                                fontSize: SizeConfig.getPt(36),
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              new TextSpan(text: "Setup your plans\n"),
                              new TextSpan(
                                  text: "make you happy\n",
                                  style:
                                      TextStyle(color: MyColors.colorPrimary)),
                              new TextSpan(text: "today...")
                            ]),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.getPt(69.3)),
                    width: SizeConfig.getPt(100.7),
                    height: SizeConfig.getPt(100.7),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: SizeConfig.getPt(100.7),
                          height: SizeConfig.getPt(100.7),
                          decoration: new BoxDecoration(
                            color: MyColors.redA8,
                            shape: BoxShape.circle,
                          )
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: SizeConfig.getPt(60),
                            height: SizeConfig.getPt(60),
                            decoration: new BoxDecoration(
                              color: MyColors.red,
                              shape: BoxShape.circle,
                            ),
                            child: new Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
