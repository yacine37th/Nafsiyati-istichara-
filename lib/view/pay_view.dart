import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../theme/main_colors.dart';

class PayView extends StatelessWidget {
  const PayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  Center(child:
              // SizedBox(
              //   height: 180,
              //   child: Image.asset("assets/images/MostPro.png"),
              // ),
              //  ),
              // const SizedBox(height: 20),
              const Text(
                  "Please contact the developer to start the application",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () => MainFunctions.pop(),
                style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(
                      AppColors.kPrimary2,
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.kPrimary2,
                    ),
                    overlayColor: WidgetStateColor.resolveWith((states) =>
                        AppColors.kPrimary2Onpress.withOpacity(0.2)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(
                          color: AppColors.kPrimary2,
                        )))),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  color: Colors.transparent,
                  child: Container(
                    height: 35,
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      // color: AppColors.kPrimary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "QUITTER".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ),

              // GestureDetector(
              //   onTap: () {
              //     emailVerificationController.resendVerificationEmail();
              //   },
              //   child: Card(
              //     elevation: 0,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(100),
              //     ),
              //     child: Container(
              //       height: 55,
              //       alignment: Alignment.center,
              //       width: double.maxFinite,
              //       decoration: BoxDecoration(
              //         color: AppColors.kPrimary2,
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //       child: Text(
              //         "Resend",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 15,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
