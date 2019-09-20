import 'package:flutter/material.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:flutter_app/myWidget/BottomNavyBar.dart';
import 'blankScreen.dart';
import 'myplansScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: MyColors.colorPrimary,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  PageController _pageViewController =
      PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
          child: PageView(
        controller: _pageViewController,
        children: <Widget>[
          MyPlansScreen(),
          BlankScreen(),
          BlankScreen(),
          BlankScreen()
        ],
        onPageChanged: (index) {
          setState(() {
            print("index: $index");
            currentIndex = index;
          });
        },
      )),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
          _pageViewController.jumpToPage(index);
        }),
        items: [
          BottomNavyBarItem(
              icon: "assets/images/ic_my_plans.png",
              title: Text('My Plans'),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
          BottomNavyBarItem(
              icon: "assets/images/ic_happy_day.png",
              title: Text('Happy Day'),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
          BottomNavyBarItem(
              icon: "assets/images/ic_dashboard.png",
              title: Text('Dashboard'),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
          BottomNavyBarItem(
              icon: "assets/images/ic_account.png",
              title: Text('Account'),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
        ],
      ),
    );
  }
}
