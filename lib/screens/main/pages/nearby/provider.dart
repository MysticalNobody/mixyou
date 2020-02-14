import 'package:flutter/widgets.dart';

enum NearbyScreenPage { Nearby, Spotlight, New }

class NearbyScreenProvider with ChangeNotifier {
  NearbyScreenPage page = NearbyScreenPage.Nearby;
  changePage(NearbyScreenPage _page) {
    page = _page;
    notifyListeners();
  }
}
