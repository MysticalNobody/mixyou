import 'package:flutter/material.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/screens/main/pages/nearby/provider.dart';
import 'package:provider/provider.dart';

import 'pages/nearby.dart';

class NearbyScreen extends StatefulWidget {
  @override
  _NearbyScreenState createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  NearbyScreenProvider nearbyProvider;

  @override
  void initState() {
    nearbyProvider = NearbyScreenProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 9, horizontal: 15),
              child: Row(
                children: <Widget>[
                  Text(
                    'Nearby',
                    style: TextStyle(
                        fontFamily: mainFontFamily,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: MYColors.whiteText),
                  )
                ],
              ),
            ),
            Expanded(
              child: ChangeNotifierProvider.value(
                value: nearbyProvider,
                child: Consumer<NearbyScreenProvider>(
                  builder: (context, provider, _) {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 24),
                          child: Row(
                            children: <Widget>[
                              for (NearbyScreenPage page in NearbyScreenPage.values)
                                GestureDetector(
                                  onTap: () => provider.changePage(page),
                                  child: Container(
                                    margin: EdgeInsets.only(right: 36),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          page.toString().split('.').last,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: mainFontFamily,
                                            fontWeight: page == provider.page ? FontWeight.w900 : FontWeight.normal,
                                            color: MYColors.whiteText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Expanded(
                            child: PageView(
                          children: <Widget>[NearbyPage(), NearbyPage(), NearbyPage()],
                        ))
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
