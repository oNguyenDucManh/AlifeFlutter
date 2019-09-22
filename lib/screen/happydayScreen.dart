import 'package:flutter/material.dart';
import 'package:flutter_app/myWidget/StackedBarChart.dart';

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
      body: Center(
        child: StackedBarChart.withSampleData(),
      ),
    );
  }
}
