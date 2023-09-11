import 'package:insights/api/api_service.dart';
import 'package:insights/models/press_releases_model.dart';

class Service {
  ApiService? apiService;
  Future<List<PressRelease>> getPressReleases({int? date}) async {
    apiService = ApiService();
    try {
      var response = await apiService!.get(
        'getPressReleasesListing?status=pending',
        params: {
          if (date != null) 'date': date,
        },
      );
      List<PressRelease> releases = response.data
          .map<PressRelease>((e) => PressRelease.fromJson(e))
          .toList();
      print(releases.length);
      return releases;
    } catch (e) {
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
}
