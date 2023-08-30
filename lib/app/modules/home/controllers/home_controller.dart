import 'package:get/get.dart';

class HomeController extends GetxController {
  int idx_event=-1;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateIdxEvent({required int idx, required String id, required String prevId}) {
    idx_event = idx;
    update([id, prevId]);
  }
}
