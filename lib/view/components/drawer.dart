import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/main_colors.dart';
import 'package:get/get.dart';

import '../../controller/home.dart';
import '../../functions/functions.dart';
import '../../main.dart';
import '../widgets.dart';

class AppDrawer extends StatelessWidget {
  // int counter;

  AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeScreenController = Get.find(); // if (io == 0) {
    //   controller = Get.find<HomeController>();
    // } else if (io == 1) {
    //   controller = Get.find<PrivateHospitalsController>();
    // } else {
    //   controller = Get.find<DoctorsController>();
    // }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            arrowColor: AppColors.kPrimary,
            currentAccountPicture: CircleAvatar(
              child: ProfilePictureOthers(name: currentUserInfos.name!),
            ),
            accountEmail: Text(currentUserInfos.email!),
            accountName: Text(
              currentUserInfos.name!,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'الرئيسية',
              style: TextStyle(fontSize: 18.0),
            ),
            onTap: () {
              // homeScreenController.switchBetweenScreens(0);
              Get.back();
            },
          ),
          // ListTile(
          //   leading: Image.asset(
          //     "assets/icons/Shared_Document.png",
          //   ),
          //   title: const Text(
          //     'الخدمات',
          //     style: TextStyle(
          //       fontSize: 18.0,
          //     ),
          //   ),
          //   onTap: () {
          //     // homeScreenController.switchBetweenScreens(1);
          //     Get.back();
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.phone),
            title: const Text(
              'اتصل بنا',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              // 0664855857
              // homeScreenController.switchBetweenScreens(3);
              homeScreenController.makePhoneCall("+213664855857");
              // Get.back();
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.info_rounded),
          //   title: const Text(
          //     'نبدة عتا',
          //     style: TextStyle(
          //       fontSize: 18.0,
          //     ),
          //   ),
          //   onTap: () {
          //     // homeScreenController.switchBetweenScreens(4);
          //     Get.back();
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'تسجيل الخروج',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              MainFunctions.signOutUser();
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      tileColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.white.withOpacity(0.2),
    );
  }
}
