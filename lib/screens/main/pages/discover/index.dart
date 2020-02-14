import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/screens/main/pages/discover/widgets/card.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                I18n.of(context).title,
                style: TextStyle(
                    fontSize: 33, fontWeight: FontWeight.w100, fontFamily: mainFontFamily, color: MYColors.whiteText),
              )
            ],
          ),
          Container(
            width: width,
            height: height - kBottomNavigationBarHeight - 124,
            child: TinderSwapCard(
              cardBuilder: (BuildContext context, int index) {
                return MYTinderCard(
                  images: [
                    'https://cdn.pixabay.com/photo/2015/02/02/11/09/office-620822_1280.jpg',
                    'https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_1280.jpg',
                  ],
                );
              },
              swipeEdge: 3,
              stackNum: 3,
              maxWidth: width * .9,
              maxHeight: height - kBottomNavigationBarHeight - 140,
              minWidth: width * .7,
              minHeight: height - kBottomNavigationBarHeight - 160,
              totalNum: 3,
            ),
          ),
        ],
      ),
    );
  }
}
