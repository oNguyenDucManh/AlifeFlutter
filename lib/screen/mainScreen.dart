import 'package:flutter/material.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:flutter_app/myWidget/BottomNavyBar.dart';
import 'blankScreen.dart';
import 'dashboardScreen.dart';
import 'happydayScreen.dart';
import 'myplansScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
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
      backgroundColor: Colors.white,
      body: Container(
          child: PageView(
        controller: _pageViewController,
        children: <Widget>[
          MyPlansScreen(),
          HappyDayScreen(),
          DashboardScreen(),
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
              title: Text(
                'My Plans',
                style: TextStyle(fontSize: SizeConfig.getPt(12)),
              ),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
          BottomNavyBarItem(
              icon: "assets/images/ic_happy_day.png",
              title: Text(
                'Happy Day',
                style: TextStyle(fontSize: SizeConfig.getPt(12)),
              ),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
          BottomNavyBarItem(
              icon: "assets/images/ic_dashboard.png",
              title: Text(
                'Dashboard',
                style: TextStyle(fontSize: SizeConfig.getPt(12)),
              ),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
          BottomNavyBarItem(
              icon: "assets/images/ic_account.png",
              title: Text(
                'Account',
                style: TextStyle(fontSize: SizeConfig.getPt(12)),
              ),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
        ],
      ),
    );
  }
}
