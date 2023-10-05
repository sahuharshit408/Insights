import 'package:insights/api/api_service.dart';
import 'package:insights/auth.dart';
import 'package:insights/models/press_releases_model.dart';
import 'package:insights/models/user.dart';

class Service {
  ApiService? apiService;
  final uuid = Auth().getCurrentUserId();
  Future<List<PressRelease>> getPressReleases(
      {int? date, int page = 1, int itemsCount = 10}) async {
    apiService = ApiService();
    try {
      var url = 'getPressReleasesListing?status=pending';
      if (date != null) {
        url += '&date=$date';
      }
      url += '&page=$page';
      url += '&itemsCount=$itemsCount';

      var response = await apiService!.get(url);
      List<PressRelease> releases = response.data
          .map<PressRelease>((e) => PressRelease.fromJson(e))
          .toList();

      return releases;
    } catch (e) {
      print("An error occured while fetching press releases $e");
      return [];
    }
  }

  Future<List<String>> getPrDetails({required String prId}) async {
    apiService = ApiService();
    try {
      var response = await apiService!.get(
        'getPRDetails?prId=$prId',
      );
      List<String> details = response.data['videoUrls']
          .map<String>((e) => e['url'].toString())
          .toList();
      details.addAll(
          response.data['imageUrls'].map<String>((e) => e.toString()).toList());

      return details;
      // return details;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<PressRelease>> getPrFromQuery(
      {required String q, int page = 1, int itemsCount = 10}) async {
    apiService = ApiService();
    try {
      var response = await apiService!.get(
        'getPressReleasesFromQuery?q=$q&page=$page&itemsCount=$itemsCount',
      );
      List<PressRelease> releases = response.data
          .map<PressRelease>((e) => PressRelease.fromJson(e))
          .toList();

      return releases;
    } catch (e) {
      return [];
    }
  }

  Future<void> addBookmarks({required String prId}) async {
    apiService = ApiService();
    try {
      var response = await apiService!.post(
        'addPRToBookmark/$prId?uuid=$uuid',
      );
      print(response.data);
      return;
      // return details;
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<void> removeBookmarks({required String prId}) async {
    apiService = ApiService();
    try {
      var response = await apiService!.get(
        'removePRFromBookmark/$prId?uuid=$uuid',
      );
      print(response.data);
      return;
      // return details;
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<List<PressRelease>> getUserBookmark() async {
    apiService = ApiService();
    try {
      var response = await apiService!.get(
        'getUserBookmarks?uuid=$uuid',
      );
      List<PressRelease> releases = response.data
          .map<PressRelease>((e) => PressRelease.fromJson(e))
          .toList();

      return releases;
      // return details;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> saveUser(User user) async {
    apiService = ApiService();
    try {
      var response = await apiService!.post(
        'saveUser',
        data: user.toMap(),
      );
      print("SAVE USER RESPONSE " + response.data);
      return;
      // return details;
    } catch (e) {
      print(e);
      return;
    }
  }
}
