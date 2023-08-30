import 'package:get/get.dart';

import '../controllers/joinevent_controller.dart';

class JoineventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoineventController>(
      () => JoineventController(),
    );
  }
}
