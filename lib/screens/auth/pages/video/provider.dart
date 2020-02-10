import 'package:flutter/material.dart';
import 'package:mexyou/screens/auth/provider.dart';

class VideoPageProvider with ChangeNotifier {
  VideoPageProvider(this.authProvider);

  AuthProvider authProvider;

  void selectVideo() {
    authProvider.setPage(AuthScreenPage.InfoPage);
  }
}
