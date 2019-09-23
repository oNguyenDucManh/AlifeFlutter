import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/SizeConfig.dart';

class AvatarWidget extends StatelessWidget {
  final String url;
  final int index;

  const AvatarWidget({Key key, @required this.url, this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: (index) * SizeConfig.getPt(40),
      child: Container(
        width: SizeConfig.getPt(50),
        height: SizeConfig.getPt(50),
        padding: EdgeInsets.all(SizeConfig.getPt(2)),
        // borde width
        decoration: new BoxDecoration(
          color: Colors.white,
          // border color
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
            radius: SizeConfig.getPt(25), backgroundImage: NetworkImage(url)),
      ),
    );
  }
}
