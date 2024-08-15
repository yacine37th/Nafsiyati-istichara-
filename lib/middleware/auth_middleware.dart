import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (currentUser != null) {
      return const RouteSettings(name: "/Home");

      // switch (currentUserInfos.type) {
      //   case "Agence de location":
      //     return const RouteSettings(name: "/HomeScreenAgancy");
      //   default:
      //     return const RouteSettings(name: "/HomeScreenClient");
      // }
    }
    return null;
  }
}
