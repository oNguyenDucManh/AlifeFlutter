import 'package:flutter/material.dart';
import 'package:flutter_app/config/Config.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:flutter_app/model/MyPlan.dart';
import 'package:flutter_app/myWidget/CustomCard.dart';

class ItemMyPlans extends StatelessWidget {
  int _position;
  MyPlan _myPlan;

  ItemMyPlans(this._position, this._myPlan);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
          bottom: SizeConfig.getPt(16),
          left: SizeConfig.getPt(24),
          right: SizeConfig.getPt(24)),
      child: CustomCard(
        elevation: SizeConfig.getPt(16),
        color: Colors.white,
        shadowColor: Color.fromRGBO(52, 68, 110, 0.16),
        borderRadius: SizeConfig.getPt(8),
        child: Row(
          children: <Widget>[
            Container(
              width: SizeConfig.getPt(32),
              height: SizeConfig.getPt(60),
              decoration: BoxDecoration(
                  color: MyColors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(SizeConfig.getPt(8)),
                      topLeft: Radius.circular(SizeConfig.getPt(8)))),
              child: Center(
                child: Text(
                  _position.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.getPt(18),
                      fontFamily: Config.fontFamily,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: SizeConfig.getPt(60),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    left: SizeConfig.getPt(15), right: SizeConfig.getPt(15)),
                child: Text(
                  _myPlan.text ?? "",
                  style: TextStyle(
                      color: MyColors.colorPrimaryDark,
                      fontSize: SizeConfig.getPt(18),
                      fontFamily: Config.fontFamily,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
