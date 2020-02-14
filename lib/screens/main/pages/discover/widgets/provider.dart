import 'package:flutter/widgets.dart';

class MYTinderCardProvider with ChangeNotifier {
  var page = 0;
  changePage(_page) {
    page = _page;
    notifyListeners();
  }
}
