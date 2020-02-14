import 'package:flutter/material.dart';
import 'package:mexyou/screens/main/pages/nearby/index.dart';

import 'pages/discover/index.dart';

enum MainScreenPage { DiscoverPage, NearbyPage, FavoritesPage, MessagePage, ProfilePage }

class MainScreenProvider with ChangeNotifier {
  MainScreenProvider({
    this.page = MainScreenPage.DiscoverPage,
  });

  MainScreenPage page;

  setPage(MainScreenPage _page) {
    page = _page;
    notifyListeners();
  }

  Widget getPageWidget() {
    switch (page) {
      case MainScreenPage.DiscoverPage:
        return DiscoverPage();
        break;
      case MainScreenPage.NearbyPage:
        return NearbyScreen();
        break;
      case MainScreenPage.FavoritesPage:
        return Container();
        break;
      case MainScreenPage.MessagePage:
        return Container();
        break;
      case MainScreenPage.ProfilePage:
        return Container();
        break;
    }
    return Container();
  }
}
