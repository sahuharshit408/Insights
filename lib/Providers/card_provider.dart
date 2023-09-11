import 'package:flutter/foundation.dart';
import 'package:insights/models/press_releases_model.dart';

class PrPovider with ChangeNotifier {
  List<PressRelease>? _allPrs;
  List<PressRelease>? get getAllPrs => _allPrs;

  void setAllPrs(List<PressRelease> prs) {
    _allPrs = prs;
    notifyListeners();
  }

  List<PressRelease> _bookmarks = [];

  List<PressRelease> get bookmarks => _bookmarks;

  

  void toggleBookmark(String prId) {
    _bookmarks.any((element) => element.prId == prId)
        ? _bookmarks.removeWhere((element) => element.prId == prId)
        : _bookmarks
            .add(_allPrs!.firstWhere((element) => element.prId == prId));
    notifyListeners();
  }
}
