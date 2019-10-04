import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:flutter_lottie/flutter_lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashStateful();
  }
}

class SplashStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }
}

class SplashState extends State<SplashStateful> {
  SharedPreferences pref;

  LottieController controller;
  LottieController controller2;
  StreamController<double> newProgressStream;

  SplashState() {
    newProgressStream = new StreamController<double>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 1.5,
              child: LottieView.fromFile(
                filePath: "assets/animations/data.json",
                autoPlay: true,
                loop: false,
                reverse: false,
                onViewCreated: onViewCreated,
              ),
            ),
          )
        ],
      ),
    );
  }

  void onViewCreatedFile(LottieController controller) {
    this.controller2 = controller;
    newProgressStream.stream.listen((double progress) {
      this.controller2.setAnimationProgress(progress);
      print(progress);
//      if(progress==100){
//        Navigator.pushReplacementNamed(context, "/intro");
//      }
    });
  }

  void onViewCreated(LottieController controller) {
    this.controller = controller;

    // Listen for when the playback completes
    this.controller.onPlayFinished.listen((bool animationFinished) {
      print("Playback complete. Was Animation Finished? " +
          animationFinished.toString());
      SharedPreferences.getInstance().then((res) {
        pref = res;
        if (pref.getBool("isIntro") ?? false) {
          pref.setBool("isIntro", true);
          Navigator.pushReplacementNamed(context, "/intro");
        } else {
          Navigator.pushReplacementNamed(context, "/main");
        }
      });
    });
  }

  void dispose() {
    super.dispose();
    newProgressStream.close();
  }
}
