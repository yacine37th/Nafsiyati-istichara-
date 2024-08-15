// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/model/user_type.dart';
// import 'package:flutter_application_1/theme/images.dart';
// import 'package:get/get.dart';

// import '../theme/main_colors.dart';

// class UserTypeController extends GetxController {
//   Map<String, UserTypeModel> userTypes = {
//     "1": UserTypeModel(name: "client".tr, picture: client),
//     "2": UserTypeModel(name: "server".tr, picture: server),
//   };
//   String? selectedRole;
//   bool isSelected = false;
//   void setSelectedRole(String role) {
//     selectedRole = role;
//     Get.forceAppUpdate();
//   }

//   void redirectToNextPage(String role) {
//     if (role == "client".tr) {
//       Get.toNamed("/SignUpClient", arguments: role);
//       print(role);
//       print("client ///////");
//     } else {
//       Get.toNamed("/SignUpService", arguments: role);
//       print(role);
//     }
//   }
// }
