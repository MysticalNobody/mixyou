import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../generated/i18n.dart';
import '../../../../res/res.dart';
import '../../../../res/res.dart';
import '../../provider.dart';

class InfoPage extends StatefulWidget {
  const InfoPage(this.authProvider, {Key key}) : super(key: key);
  final AuthProvider authProvider;
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 104, left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            child: Text(
              I18n.of(context).tellUs,
              style: headerTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
