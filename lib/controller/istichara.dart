import 'package:get/get.dart';

import '../model/service.dart';

class IsticharaController extends GetxController {
  final List<ButtonContent> activities = [
    ButtonContent(id: 2, name: "نفسية", link: '/'),
    ButtonContent(id: 2, name: "زواجية", link: '/'),
    ButtonContent(id: 2, name: "تربوية", link: '/'),
    // ServiceContentModel(id: 2, name: "حج ", link: '/Chakawi'),
  ];
}
