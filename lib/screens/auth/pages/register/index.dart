import 'package:flutter/material.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/screens/auth/pages/register/provider.dart';
import 'package:mexyou/screens/auth/provider.dart';
import 'package:mexyou/widgets/button.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage(this.authProvider);

  AuthProvider authProvider;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  RegisterProvider registerProvider;

  @override
  void initState() {
    registerProvider = RegisterProvider(authProvider: widget.authProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: height * .2),
                child: Text(
                  I18n.of(context).title,
                  style: displayTextStyle,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 72, horizontal: 32),
                child: Text(
                  I18n.of(context).registerText,
                  style: captionWhiteTextStyle,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: <Widget>[
                MYButton(
                  onTap: () => registerProvider.signIn(RegisterType.Apple),
                  text: I18n.of(context).signApple,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: MYButton(
                        text: I18n.of(context).signGoogle,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: MYButton(
                        text: I18n.of(context).signFacebook,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 64,
                ),
                GestureDetector(
                  child: Text(
                    I18n.of(context).privacyPolicy,
                    style: captionWhiteTextStyle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
