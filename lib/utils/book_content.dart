import 'package:get/get.dart';

import '../controller/book_content.dart';

class BookContentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BookContentController());
  }
}
