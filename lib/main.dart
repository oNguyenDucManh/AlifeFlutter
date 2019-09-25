import 'package:flutter/material.dart';
import 'package:flutter_app/screen/DetailHappyDayScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screen/mainScreen.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:flutter_app/config/SizeConfig.dart';

void main() => runApp(MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyApp(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/main': (context) => MainScreen(),
        '/detailHappyDay': (context) => DetailHappyDayScreen(),
      },
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
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
  SharedPreferences pref;

  gotoMain() {
    Navigator.pushReplacementNamed(context, '/main');
  }

  void clickNext() {
    if (isLastPage) {
      gotoMain();
    } else {
      setState(() {
        currentPage++;
        print("click next $currentPage");
        _controller.animateToPage(currentPage,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      });
    }
  }

  bool isLastPage = false;
  double marginRightNext = 0;
  int currentPage = 0;
  PageController _controller = PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    isLastPage = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    setState(() {
      if (isLastPage) {
        marginRightNext = 0;
      } else {
        marginRightNext = SizeConfig.getPt(8);
      }
    });
    return Stack(
      children: <Widget>[
        PageIndicatorContainer(
          child: PageView(
            controller: _controller,
            children: <Widget>[
              pageChild(
                  "Create plans for happy day",
                  "Setup your plans make you happy today and try to complete them.",
                  "bg_splash_2.png"),
              pageChild(
                  "Your life\nis happy",
                  "Share your feelings and happy messages with people.",
                  "bg_splash_1.png"),
              pageChild(
                  "Meet fiends around you",
                  "Connect great friends around you to tell them interesting stories.",
                  "bg_splash_3.png")
            ],
            onPageChanged: (int page) {
              if (page == 2) {
                setState(() {
                  isLastPage = true;
                  currentPage = page;
                });
              } else {
                setState(() {
                  isLastPage = false;
                  currentPage = page;
                });
              }
            },
          ),
          align: IndicatorAlign.bottom,
          length: 3,
          indicatorColor: Color.fromRGBO(221, 224, 233, 1),
          indicatorSelectorColor: Color.fromRGBO(84, 70, 219, 1),
          shape: IndicatorShape.circle(size: 8),
          padding: EdgeInsets.only(bottom: SizeConfig.getPt(76)),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(
                  bottom: SizeConfig.getPt(54.6),
                  left: SizeConfig.getPt(32),
                  right: marginRightNext),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[skipView(), nextView()],
              ),
            ))
      ],
    );
  }

  Widget skipView() {
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.getPt(14), bottom: SizeConfig.getPt(14)),
      child: GestureDetector(
        child: Text("Skip",
            style: TextStyle(
                color: Color.fromRGBO(34, 52, 94, 1),
                fontSize: SizeConfig.getPt(16),
                fontWeight: FontWeight.w500)),
        onTap: () => gotoMain(),
      ),
    );
  }

  Widget nextView() {
    if (!isLastPage) {
      return GestureDetector(
        child: Container(
            padding: EdgeInsets.only(
                top: SizeConfig.getPt(14),
                bottom: SizeConfig.getPt(14),
                right: SizeConfig.getPt(32)),
            child: Text("Next",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: SizeConfig.getPt(16),
                    fontWeight: FontWeight.w500))),
        onTap: () => clickNext(),
      );
    } else {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.only(
              top: SizeConfig.getPt(14),
              bottom: SizeConfig.getPt(14),
              right: SizeConfig.getPt(32),
              left: SizeConfig.getPt(16)),
          decoration: new BoxDecoration(
              color: Color.fromRGBO(93, 219, 204, 0.3),
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  bottomLeft: const Radius.circular(40.0))),
          child: Text("Get Started",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: SizeConfig.getPt(16),
                  fontWeight: FontWeight.w500)),
        ),
        onTap: () => clickNext(),
      );
    }
  }

  Widget pageChild(String title, String description, String imageName) {
    return Container(
      width: SizeConfig.screenWidth,
      color: Color.fromRGBO(93, 219, 204, 1),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(children: <Widget>[
              Container(
                child: Image.asset(
                  "assets/images/" + imageName,
                  width: SizeConfig.screenWidth,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                  width: SizeConfig.screenWidth,
                  padding: EdgeInsets.only(
                      top: SizeConfig.getPt(91.5),
                      left: SizeConfig.getPt(16),
                      right: SizeConfig.getPt(16)),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.getPt(36),
                        fontFamily: 'AvenirNext',
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ))
            ]),
            flex: 2,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: SizeConfig.screenWidth,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.getPt(32),
                        right: SizeConfig.getPt(32),
                        top: SizeConfig.getPt(32)),
                    child: Text(
                      description,
                      style: TextStyle(
                          color: Color.fromRGBO(34, 52, 94, 1),
                          fontSize: SizeConfig.getPt(18),
                          fontFamily: 'AvenirNext',
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
