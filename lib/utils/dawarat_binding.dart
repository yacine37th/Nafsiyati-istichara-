import 'package:flutter_application_1/controller/dawarat.dart';
import 'package:get/get.dart';

class DawaratBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DawaratController());
  }
}
