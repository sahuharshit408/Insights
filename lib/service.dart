import 'package:insights/api/api_service.dart';
import 'package:insights/models/press_releases_model.dart';

Future<List<PressReleasesModel>> getPressReleases(
    {int? date = 1693765800000}) async {
  ApiService apiService = ApiService();
  try {
    var response = await apiService.get(
      'getPressReleases',
      params: {
        if (date != null) 'date': date,
      },
    );
    List<PressReleasesModel> releases = response.data
        .map<PressReleasesModel>((e) => PressReleasesModel.fromJson(e))
        .toList();
    print(releases.length);
    return releases;
  } catch (e) {
    return [];
  }
}
