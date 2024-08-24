import 'package:get/get.dart';

import '../model/event.dart';

class HomeController extends GetxController {
  final List<EventModel> flutterTopicsList = [
    EventModel(
      id: "0",
      topicIcon: "assets/images/consultation.png",
      topicName: "طلب استشارات",
      link: '/Istichara',
      conditions: '',
    ),
    EventModel(
      id: "1",
      topicIcon: "assets/images/care-treatment-heart.png",
      topicName: "طلب علاج",
      link: '/IwaaStudent',
      conditions: '',
    ),
    EventModel(
      id: "2",
      topicIcon: "assets/images/library.png",
      topicName: "مكتبة الكترونية ",
      link: '/ElectronicLibrary',
      conditions: '',
    ),
    EventModel(
      id: "3",
      topicIcon: "assets/images/seo-training.png",
      topicName: "دورات تدريبية",
      link: '/Dawarat',
      conditions: '',
    ),
  ];
}
