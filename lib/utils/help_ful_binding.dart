import 'package:flutter_application_1/controller/help_ful.dart';
import 'package:get/get.dart';

class HelpFullBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HelpFullController());
  }
}
