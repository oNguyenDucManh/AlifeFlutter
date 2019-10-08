import 'package:flutter/material.dart';
import 'package:flutter_app/config/Config.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';

class DialogAddSuccess extends StatelessWidget {
  final GestureTapCallback onPositionClick;

  DialogAddSuccess({this.onPositionClick});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(0),
          width: SizeConfig.getPt(295),
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: MyColors.white,
            borderRadius:
                new BorderRadius.all(new Radius.circular(SizeConfig.getPt(24))),
          ),
          child: new Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.getPt(16)),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.remove_circle,
                        size: SizeConfig.getPt(24), color: MyColors.grey),
                  ),
                ),
              ),
              Image.asset(
                "assets/images/ic_lovely.png",
                height: SizeConfig.getPt(95),
              ),
              SizedBox(height: SizeConfig.getPt(8)),
              Text(
                "Lovely".toUpperCase(),
                style: TextStyle(
                    fontFamily: Config.fontFamily,
                    fontWeight: FontWeight.w600,
                    color: MyColors.red,
                    fontSize: SizeConfig.getPt(14)),
              ),
              SizedBox(height: SizeConfig.getPt(16)),
              Text(
                "Congrats!",
                style: TextStyle(
                    fontFamily: Config.fontFamily,
                    fontWeight: FontWeight.w600,
                    color: MyColors.colorPrimaryDark,
                    fontSize: SizeConfig.getPt(24)),
              ),
              SizedBox(height: SizeConfig.getPt(16)),
              Text(
                "You just get new achievement",
                style: TextStyle(
                    fontFamily: Config.fontFamily,
                    fontWeight: FontWeight.w500,
                    color: MyColors.textLight,
                    fontSize: SizeConfig.getPt(16)),
              ),
              SizedBox(height: SizeConfig.getPt(26)),
              Container(
                height: SizeConfig.getPt(60),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: MyColors.colorPrimary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(SizeConfig.getPt(24)),
                      bottomRight: Radius.circular(SizeConfig.getPt(24))),
                ),
                child: InkWell(
                  onTap: onPositionClick,
                  child: Center(
                    child: Text(
                      "OK",
                      style: TextStyle(
                          fontFamily: Config.fontFamily,
                          fontWeight: FontWeight.w600,
                          color: MyColors.white,
                          fontSize: SizeConfig.getPt(18)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
