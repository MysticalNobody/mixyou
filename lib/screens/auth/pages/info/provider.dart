import 'package:flutter/material.dart';
import 'package:mexyou/screens/auth/provider.dart';

enum Gender { Man, Woman }

class InfoProvider with ChangeNotifier {
  InfoProvider(this.authProvider);

  AuthProvider authProvider;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode ageFocus = FocusNode();

  Gender chosenGender;
  void checkFinish() {
    if (nameController.value.text.length > 0 && ageController.value.text.length > 0 && chosenGender != null) {
      authProvider.setFinish(true);
    }
  }

  void chooseGender(Gender gender) {
    chosenGender = gender;
    checkFinish();
    notifyListeners();
  }
}
