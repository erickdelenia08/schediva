import 'package:app_jadwal/app/modules/insert_schedule/controllers/insert_schedule_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ItemScheduleController extends GetxController{
  var txtHour1C=TextEditingController(text: '00');
  var txtHour2C=TextEditingController(text: '00');
  var txtMinute1C=TextEditingController(text: '00');
  var txtMinute2C=TextEditingController(text: '00');
  var txtTitleC=TextEditingController(text: '');
  var txtDescC=TextEditingController(text: '');
  int idxDay;
  int? idxItem;
  bool createStatus;
  ItemScheduleController({required this.idxDay,required this.createStatus, this.idxItem});
  
  void setIdxDay({required int idx, required String tag}){
    idxDay=idx;
    update([tag]);
  }

  void prepareUpdateData(){
    var ctrl= Get.find<InsertScheduleController>();
    var btsAtas=ctrl.jadwal[idxDay][idxItem!].batasAtas.split('.');
    var btsBawah=ctrl.jadwal[idxDay][idxItem!].batasBawah.split('.');
    txtHour1C.text=btsBawah[0];
    txtMinute1C.text=btsBawah[1];
    txtHour2C.text=btsAtas[0];
    txtMinute2C.text=btsAtas[1];
    txtTitleC.text=ctrl.jadwal[idxDay][idxItem!].title;
    txtDescC.text=ctrl.jadwal[idxDay][idxItem!].deskripsi;
  }
  
}