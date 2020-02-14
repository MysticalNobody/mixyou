import 'package:flutter/material.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/icons_font.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/screens/couple/provider.dart';
import 'package:mexyou/widgets/image.dart';
import 'package:provider/provider.dart';

class CoupleScreen extends StatefulWidget {
  @override
  _CoupleScreenState createState() => _CoupleScreenState();
}

class _CoupleScreenState extends State<CoupleScreen> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  CoupleScreenProvider coupleProvider;
  List<String> images = [
    'https://cdn.pixabay.com/photo/2015/02/02/11/09/office-620822_1280.jpg',
    'https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_1280.jpg',
  ];

  @override
  void initState() {
    coupleProvider = CoupleScreenProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MYColors.bg,
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: <Widget>[
              Container(
                height: height * .7,
                child: ChangeNotifierProvider.value(
                  value: coupleProvider,
                  child: Consumer<CoupleScreenProvider>(
                    builder: (context, provider, _) {
                      return Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: PageView(
                              onPageChanged: (page) {
                                provider.changePage(page);
                              },
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
                              top: 16,
                              left: 16,
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: MYColors.greyText),
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                    child: Icon(
                                      Icons.close,
                                      color: MYColors.whiteText,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )),
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
                width: width,
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                color: MYColors.whiteBg,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          I18n.of(context).noName,
                          style: cardNameTextStyle.copyWith(color: MYColors.text),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Color(0xff1f1f1f), borderRadius: BorderRadius.circular(9.5)),
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
                                '0',
                                style: TextStyle(fontSize: 10, color: MYColors.whiteBg, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      I18n.of(context).noAdress,
                      style: cardAddressTextStyle.copyWith(color: MYColors.text, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'About'.toUpperCase(),
                      style: cardNameTextStyle.copyWith(color: MYColors.whiteText),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'My name is Mary Burgess and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading, and the knowledge ... and perspective that my reading gives me has strengthened my',
                      style: captionWhiteTextStyle.copyWith(color: MYColors.whiteText, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
