import 'package:flutter/material.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/icons_font.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/screens/auth/pages/info/provider.dart';
import 'package:mexyou/widgets/image.dart';

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
            height: height * .7,
            child: Column(
              children: <Widget>[
                Container(
                  height: height * .7 - 150,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(images.length, (_) {
                      return MYImage(
                        images[_],
                        fit: BoxFit.cover,
                      );
                    }),
                  ),
                ),
                Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
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
                            decoration:
                                BoxDecoration(color: Color(0xff1f1f1f), borderRadius: BorderRadius.circular(9.5)),
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
                                  style: TextStyle(fontSize: 10, color: MYColors.whiteBg, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
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
        )
      ],
    );
  }
}
