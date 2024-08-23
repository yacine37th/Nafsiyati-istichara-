import 'package:get/get.dart';

import '../controller/request_books.dart';

class RequestedBooksBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RequestedBooksController());
  }
}
