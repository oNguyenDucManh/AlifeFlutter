import 'package:flutter/material.dart';
import 'package:flutter_app/arguments/DetailHappyDayArguments.dart';
import 'package:flutter_app/config/Config.dart';
import 'package:flutter_app/config/MyColors.dart';
import 'package:flutter_app/config/SizeConfig.dart';
import 'package:flutter_app/model/HappyDayResponse.dart';
import 'package:flutter_app/myWidget/CustomCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemHappyDay extends StatelessWidget {
  HappyDayModel _happyDayModel;
  int position = 0;

  ItemHappyDay(this._happyDayModel, this.position);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/detailHappyDay",
            arguments: DetailHappyDayArguments(_happyDayModel, position));
      },
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.getPt(8),
            bottom: SizeConfig.getPt(8),
            left: SizeConfig.getPt(24),
            right: SizeConfig.getPt(24)),
        child: CustomCard(
          elevation: SizeConfig.getPt(16),
          color: Colors.white,
          shadowColor: Color.fromRGBO(52, 68, 110, 0.16),
          borderRadius: SizeConfig.getPt(16),
          child: Container(
//          width: SizeConfig.screenWidth,
            child: _childWithImage(),
          ),
        ),
      ),
    );
  }

  Widget _childWithImage() {
    return Column(
      children: <Widget>[
        Hero(
          tag: 'imageHappyDay$position',
          child: ClipRRect(
            borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(SizeConfig.getPt(16)),
                topRight: Radius.circular(SizeConfig.getPt(16))),
            child: Image.network(
              _happyDayModel.imgUrl,
              width: SizeConfig.screenWidth,
              height: SizeConfig.getPt((_happyDayModel.imgUrl != null &&
                      _happyDayModel.imgUrl.isNotEmpty)
                  ? 200
                  : 0),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
              top: SizeConfig.getPt(10),
              left: SizeConfig.getPt(16),
              right: SizeConfig.getPt(16),
              bottom: SizeConfig.getPt(17)),
          child: Text(
            _happyDayModel.title,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: MyColors.colorPrimaryDark,
                fontSize: SizeConfig.getPt(16),
                fontFamily: Config.fontFamily,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: SizeConfig.getPt(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.getPt(16)),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.twitter,
                      size: SizeConfig.getPt(
                          _happyDayModel.isHideTwister ? 0 : 14),
                      color: MyColors.greyLight,
                    ),
                    SizedBox(
                        width: SizeConfig.getPt(
                            _happyDayModel.isHideTwister ? 0 : 16)),
                    Icon(
                      FontAwesomeIcons.instagram,
                      size: SizeConfig.getPt(
                          _happyDayModel.isHideInstagram ? 0 : 14),
                      color: MyColors.greyLight,
                    ),
                    SizedBox(
                        width: SizeConfig.getPt(
                            _happyDayModel.isHideInstagram ? 0 : 16)),
                    Icon(
                      FontAwesomeIcons.facebookF,
                      size: SizeConfig.getPt(
                          _happyDayModel.isHideFacebook ? 0 : 14),
                      color: MyColors.greyLight,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.getPt(16)),
                child: Text(
                  "12403 likes",
                  style: TextStyle(
                      fontFamily: Config.fontFamily,
                      fontSize: SizeConfig.getPt(14),
                      color: MyColors.greyLight,
                      fontStyle: FontStyle.normal),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
