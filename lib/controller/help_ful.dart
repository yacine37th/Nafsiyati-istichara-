import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/service.dart';

class HelpFullController extends GetxController {
  final List<ButtonContent> activities = [
    ButtonContent(
        id: 2,
        name: "نفسية",
        link:
            'https://docs.google.com/forms/d/e/1FAIpQLSceDZPWpC0Z5O4pjIMkqFIUFyxGAdcL4SYUfZWuvMOPJ9R35w/viewform'),
    ButtonContent(
        id: 2,
        name: "زواجية",
        link:
            'https://docs.google.com/forms/d/e/1FAIpQLSeE9YuEdr02VhCtxJy1VQSFPItBe45exZOsODqgqnNr9HcW1w/viewform'),
    ButtonContent(
        id: 2,
        name: "تربوية",
        link:
            'https://docs.google.com/forms/d/e/1FAIpQLSfti8zDB6OqS0NgisGfjqyzgbVxEWEc244dGFFrV9nTEqR7Tg/viewform'),
    // ServiceContentModel(id: 2, name: "حج ", link: '/Chakawi'),
  ];
  final List<ButtonContent> electronicActivities = [
    ButtonContent(id: 2, name: "اشرطة الفيديو", link: '/Courses'),
    ButtonContent(id: 2, name: "كتب الكترونية", link: '/RequestedBooks'),
    // ServiceContentModel(id: 2, name: "حج ", link: '/Chakawi'),
  ];

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}
