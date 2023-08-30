import 'package:get/get.dart';

import '../controllers/create_agenda_controller.dart';

class CreateAgendaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAgendaController>(
      () => CreateAgendaController(),
    );
  }
}
