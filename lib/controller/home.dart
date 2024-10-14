import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/event.dart';
import '../theme/main_colors.dart';

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
      isConfirm: currentUserInfos.ilaj,
      link:
          'https://docs.google.com/forms/d/e/1FAIpQLSeK2FAY4wR03aJTE95DDm6JzI4sHBiXyQn3jtE9sDjksxOZ1Q/viewform',
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
    EventModel(
      id: "3",
      topicIcon: "assets/images/seo-training.png",
      topicName: "حجز جلسة حضورية مع أحد المختصين بمؤسسة النفس المطمئة",
      link: '',
      number: "+213664855857",
      conditions: '',
    ),
    EventModel(
      id: "3",
      topicIcon: "assets/images/seo-training.png",
      topicName: "الاشتراكات المتوفرة",
      link: '/Dawarat',
      content: '''
طلب الاشتراك في التطبيق-بالشهر 5000 دج
بالثلاثة اشهر 12000 دج
بالستة اشهر 20000 دج 
بالسنة 30000 دج
''',
      conditions: '',
    ),
  ];

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  void makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }


    Future<void> makeRequest(String type, BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تاكيد'),
          content: Text("هل أنت متأكد أنك تريد المتابعة للحجز؟"),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(AppColors.whiteColor),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.whiteColor),
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(
                        color: AppColors.greenColor,
                      )))),
              onPressed: () {
                Get.back();
              },
              child: Text(
                "الغاء".tr,
                style: TextStyle(color: AppColors.greenColor),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(AppColors.greenColor),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.greenColor),
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(
                        color: AppColors.greenColor,
                      )))),
              onPressed: () async {
                var doc = await FirebaseFirestore.instance
                    .collection("istichara")
                    .doc();
                await doc.set({
                  "isticharaId": doc.id,
                  "isticharaUserId": currentUserInfos.uID,
                  "isticharaUserName": currentUserInfos.name,
                  "isticharaUserEmail": currentUserInfos.email,
                  "isticharaType": "علاج",
                  "isticharaIsConfirm": false,
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم حفظ الطلب بنجاح')),
                );
                Get.back();
              },
              child: Text(
                "متابعة".tr,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

}
