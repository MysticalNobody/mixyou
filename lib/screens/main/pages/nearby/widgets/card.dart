import 'package:flutter/material.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/icons_font.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/widgets/image.dart';

class CoupleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: MediaQuery.of(context).size.width * .5 - 24,
        height: 200,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: MYImage(
                'https://cdn.pixabay.com/photo/2015/02/02/11/09/office-620822_1280.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      I18n.of(context).noName,
                      style:
                          TextStyle(color: MYColors.whiteText, fontWeight: FontWeight.w900, fontFamily: mainFontFamily),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Color(0xff1f1f1f), borderRadius: BorderRadius.circular(9.5)),
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            MYIcons.female,
                            color: MYColors.whiteText,
                            size: 10,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '0',
                            style: TextStyle(fontSize: 10, color: MYColors.whiteBg, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
