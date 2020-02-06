import 'package:flutter/material.dart';
import 'package:mexyou/screens/auth/provider.dart';

class GenderProvider with ChangeNotifier {
  GenderProvider(this.authProvider);

  AuthProvider authProvider;

  void selectGender() {
    authProvider.setPage(AuthScreenPage.VideoPage);
  }
}
