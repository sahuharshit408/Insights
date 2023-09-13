import 'package:flutter/foundation.dart';
import 'package:insights/models/press_releases_model.dart';

class PrPovider with ChangeNotifier {
  List<PressRelease>? _allPrs;
  // = getStringList("allPrs") != null
  //     ? getStringList("allPrs")!
  //         .map((e) => PressRelease.fromJson(json.decode(e)))
  //         .toList()
  //     : null;
  List<PressRelease>? get getAllPrs {
    return _allPrs;
  }

  void setAllPrs(List<PressRelease> prs) {
    _allPrs = prs;
    // List<String>? encodedPrs =
    //     _allPrs == null ? null : _allPrs!.map((e) => json.encode(e)).toList();
    // if (encodedPrs != null) {
    //   setStringList("allPrs", encodedPrs);
    // }
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

  void clearBookmarks() {
    _bookmarks = [];
    notifyListeners();
  }
}
