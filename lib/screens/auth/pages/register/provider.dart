import 'package:flutter/material.dart';
import 'package:mexyou/screens/auth/provider.dart';

enum RegisterType { Apple, Google, Facebook }

class RegisterProvider with ChangeNotifier {
  RegisterProvider(this.authProvider);

  AuthProvider authProvider;

  void signIn(RegisterType type) {
    switch (type) {
      case RegisterType.Apple:
        authProvider.setPage(AuthScreenPage.GenderPage);
        break;
      case RegisterType.Google:
        authProvider.setPage(AuthScreenPage.GenderPage);
        break;
      case RegisterType.Facebook:
        authProvider.setPage(AuthScreenPage.GenderPage);
        break;
    }
  }
}
