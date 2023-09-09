import 'package:insights/api/api_service.dart';
import 'package:insights/models/press_releases_model.dart';

Future<List<PressRelease>> getPressReleases({int? date}) async {
  ApiService apiService = ApiService();
  try {
    var response = await apiService.get(
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
