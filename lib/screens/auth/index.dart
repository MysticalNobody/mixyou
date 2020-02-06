import 'package:flutter/material.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:provider/provider.dart';
import 'package:mexyou/res/res.dart';

import 'pages/register/index.dart';
import 'pages/gender/index.dart';
import 'pages/video/index.dart';

import 'provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthProvider authProvider;

  PageController pageController;
  List<Widget> pages;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    authProvider = AuthProvider(pageController: pageController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: authProvider,
        child: Consumer<AuthProvider>(
          builder: (context, provider, _) {
            return Stack(
              children: <Widget>[
                Positioned.fill(
                  child: AnimatedOpacity(
                    child: Image.asset(
                      'assets/images/bg.png',
                      fit: BoxFit.fill,
                    ),
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    opacity: provider.page.index < 2 ? 1 : 0,
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Row(
                    children: [
                      for (int i = 0; i < AuthScreenPage.values.length; i++)
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: provider.page.index == i ? MYColors.whiteText : MYColors.greyText,
                          ),
                          width: 8,
                          height: 8,
                          margin: EdgeInsets.only(right: 18),
                        ),
                    ],
                  ),
                ),
                if (provider.page.index >= 1)
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Text(
                          I18n.of(context).title,
                          style: simpleWhiteTextStyle,
                        ),
                      ),
                    ),
                  ),
                SafeArea(
                  child: provider.getPageWidget()
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
