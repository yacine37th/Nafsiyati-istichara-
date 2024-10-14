import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../main.dart';
import '../theme/main_colors.dart';
import 'components/drawer.dart';
import 'widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              GetBuilder<HomeController>(
                // init: MyController(),
                initState: (_) {},
                builder: (_) {
                  return UserAccountsDrawerHeader(
                    arrowColor: Colors.blue,
                    currentAccountPicture: CircleAvatar(
                      child: Text(currentUserInfos.name![0]),
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
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: const Text(
                  'اتصل بنا',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                onTap: () {
                  Get.defaultDialog(
                    title: 'اتصل بنا',
                    content: Column(
                      children: [
                        Text('''
rafikcom2024@gmail.com
0664855857
'''),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  WidgetStateProperty.all(AppColors.kPrimary2),
                              backgroundColor:
                                  WidgetStateProperty.all(AppColors.kPrimary2),
                              overlayColor: WidgetStateColor.resolveWith(
                                  (states) => Colors.white.withOpacity(0.1)),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: const BorderSide(
                                        color: AppColors.kPrimary2,
                                      )))),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "متابعة".tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.info_rounded),
                title: const Text(
                  'نبدة عنا',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                onTap: () {
                  Get.defaultDialog(
                    title: 'نبدة عنا',
                    content: Column(
                      children: [
                        Text('''
تطبيق رفيق com هو الحل المتكامل لتقديم خدمات الرعاية النفسية والاجتماعية عن بعد عبر جلسات ودورات يقدمها نخبة من المختصين المرخصين بكل خصوصية وسرية'''),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  WidgetStateProperty.all(AppColors.kPrimary2),
                              backgroundColor:
                                  WidgetStateProperty.all(AppColors.kPrimary2),
                              overlayColor: WidgetStateColor.resolveWith(
                                  (states) => Colors.white.withOpacity(0.1)),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: const BorderSide(
                                        color: AppColors.kPrimary2,
                                      )))),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "متابعة".tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
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
        ),
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size(0, 0),
              child: Container(
                color: AppColors.blackColor,
                height: 1,
              )),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.flutterTopicsList.length,
                itemBuilder: (context, index) {
                  final topicsData = homeController.flutterTopicsList[index];
                  return GestureDetector(
                    onTap: () {
                      print(topicsData.isConfirm);
                      print(currentUserInfos.ilaj);
                      if (topicsData.topicName == "طلب علاج") {
                        if (currentUserInfos.ilaj!) {
                          homeController.launchURL(topicsData.link);
                        } else {
                          homeController.makeRequest("علاج", context);
                        }
                      } else if (topicsData.number != null) {
                        homeController.makePhoneCall(topicsData.number!);
                      } else if (topicsData.content != null) {
                        Get.defaultDialog(
                            barrierDismissible: false,
                            title: "الاشتراكات",
                            content: Column(
                              children: [
                                Text(topicsData.content!),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: WidgetStateProperty.all(
                                          AppColors.kPrimary2),
                                      backgroundColor: WidgetStateProperty.all(
                                          AppColors.kPrimary2),
                                      overlayColor:
                                          WidgetStateColor.resolveWith(
                                              (states) => Colors.white
                                                  .withOpacity(0.1)),
                                      shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              side: const BorderSide(
                                                color: AppColors.kPrimary2,
                                              )))),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "متابعة".tr,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ));
                      } else {
                        Get.toNamed(topicsData.link,
                            arguments: topicsData.topicName);
                      }
                    },
                    child: Card(
                      color: AppColors.greenColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                topicsData.topicIcon,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              topicsData.topicName,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
