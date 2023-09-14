import 'package:flutter/foundation.dart';
import 'package:insights/auth.dart';
import 'package:insights/models/press_releases_model.dart';
import 'package:insights/service.dart';

class PrPovider with ChangeNotifier {

  Service service = Service();

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

  void setUserBookmarks(List<PressRelease> boomarks)async{
    _bookmarks = boomarks;
    notifyListeners();
  }


  void toggleBookmark(String prId) {
    _bookmarks.any((element) => element.prId == prId)
        ? _removeFromBookMark(prId)
        : _addToBookMark(prId);
    notifyListeners();
  }

  void _addToBookMark(String prId)async{
    service.addBookmarks(prId: prId,userId: Auth().getCurrentUserId());
    _bookmarks.add(_allPrs!.firstWhere((element) => element.prId == prId));
    notifyListeners();
  }
  void _removeFromBookMark(String prId)async{
    service.removeBookmarks(prId: prId, userId:Auth().getCurrentUserId() );
    _bookmarks.removeWhere((element) => element.prId == prId);
    notifyListeners();
  }

  void clearBookmarks() {
    _bookmarks = [];
    notifyListeners();
  }
}
