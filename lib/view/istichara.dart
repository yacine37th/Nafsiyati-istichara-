import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/help_ful.dart';
import '../theme/main_colors.dart';
import 'components/custom_button.dart';

class Istichara extends StatelessWidget {
  const Istichara({super.key});

  @override
  Widget build(BuildContext context) {
    HelpFullController helpFulController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            )),
        elevation: 0,
        backgroundColor: AppColors.greenColor,
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: Container(
              color: AppColors.greenColor,
              height: 1,
            )),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              ' يمكنك طلب الاستشارات المتوفرة :',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 60),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: helpFulController.activities.length,
              itemBuilder: (context, index) {
                final activity = helpFulController.activities[index];
                return Column(
                  children: [
                    CustomButton(
                        onPress: () {
                          Get.toNamed(activity.link);
                        },
                        text: activity.name,
                        colorbtn: Colors.black,
                        textColor: Colors.white),
                    const SizedBox(height: 25),
                  ],
                );
              },
            ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: activitiesController.activities.length,
            //   itemBuilder: (context, index) {
            //     final activity = activitiesController.activities[index];
            //     return Column(
            //       children: [
            //         ActivityButton(
            //           icon: activity.icon,
            //           label: activity.label,
            //           isSelected: activitiesController.isSelected,
            //           onPress: () {
            //             activitiesController.onPress();
            //           },
            //         ),
            //         const SizedBox(height: 25),
            //       ],
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
