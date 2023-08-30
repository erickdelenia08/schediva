import 'package:get/get.dart';

import '../controllers/insert_schedule_controller.dart';

class InsertScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InsertScheduleController>(
      () => InsertScheduleController(),
    );
  }
}
