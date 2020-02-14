import 'package:flutter/widgets.dart';

class CoupleScreenProvider with ChangeNotifier {
  var page = 0;
  changePage(_page) {
    page = _page;
    notifyListeners();
  }
}
