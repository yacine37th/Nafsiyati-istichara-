import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../functions/functions.dart';
import '../model/video.dart';

class CoursesController extends GetxController {
  Map<String, VideoModel> cours = {
    "1": VideoModel(
        picutre: "assets/images/images.png",
        url:
            "https://drive.google.com/drive/u/9/folders/1dMMV4g3VMnc3bMNwWSCVnsatAGPmBnuP"),
    "2": VideoModel(
        picutre: "assets/images/images.png",
        url:
            "https://drive.google.com/drive/u/9/folders/1oWv-lO2difd_8GQMzzQgiU4NZOr7n9XP"),
    "3": VideoModel(
        picutre: "assets/images/images.png",
        url:
            "https://drive.google.com/drive/u/9/folders/15Q4MtRL7EO8Pqk3F17-dJ52NdnM5MuOs"),
  };
  Future<void> urlLauncher(String link) async {
    String url = link;
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      MainFunctions.somethingWentWrongSnackBar();
    }
  }
}
