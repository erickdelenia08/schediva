import 'package:app_jadwal/app/modules/joinevent/controllers/joinevent_controller.dart';
import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';
import '../../insert_schedule/controllers/insert_schedule_controller.dart';
import '../../insert_schedule/controllers/tab_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<InsertScheduleController>(
      () => InsertScheduleController(),
    );
     Get.lazyPut<JoineventController>(
      () => JoineventController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<MyTabController>(
      () => MyTabController(),
    );
  }
}
