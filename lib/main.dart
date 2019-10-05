import 'package:flutter/material.dart';
import 'package:flutter_app/screen/DetailHappyDayScreen.dart';
import 'package:flutter_app/screen/introScreen.dart';
import 'package:flutter_app/screen/splashScreen.dart';
import 'screen/mainScreen.dart';

void main() => runApp(MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
//        '/': (context) => SplashScreen(),
        '/': (context) => IntroScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/intro': (context) => IntroScreen(),
        '/main': (context) => MainScreen(),
        '/detailHappyDay': (context) => DetailHappyDayScreen(),
      },
    ));
