import 'package:flutter/material.dart';

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
    pageController.animateToPage(
      page.index,
      curve: Curves.linear,
      duration: Duration(milliseconds: 300),
    );
    notifyListeners();
  }
}
