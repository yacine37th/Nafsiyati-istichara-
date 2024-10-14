import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/dawarat.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../theme/main_colors.dart';

class Dawarat extends StatelessWidget {
  const Dawarat({super.key});

  @override
  Widget build(BuildContext context) {
    DawaratController dawaratController = Get.find();
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
        title: const Text(
          "الدورات",
          style: TextStyle(color: AppColors.whiteColor),
        ),
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
      body: GetBuilder<DawaratController>(
        builder: (context) {
          if (dawaratController.formations.isEmpty) {
            return const Center(
              child: Text(
                'لا يوجد دورات حاليا',
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: dawaratController.formations.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Row(
                          //   children: <Widget>[
                          //     CircleAvatar(
                          //       radius: 25.0,
                          //       child: ProfilePictureOthers(
                          //         name: dawaratController.formations.values
                          //             .elementAt(index)
                          //             .name,
                          //       ),
                          //     ),
                          //     const SizedBox(width: 10.0),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           "${dawaratController.formations.values.elementAt(index).name}",
                          //           style: const TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 16),
                          //         ),
                          //         Text(
                          //           "${dawaratController.formations.values.elementAt(index).addedDate}",
                          //           style: const TextStyle(fontSize: 14),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),

                          const SizedBox(height: 25.0),
                          Text(
                            "${dawaratController.formations.values.elementAt(index).description}",
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.blueGrey),
                          ),
                          const SizedBox(height: 25.0),
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      dawaratController.formations.values
                                          .elementAt(index)
                                          .pictureUrl!,
                                    ),
                                    alignment: Alignment.center)),
                          ),
                          const SizedBox(height: 25.0),
                          GetBuilder<DawaratController>(
                              builder: (contx) => dawaratController.now
                                              .compareTo(DateFormat(
                                                      "yyyy-MM-dd hh:mm:ss")
                                                  .parse(dawaratController
                                                      .formations.values
                                                      .elementAt(index)
                                                      .date
                                                      .toString())) <
                                          0 ||
                                      dawaratController.now.compareTo(
                                              DateFormat("yyyy-MM-dd hh:mm:ss")
                                                  .parse(dawaratController
                                                      .formations.values
                                                      .elementAt(index)
                                                      .date
                                                      .toString())) ==
                                          0
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "متبقي :  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        CountDownText(
                                          due: DateFormat("yyyy-MM-dd hh:mm:ss")
                                              .parse(dawaratController
                                                  .formations.values
                                                  .elementAt(index)
                                                  .date
                                                  .toString()),
                                          daysTextLong: " أيام ",
                                          hoursTextLong: " ساعات ",
                                          minutesTextLong: " دقيقة ",
                                          secondsTextLong: " ثانية ",
                                          finishedText: "Done",
                                          showLabel: true,
                                          longDateName: true,
                                          style: const TextStyle(
                                              color: AppColors.kPrimary2,
                                              fontSize: 19),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            dawaratController.launchUrl2(
                                                dawaratController
                                                    .formations.values
                                                    .elementAt(index)
                                                    .link!);
                                          },
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    AppColors.kPrimary2),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColors.kPrimary2),
                                            overlayColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => AppColors
                                                        .kPrimary2Onpress
                                                        .withOpacity(0.2)),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              side: const BorderSide(
                                                  color: AppColors.kPrimary2),
                                            )),
                                          ),
                                          child: Card(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            color: Colors.transparent,
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: const Text(
                                                "إضغط هنا للإنظمام إلى الدورة",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : SizedBox())
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
