import 'package:flutter_application_1/controller/istichara.dart';
import 'package:get/get.dart';

class IsticharaBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(IsticharaController());
  }
}
