import 'package:flutter/material.dart';
import 'package:mexyou/res/icons_font.dart';
import 'package:mexyou/res/res.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenProvider mainScreenProvider;

  @override
  void initState() {
    mainScreenProvider = MainScreenProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: mainScreenProvider,
      child: Consumer<MainScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: SafeArea(child: mainScreenProvider.getPageWidget()),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: MYColors.whiteBg,
                currentIndex: 0,
                items: <BottomNavigationBarItem>[
                  buildItem(MYIcons.discover),
                  buildItem(MYIcons.nearby),
                  buildItem(MYIcons.favorite),
                  buildItem(MYIcons.message),
                  buildItem(MYIcons.profile),
                ]),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem buildItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: MYColors.secondaryText,
      ),
      activeIcon: Icon(icon, color: MYColors.text),
      title: Container(),
    );
  }
}
