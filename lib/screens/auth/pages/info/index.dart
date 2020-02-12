import 'package:flutter/material.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/screens/auth/provider.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class InfoPage extends StatefulWidget {
  const InfoPage(this.authProvider, {Key key}) : super(key: key);
  final AuthProvider authProvider;
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  InfoProvider infoProvider;

  @override
  void initState() {
    infoProvider = InfoProvider(widget.authProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: infoProvider,
      child: Consumer<InfoProvider>(
        builder: (context, provider, _) {
          return Container(
            margin: EdgeInsets.only(top: 104, left: 20, right: 20, bottom: 62),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 120,
                  child: Text(
                    I18n.of(context).tellUs,
                    style: headerTextStyle,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      controller: provider.nameController,
                      focusNode: provider.nameFocus,
                      style: editTextStyle,
                      onSubmitted: (text) {
                        provider.ageFocus.requestFocus();
                        provider.checkFinish();
                      },
                      decoration: InputDecoration(
                        hintText: I18n.of(context).name.toUpperCase(),
                        hintStyle: hintTextStyle,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white.withOpacity(.47)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white.withOpacity(.47)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    TextField(
                      controller: infoProvider.ageController,
                      focusNode: provider.ageFocus,
                      style: editTextStyle,
                      onSubmitted: (text) {
                        provider.checkFinish();
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: I18n.of(context).age.toUpperCase(),
                        hintStyle: hintTextStyle,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(.47),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white.withOpacity(.47)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      I18n.of(context).lookingFor,
                      style: simpleWhiteTextStyle,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => provider.chooseGender(Gender.Man),
                              child: Text(
                                'M',
                                style: provider.chosenGender == Gender.Man
                                    ? genderButtonTextStyle
                                    : genderButtonUnctiveTextStyle,
                              ),
                            ),
                            SizedBox(
                              width: width * .1,
                            ),
                            GestureDetector(
                              onTap: () => provider.chooseGender(Gender.Woman),
                              child: Text(
                                'W',
                                style: provider.chosenGender == Gender.Woman
                                    ? genderButtonTextStyle
                                    : genderButtonUnctiveTextStyle,
                              ),
                            ),
                          ],
                        ))
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
