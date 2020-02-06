import 'package:flutter/material.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/res.dart';

import '../../provider.dart';

class GenderPage extends StatefulWidget {
  const GenderPage(this.authProvider, {Key key}) : super(key: key);

  final AuthProvider authProvider;

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 128, left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Text(
            I18n.of(context).yourGender,
            style: displayTextStyle,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Text(
                  'M',
                  style: genderButtonTextStyle,
                ),
              ),
              GestureDetector(
                child: Text(
                  'W',
                  style: genderButtonTextStyle,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
