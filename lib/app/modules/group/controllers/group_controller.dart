import 'package:app_jadwal/app/modules/group/controllers/group_settingC.dart';
import 'package:get/get.dart';

class GroupController extends GetxController {
  String idGroup;
  int idxDraweTabs = 0;
  String groupName;
  bool statusAdmin;
  dynamic idMember;

  GroupController({required this.idGroup,required this.groupName,required this.statusAdmin, this.idMember});

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

  void setIdxDrawerTabs(int idx) {
    int prevIdx = idxDraweTabs;
    idxDraweTabs = idx;
    if(idx==3){
      Get.find<GroupSettingC>().getInfoGroup(idGroup);
    }
    update(['drawer_tabs', 'tabs$idx', 'tabs$prevIdx']);
  }
}
