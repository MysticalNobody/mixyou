import 'package:flutter/material.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/screens/auth/provider.dart';

class VideoPage extends StatefulWidget {
  const VideoPage(this.authProvider, {Key key}) : super(key: key);
  final AuthProvider authProvider;

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 72),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              I18n.of(context).recordVideo,
              style: simpleWhiteTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
