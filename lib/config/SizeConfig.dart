import "package:flutter/widgets.dart";

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;

  static double ratioScreenWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;

    ratioScreenWidth = screenWidth / 375;
  }

  static double getPt(double pt) {
    return ratioScreenWidth * pt;
  }
}
