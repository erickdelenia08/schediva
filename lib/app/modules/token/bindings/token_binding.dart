import 'package:get/get.dart';

import '../controllers/token_controller.dart';

class TokenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TokenController>(
      () => TokenController(),
    );
  }
}
