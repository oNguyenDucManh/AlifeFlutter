import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_app/config/MyColors.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: PageView()),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
              currentIndex = index;
            }),
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.favorite),
              title: Text('My Plans'),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
          BottomNavyBarItem(
              icon: Icon(Icons.tag_faces),
              title: Text('Happy Day'),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
          BottomNavyBarItem(
              icon: Icon(Icons.insert_chart),
              title: Text('Dashboard'),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
          BottomNavyBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Account'),
              activeColor: MyColors.colorPrimary,
              inactiveColor: MyColors.colorPrimaryDark),
        ],
      ),
    );
  }
}
