import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../functions/functions.dart';
import '../model/video.dart';

class CoursesController extends GetxController {

  Map<String, VideoModel> cours = {
    "1": VideoModel(
        picutre: "assets/images/video1.png",
        url:
            "https://drive.google.com/drive/folders/17EZx5AX5gWwg8hlH30XP0SOrXJWhjBuT"),
    "2": VideoModel(
        picutre: "assets/images/video2.png",
        url:
            "https://drive.google.com/drive/folders/1ufaeV4_r5q1LnIcjsilWdxSxxM-t5zxT"),
    "3": VideoModel(
        picutre: "assets/images/video3.png",
        url:
            "https://drive.google.com/drive/folders/1hQ_MBv_WOrw9JTDJU7uj29k-uvr6J79v"),
    "4": VideoModel(
        picutre: "assets/images/video4.png",
        url:
            "https://drive.google.com/drive/folders/1AFPSjl0goW5sOw-bYX5JMt0rgXNjBnXP"),
  };
   Future<void> urlLauncher(String link) async {
    String url = link;
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      MainFunctions.somethingWentWrongSnackBar();
    }
  }
}