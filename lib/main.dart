import 'package:flutter/material.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'screen/mainScreen.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:flutter_app/config/SizeConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: MyColors.colorPrimary),
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
  void gotoMain() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
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
    // TODO: implement initState
    super.initState();
    isLastPage = false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    setState(() {
      if (isLastPage) {
        marginRightNext = 0;
      } else {
        marginRightNext = SizeConfig.safeBlockHorizontal * 8;
      }
    });
    return Scaffold(
        body: Stack(
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
          indicatorColor: Color.fromRGBO(221, 224, 232, 1),
          indicatorSelectorColor: Color.fromRGBO(84, 70, 219, 1),
          shape: IndicatorShape.circle(size: 8),
          padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 13),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(
                  bottom: SizeConfig.safeBlockVertical * 10,
                  left: SizeConfig.safeBlockHorizontal * 8,
                  right: marginRightNext),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[skipView(), nextView()],
              ),
            ))
      ],
    ));
  }

  Widget skipView() {
    return Container(
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
      child: GestureDetector(
        child: Text("Skip",
            style: TextStyle(
                color: Color.fromRGBO(11, 17, 63, 1),
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                fontWeight: FontWeight.w500)),
        onTap: () => gotoMain(),
      ),
    );
  }

  Widget nextView() {
    if (!isLastPage) {
      return GestureDetector(
        child: Container(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
            child: Text("Next",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.w500))),
        onTap: () => clickNext(),
      );
    } else {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.only(
              top: SizeConfig.safeBlockHorizontal * 3,
              left: SizeConfig.safeBlockHorizontal * 3,
              right: SizeConfig.safeBlockHorizontal * 5,
              bottom: SizeConfig.safeBlockHorizontal * 3),
          decoration: new BoxDecoration(
              color: Color.fromRGBO(93, 219, 204, 0.3),
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  bottomLeft: const Radius.circular(40.0))),
          child: Text("Get Started",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
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
                      top: SizeConfig.safeBlockVertical * 12,
                      left: SizeConfig.safeBlockHorizontal * 16,
                      right: SizeConfig.safeBlockHorizontal * 16),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.safeBlockHorizontal * 10,
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
                        left: SizeConfig.safeBlockHorizontal * 8,
                        right: SizeConfig.safeBlockHorizontal * 8,
                        top: SizeConfig.safeBlockVertical * 6),
                    child: Text(
                      description,
                      style: TextStyle(
                          color: Color.fromRGBO(11, 17, 63, 1),
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
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
