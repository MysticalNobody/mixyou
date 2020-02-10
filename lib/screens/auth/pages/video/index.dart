import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/screens/auth/provider.dart';

import '../../../../generated/i18n.dart';
import 'provider.dart';
import 'provider.dart';

class VideoPage extends StatefulWidget {
  const VideoPage(this.authProvider, {Key key}) : super(key: key);
  final AuthProvider authProvider;

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  VideoPageProvider videoPageProvider;
  @override
  void initState() {
    videoPageProvider = VideoPageProvider(widget.authProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 84),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      I18n.of(context).recordVideo,
                      style: simpleWhiteTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Image.asset(
                    'assets/images/selfies.png',
                    height: height * .4,
                    fit: BoxFit.contain,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 320,
                decoration: BoxDecoration(
                    color: MYColors.whiteBg.withOpacity(.9),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 26),
                      child: Center(
                        child: Text(
                          I18n.of(context).addVideo,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              color: MYColors.greyText,
                              fontFamily: mainFontFamily),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 36, left: 24, right: 24),
                      child: Center(
                        child: Text(
                          I18n.of(context).videoLimit,
                          style: TextStyle(fontSize: 17, color: MYColors.text, fontFamily: mainFontFamily),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () => videoPageProvider.selectVideo(),
                      title: Text(
                        I18n.of(context).camera,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: MYColors.greyText,
                            fontFamily: mainFontFamily),
                      ),
                      trailing: SvgPicture.asset(
                        'assets/icons/cam.svg',
                        height: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () => videoPageProvider.selectVideo(),
                      title: Text(
                        I18n.of(context).videoLibrary,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: MYColors.greyText,
                            fontFamily: mainFontFamily),
                      ),
                      trailing: SvgPicture.asset(
                        'assets/icons/video.svg',
                        height: 24,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => videoPageProvider.selectVideo(),
                        child: Container(
                          height: 41,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              border: Border.all(color: MYColors.buttonText, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              I18n.of(context).withoutRecording,
                              style: buttonTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
