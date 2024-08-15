import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/images.dart';
import 'package:get/get.dart';

import '../controller/sign_in.dart';
import '../theme/main_colors.dart';
import 'widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.find();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                color: AppColors.goldenColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(300, 300),
                  bottomRight: Radius.elliptical(50, 40),
                ),
              ),
            ),
            ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 6),
                SizedBox(
                  height: 250.0,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    logo,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Center(
                  child: Text(
                    'مرحباً بك مرة أخرى!',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    "سجل الدخول إلى حسابك وابدأ!",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                      color: AppColors.goldenColor2,
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: signInController.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (userEmailAddress) {
                            signInController.userEmailAddress =
                                userEmailAddress;
                          },
                          onChanged: (userEmailAddress) {
                            signInController.userEmailAddress =
                                userEmailAddress.trim();
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "من فضلك املأ البريد الإلكتروني";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                .hasMatch(val)) {
                              return "من فضلك املأ بريد إلكتروني صحيح";
                            }
                            return null;
                          },
                          initialValue: signInController.userEmailAddress,
                          decoration: InputDecoration(
                            hintText: 'البريد الإكتروني',
                            // hintText: 'E-mail'.tr,
                            errorMaxLines: 2,
                            prefixIcon: const EmailIcon(),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.kLine),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            // border: InputBorder.none,
                            fillColor: AppColors.inputBg,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.kPrimary2),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.kLine),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.KError),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<SignInController>(
                          builder: (contx) => TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: contx.showPassword,
                            onSaved: (userpass) {
                              signInController.userPassword = userpass;
                            },
                            onChanged: (userpass) {
                              signInController.userPassword = userpass.trim();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "من فضلك املأ كلمة المرور";
                              }
                              return null;
                            },
                            initialValue: signInController.userPassword,
                            decoration: InputDecoration(
                              hintText: 'كلمة السر',
                              errorMaxLines: 2,
                              prefixIcon: const PasswordKeyIcon(),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    contx.invertShowPassword();
                                  },
                                  icon: contx.showPassword
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off)),
                              suffixIconColor: AppColors.greenColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.kLine),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              fillColor: AppColors.inputBg,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.kPrimary2),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.kLine),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.KError),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.toNamed("ForgotPassword");
                              },
                              style: ButtonStyle(
                                  overlayColor: WidgetStateColor.resolveWith(
                                      (states) =>
                                          AppColors.goldenColor2.withOpacity(0.1)),
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ))),
                              child: Text(
                                "نسيت كلمة المرور ؟",
                                // "Forgot Password ?".tr,
                                style: const TextStyle(
                                    color: AppColors.goldenColor2, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            if (signInController.formKey.currentState!
                                .validate()) {
                              signInController.formKey.currentState!.save();
                              signInController.signInAUser();
                            }
                          },
                          style: ButtonStyle(
                              foregroundColor: WidgetStateProperty.all(
                                AppColors.greenColor,
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                AppColors.greenColor,
                              ),
                              overlayColor: WidgetStateColor.resolveWith(
                                  (states) => Colors.white.withOpacity(0.1)),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100),
                                      side: const BorderSide(
                                        color: AppColors.greenColor,
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
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('ليس لديك حساب؟'),
                            const SizedBox(width: 5.0),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/SignUp");
                                // Get.toNamed("/WhoAreU");
                              },
                              child: const Text(
                                'التسجيل',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.goldenColor2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controller/sign_in.dart';
// import '../theme/images.dart';
// import '../theme/main_colors.dart';
// import 'widgets.dart';

// class SignIn extends StatelessWidget {
//   const SignIn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SignInController signInController = Get.find();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 400,
//             decoration: const BoxDecoration(
//               color: AppColors.kPrimary2,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.elliptical(300, 300),
//                 bottomRight: Radius.elliptical(50, 40),
//               ),
//             ),
//           ),
//           ListView(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
//             physics: const BouncingScrollPhysics(),
//             children: [
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(vertical: 15.0),
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.start,
//               //     children: [
//               //       IconButton(
//               //         icon: const Icon(Icons.language, color: Colors.white),
//               //         onPressed: () {
//               //           // Add your translation logic here
//               //           print('Translation button pressed');
//               //           signInController.setLanguage();
//               //         },
//               //       ),
//               //     ],
//               //   ),
//               // ),
            
//               SizedBox(height: MediaQuery.of(context).size.height / 9),
//               SizedBox(
//                 height: 200.0,
//                 width: MediaQuery.of(context).size.width,
//                 child: Image.asset(
//                   logo,
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//               Center(
//                 child: Text(
//                   'Welcome to'.tr,
//                   style: const TextStyle(
//                     fontSize: 23.0,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   'Login to Your Account'.tr,
//                   style: const TextStyle(
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.w300,
//                     color: AppColors.kPrimary2,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25.0),
//               SingleChildScrollView(
//                 padding: const EdgeInsets.all(20),
//                 child: Form(
//                   key: signInController.formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TextFormField(
//                         textInputAction: TextInputAction.next,
//                         keyboardType: TextInputType.emailAddress,
//                         onSaved: (userEmailAddress) {
//                           signInController.userEmailAddress = userEmailAddress;
//                         },
//                         onChanged: (userEmailAddress) {
//                           signInController.userEmailAddress =
//                               userEmailAddress.trim();
//                         },
//                         validator: (val) {
//                           if (val!.isEmpty) {
//                             return "Please enter an email".tr;
//                           }
//                           if (!RegExp(
//                                   r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
//                               .hasMatch(val)) {
//                             return "Please enter a valid email".tr;
//                           }
//                           return null;
//                         },
//                         initialValue: signInController.userEmailAddress,
//                         decoration: InputDecoration(
//                           hintText: 'E-mail'.tr,
//                           errorMaxLines: 2,
//                           prefixIcon: const EmailIcon(),
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 16),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 const BorderSide(color: AppColors.kLine),
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           fillColor: AppColors.inputBg,
//                           filled: true,
//                           focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 const BorderSide(color: AppColors.kPrimary2),
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide:
//                                 const BorderSide(color: AppColors.kLine),
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderSide:
//                                 const BorderSide(color: AppColors.KError),
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           hintStyle: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w300,
//                               color: Colors.grey),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       GetBuilder<SignInController>(
//                         builder: (contx) => TextFormField(
//                           textInputAction: TextInputAction.next,
//                           keyboardType: TextInputType.visiblePassword,
//                           obscureText: contx.showPassword,
//                           onSaved: (userpass) {
//                             signInController.userPassword = userpass;
//                           },
//                           onChanged: (userpass) {
//                             signInController.userPassword = userpass.trim();
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Please fill in the password".tr;
//                             }
//                             return null;
//                           },
//                           initialValue: signInController.userPassword,
//                           decoration: InputDecoration(
//                             hintText: 'Password'.tr,
//                             errorMaxLines: 2,
//                             prefixIcon: const PasswordKeyIcon(),
//                             suffixIcon: IconButton(
//                                 onPressed: () {
//                                   contx.invertShowPassword();
//                                 },
//                                 icon: contx.showPassword
//                                     ? const Icon(Icons.visibility)
//                                     : const Icon(Icons.visibility_off)),
//                             suffixIconColor: AppColors.kPrimary2,
//                             contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 16),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   const BorderSide(color: AppColors.kLine),
//                               borderRadius: BorderRadius.circular(40),
//                             ),
//                             fillColor: AppColors.inputBg,
//                             filled: true,
//                             focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   const BorderSide(color: AppColors.kPrimary2),
//                               borderRadius: BorderRadius.circular(40),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide:
//                                   const BorderSide(color: AppColors.kLine),
//                               borderRadius: BorderRadius.circular(40),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide:
//                                   const BorderSide(color: AppColors.KError),
//                               borderRadius: BorderRadius.circular(40),
//                             ),
//                             hintStyle: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w300,
//                                 color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               Get.toNamed("ForgotPassword");
//                             },
//                             style: ButtonStyle(
//                                 overlayColor: WidgetStateColor.resolveWith(
//                                     (states) =>
//                                         AppColors.kPrimary2.withOpacity(0.1)),
//                                 shape: WidgetStateProperty.all(
//                                     RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(100),
//                                 ))),
//                             child: Text(
//                               "Forgot Password ?".tr,
//                               style: const TextStyle(
//                                   color: AppColors.kPrimary2, fontSize: 14),
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                       TextButton(
//                         onPressed: () {
//                           if (signInController.formKey.currentState!
//                               .validate()) {
//                             signInController.formKey.currentState!.save();
//                             signInController.signInAUser();
//                           }
//                         },
//                         style: ButtonStyle(
//                             foregroundColor:
//                                 WidgetStateProperty.all(AppColors.kPrimary2),
//                             backgroundColor:
//                                 WidgetStateProperty.all(AppColors.kPrimary2),
//                             overlayColor: WidgetStateColor.resolveWith(
//                                 (states) => Colors.white.withOpacity(0.1)),
//                             shape:
//                                 WidgetStateProperty.all(RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(100),
//                                     side: const BorderSide(
//                                       color: AppColors.kPrimary2,
//                                     )))),
//                         child: Card(
//                           elevation: 0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                           color: Colors.transparent,
//                           child: Container(
//                             height: 35,
//                             alignment: Alignment.center,
//                             width: double.maxFinite,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Text(
//                               "Sign In".tr,
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 19,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('New in'.tr),
//                           const SizedBox(width: 5.0),
//                           GestureDetector(
//                             onTap: () {
//                               Get.toNamed("/WhoAreU");
//                             },
//                             child: Text(
//                               'Create new Account'.tr,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: AppColors.kPrimary2,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
