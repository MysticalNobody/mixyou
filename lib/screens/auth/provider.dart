import 'package:flutter/material.dart';

import 'pages/gender/index.dart';
import 'pages/register/index.dart';
import 'pages/video/index.dart';

enum AuthScreenPage { RegisterPage, GenderPage, VideoPage, InfoPage }

class AuthProvider with ChangeNotifier {
  AuthProvider({
    @required this.pageController,
    this.page = AuthScreenPage.RegisterPage,
  });

  AuthScreenPage page;
  PageController pageController;

  setPage(AuthScreenPage _page) {
    page = _page;
    notifyListeners();
  }

  Widget getPageWidget() {
    switch (page) {
      case AuthScreenPage.RegisterPage:
        return RegisterPage(this);
        break;
      case AuthScreenPage.GenderPage:
        return GenderPage(this);
        break;
      case AuthScreenPage.VideoPage:
        return VideoPage(this);
        break;
      case AuthScreenPage.InfoPage:
        return Container();
        break;
    }
    return RegisterPage(this);
  }
}
