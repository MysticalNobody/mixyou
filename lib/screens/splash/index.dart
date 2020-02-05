import 'package:flutter/material.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/res.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            color: MYColors.bg,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            I18n.of(context).title,
            style: displayTextStyle,
          ),
        )
      ],
    );
  }
}
