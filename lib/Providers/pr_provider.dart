import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insights/auth.dart';
import 'package:insights/constants.dart';
import 'package:insights/models/press_releases_model.dart';
import 'package:insights/service.dart';
import 'package:insights/utils/preference_utlis.dart';

class PrPovider with ChangeNotifier {
  Service service = Service();

  List<PressRelease>? _allPrs;
  List<PressRelease>? get getAllPrs => _allPrs;

  // void getPrsFromLocal() async {
  //   List<String>? encodedPrs = getStringList("allPrs");
  //   if (encodedPrs != null) {
  //     _allPrs =
  //         encodedPrs.map((e) => PressRelease.fromJson(json.decode(e))).toList();
  //     notifyListeners();
  //   }
  // }

  final querySearchController = TextEditingController();

  void setAllPrs(List<PressRelease> prs, {bool saveToLocal = false}) {
    _allPrs = prs;
    notifyListeners();

    // List<String>? encodedPrs =
    //     _allPrs == null ? null : _allPrs!.map((e) => json.encode(e)).toList();
    // if (encodedPrs != null && saveToLocal) {
    //   setStringList("allPrs", encodedPrs);
    // }
  }

  List<PressRelease> _bookmarks = [];

  List<PressRelease> get bookmarks => _bookmarks;

  void setUserBookmarks(List<PressRelease> boomarks) async {
    _bookmarks = boomarks;
    notifyListeners();
  }

  void toggleBookmark(String prId) {
    _bookmarks.any((element) => element.prId == prId)
        ? _removeFromBookMark(prId)
        : _addToBookMark(prId);
    notifyListeners();
  }

  void _addToBookMark(String prId) async {
    service.addBookmarks(prId: prId);
    _bookmarks.add(_allPrs!.firstWhere((element) => element.prId == prId));
    notifyListeners();
  }

  void _removeFromBookMark(String prId) async {
    service.removeBookmarks(prId: prId);
    _bookmarks.removeWhere((element) => element.prId == prId);
    notifyListeners();
  }

  void clearBookmarks() {
    _bookmarks = [];
    notifyListeners();
  }

  // FILTERS

  final List<String> _ministries = ministriesList;
  List<String> get ministries => _ministries;

  final List<String> _languages = ["English", "Hindi"];
  List<String> get languages => _languages;

  String _selectedMinistry = "All Ministry";
  String get selectedMinistry => _selectedMinistry;
  void setSelectedMinistry(String ministry) {
    _selectedMinistry = ministry;
    notifyListeners();
  }

  String _selectedLanguage = "English";
  String get selectedLanguage => _selectedLanguage;
  void setSelectedLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}
