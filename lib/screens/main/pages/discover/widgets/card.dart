import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/icons_font.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/screens/auth/pages/info/provider.dart';
import 'package:mexyou/screens/couple/index.dart';
import 'package:mexyou/screens/main/pages/discover/widgets/provider.dart';
import 'package:mexyou/widgets/image.dart';
import 'package:provider/provider.dart';

class MYTinderCard extends StatefulWidget {
  const MYTinderCard({Key key, this.images, this.name, this.gender, this.age, this.address}) : super(key: key);
  final List<String> images;
  final String name;
  final String address;
  final Gender gender;
  final int age;

  @override
  _MYTinderCardState createState() => _MYTinderCardState();
}

class _MYTinderCardState extends State<MYTinderCard> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  List<String> get images => widget.images;
  String get name => widget.name;
  String get address => widget.address;
  Gender get gender => widget.gender;
  int get age => widget.age;

  MYTinderCardProvider cardProvider;

  PageController controller;
  @override
  void initState() {
    cardProvider = MYTinderCardProvider();
    super.initState();
  }

  @override
  void dispose() {
    cardProvider.changePage(0);
    cardProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
              decoration: BoxDecoration(
                color: MYColors.whiteBg,
              ),
              width: width * .9,
              height: height - kBottomNavigationBarHeight - 160,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: height - kBottomNavigationBarHeight - 280,
                          child: ChangeNotifierProvider.value(
                            value: cardProvider,
                            child: Consumer<MYTinderCardProvider>(
                              builder: (context, provider, _) {
                                return Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: PageView(
                                        onPageChanged: (page) => provider.changePage(page),
                                        scrollDirection: Axis.vertical,
                                        children: List.generate(images.length, (_) {
                                          return MYImage(
                                            images[_],
                                            fit: BoxFit.cover,
                                          );
                                        }),
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      right: 14,
                                      child: Column(
                                        children: <Widget>[
                                          for (int i = 0; i < images.length; i++)
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: provider.page == i ? MYColors.whiteText : MYColors.greyText,
                                              ),
                                              width: 8,
                                              height: 8,
                                              margin: EdgeInsets.only(top: 8),
                                            ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (_) => CoupleScreen(),
                                    )),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      name ?? I18n.of(context).noName,
                                      style: cardNameTextStyle,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xff1f1f1f), borderRadius: BorderRadius.circular(9.5)),
                                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            MYIcons.female,
                                            color: MYColors.whiteText,
                                            size: 10,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            age ?? '0',
                                            style: TextStyle(
                                                fontSize: 10, color: MYColors.whiteBg, fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                address ?? I18n.of(context).noAdress,
                                style: cardAddressTextStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    child: Row(
                      children: <Widget>[
                        //TODO: Card controls
                      ],
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}
