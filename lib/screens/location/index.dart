import 'package:flutter/material.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/screens/main/index.dart';
import 'package:mexyou/widgets/button.dart';
import 'package:page_transition/page_transition.dart';

class ShareLocationScreen extends StatefulWidget {
  @override
  _ShareLocationScreenState createState() => _ShareLocationScreenState();
}

class _ShareLocationScreenState extends State<ShareLocationScreen> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 24),
                child: Text(
                  I18n.of(context).title,
                  style: simpleWhiteTextStyle,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 104,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(I18n.of(context).searchForGirls, style: headerTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/share_location.png',
                        height: 170,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        I18n.of(context).allowAccessToGeo,
                        style: captionWhiteTextStyle,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Divider(
                        height: 1,
                        color: Colors.white.withOpacity(.5),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      MYButton(
                        text: I18n.of(context).shareLocation,
                        onTap: () => Navigator.pushReplacement(
                            context, PageTransition(child: MainScreen(), type: PageTransitionType.fade)),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
