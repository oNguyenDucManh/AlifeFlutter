import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailHappyDayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: DetailHappyDayStateful(),
    );
  }
}

class DetailHappyDayStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailHappyDayState();
  }
}

class DetailHappyDayState extends State<DetailHappyDayStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          )),
      body: Center(
        child: Text("Detail"),
      ),
    );
  }
}
