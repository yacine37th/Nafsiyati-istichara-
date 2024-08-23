import 'package:flutter_application_1/controller/courses.dart';
import 'package:get/get.dart';

class CoursesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CoursesController());
  }
}
