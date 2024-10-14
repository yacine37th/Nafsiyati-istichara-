// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/main.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../model/service.dart';
// import '../theme/main_colors.dart';

// class HelpFullController extends GetxController {
//   RxList<ButtonContent> activities = <ButtonContent>[].obs;
//   final List<ButtonContent> electronicActivities = [
//     ButtonContent(id: 2, name: "اشرطة الفيديو", link: '/Courses'),
//     ButtonContent(id: 2, name: "كتب الكترونية", link: '/RequestedBooks'),
//     // ServiceContentModel(id: 2, name: "حج ", link: '/Chakawi'),
//   ];

//   void launchURL(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri)) {
//       throw 'Could not launch $url';
//     }
//   }

//   Future<void> makeRequest(String type, BuildContext context) async {
//     // var doc = await FirebaseFirestore.instance.collection("istichara").doc();
//     // doc.set({
//     //   "isticharaId": doc.id,
//     //   "isticharaUserId": currentUserInfos.uID,
//     //   "isticharaUserName": currentUserInfos.name,
//     //   "isticharaType": type,
//     // });
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('تاكيد'),
//           content: Text("هل أنت متأكد أنك تريد المتابعة للحجز؟"),
//           actions: <Widget>[
//             TextButton(
//               style: ButtonStyle(
//                   foregroundColor:
//                       WidgetStateProperty.all(AppColors.whiteColor),
//                   backgroundColor:
//                       WidgetStateProperty.all(AppColors.whiteColor),
//                   overlayColor: WidgetStateColor.resolveWith(
//                       (states) => Colors.white.withOpacity(0.1)),
//                   shape: WidgetStateProperty.all(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(100),
//                       side: const BorderSide(
//                         color: AppColors.greenColor,
//                       )))),
//               onPressed: () {
//                 Get.back();
//               },
//               child: Text(
//                 "الغاء".tr,
//                 style: TextStyle(color: AppColors.greenColor),
//               ),
//             ),
//             TextButton(
//               style: ButtonStyle(
//                   foregroundColor:
//                       WidgetStateProperty.all(AppColors.greenColor),
//                   backgroundColor:
//                       WidgetStateProperty.all(AppColors.greenColor),
//                   overlayColor: WidgetStateColor.resolveWith(
//                       (states) => Colors.white.withOpacity(0.1)),
//                   shape: WidgetStateProperty.all(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(100),
//                       side: const BorderSide(
//                         color: AppColors.greenColor,
//                       )))),
//               onPressed: () async {
//                 var doc = await FirebaseFirestore.instance
//                     .collection("istichara")
//                     .doc();
//                 await doc.set({
//                   "isticharaId": doc.id,
//                   "isticharaUserId": currentUserInfos.uID,
//                   "isticharaUserName": currentUserInfos.name,
//                   "isticharaUserEmail": currentUserInfos.email,
//                   "isticharaType": type,
//                   "isticharaIsConfirm": false,
//                 });

//                 // Optionally, show a success message
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('تم حفظ الطلب بنجاح')),
//                 );
//                 Get.back();
//               },
//               child: Text(
//                 "متابعة".tr,
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     activities.value = [
//       ButtonContent(
//           id: 2,
//           name: "نفسية",
//           isConfirm: currentUserInfos.nafsiya,
//           link:
//               'https://docs.google.com/forms/d/e/1FAIpQLSceDZPWpC0Z5O4pjIMkqFIUFyxGAdcL4SYUfZWuvMOPJ9R35w/viewform'),
//       ButtonContent(
//           id: 2,
//           name: "زواجية",
//           isConfirm: currentUserInfos.zawajiya,
//           link:
//               'https://docs.google.com/forms/d/e/1FAIpQLSeE9YuEdr02VhCtxJy1VQSFPItBe45exZOsODqgqnNr9HcW1w/viewform'),
//       ButtonContent(
//           id: 2,
//           name: "تربوية",
//           isConfirm: currentUserInfos.tarbiya,
//           link:
//               'https://docs.google.com/forms/d/e/1FAIpQLSfti8zDB6OqS0NgisGfjqyzgbVxEWEc244dGFFrV9nTEqR7Tg/viewform'),
//     ];
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/service.dart';
import '../theme/main_colors.dart';

class HelpFullController extends GetxController {
  RxList<ButtonContent> activities = <ButtonContent>[].obs;
  final List<ButtonContent> electronicActivities = [
    ButtonContent(id: 2, name: "اشرطة الفيديو", link: '/Courses'),
    ButtonContent(id: 2, name: "كتب الكترونية", link: '/RequestedBooks'),
  ];

  // Add these Rx variables to observe changes
  final RxBool nafsiya = false.obs;
  final RxBool zawajiya = false.obs;
  final RxBool tarbiya = false.obs;

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
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
                  "isticharaType": type,
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

  void updateActivities() {
    activities.value = [
      ButtonContent(
          id: 2,
          name: "نفسية",
          isConfirm: nafsiya.value,
          link:
              'https://docs.google.com/forms/d/e/1FAIpQLSceDZPWpC0Z5O4pjIMkqFIUFyxGAdcL4SYUfZWuvMOPJ9R35w/viewform'),
      ButtonContent(
          id: 2,
          name: "زواجية",
          isConfirm: zawajiya.value,
          link:
              'https://docs.google.com/forms/d/e/1FAIpQLSeE9YuEdr02VhCtxJy1VQSFPItBe45exZOsODqgqnNr9HcW1w/viewform'),
      ButtonContent(
          id: 2,
          name: "تربوية",
          isConfirm: tarbiya.value,
          link:
              'https://docs.google.com/forms/d/e/1FAIpQLSfti8zDB6OqS0NgisGfjqyzgbVxEWEc244dGFFrV9nTEqR7Tg/viewform'),
    ];
  }

  @override
  void onInit() {
    super.onInit();

    // Initialize Rx variables with current user info
    nafsiya.value = currentUserInfos.nafsiya!;
    zawajiya.value = currentUserInfos.zawajiya!;
    tarbiya.value = currentUserInfos.tarbiya!;

    // Set up listeners for changes
    ever(nafsiya, (_) => updateActivities());
    ever(zawajiya, (_) => updateActivities());
    ever(tarbiya, (_) => updateActivities());

    // Initial update of activities
    updateActivities();
  }

  // Method to update user info (call this when user info changes)
  void updateUserInfo(bool newNafsiya, bool newZawajiya, bool newTarbiya) {
    nafsiya.value = newNafsiya;
    zawajiya.value = newZawajiya;
    tarbiya.value = newTarbiya;
    // The listeners set up in onInit will automatically call updateActivities
  }
}
