import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/courses.dart';
import 'package:get/get.dart';

import '../theme/main_colors.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    CoursesController coursesController = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.greenColor,
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            )),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: coursesController.cours.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    coursesController.cours.values.elementAt(index).picutre!,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    icon: Icon(Icons.play_circle_fill),
                    iconSize: 64,
                    color: Colors.white,
                    onPressed: () {
                      // Add functionality to play the video or perform any action
                      print(
                          'Play button pressed for video ${coursesController.cours.values.elementAt(index).url!}');
                      coursesController.urlLauncher(
                          coursesController.cours.values.elementAt(index).url!);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
