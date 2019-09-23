import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:flutter_app/myWidget/AvatarWidget.dart';

class StackAvatarWidget extends StatelessWidget {
  final List<String> listAvatarUrl;

  const StackAvatarWidget({Key key, this.listAvatarUrl}) : super(key: key);

  List<Widget> childrenAvatar() {
    List<Widget> lstWidget = new List();
    if (listAvatarUrl == null || listAvatarUrl.length == 0) {
      Widget child = new Container();
      lstWidget.add(child);
    } else {
      for (var i = listAvatarUrl.length-1; i >= 0; i--) {
        lstWidget.add(new AvatarWidget(
          url: listAvatarUrl[i],
          index: i,
        ));
      }
    }
    return lstWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(left: SizeConfig.getPt(8)),
      height: SizeConfig.getPt(50),
      child: Stack(
        children: childrenAvatar(),
      ),
    );
  }
}
