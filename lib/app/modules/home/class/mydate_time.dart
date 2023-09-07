import 'package:app_jadwal/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MyDateTime {
  static String formatDate(DateTime date) {
    String? month;
    switch (date.month) {
      case 1:
        month = "Januari";
        break;
      case 2:
        month = "Februari";
        break;
      case 3:
        month = "Maret";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "Mei";
        break;
      case 6:
        month = "Juni";
        break;
      case 7:
        month = "Juli";
        break;
      case 8:
        month = "Agustus";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "Oktober";
        break;
      case 11:
        month = "November";
        break;
      case 12:
        month = "Desember";
        break;
    }

    return '${date.day.toString()} $month, ${date.year.toString()}';
  }

  static DateTime getFirstDateOfWeek(DateTime date) {
    return date.weekday == 7 ? date : date.add(Duration(days: -date.weekday));
  }

  static List<int> getDaysOfWeek(DateTime date) {
    var firstDay = getFirstDateOfWeek(date);
    var days = <int>[];
    for (var i = 0; i < 7; i++) {
      days.add(firstDay.add(Duration(days: i)).day);
    }
    return days;
  }
}

typedef DateCallback = void Function(DateTime val);

class G2xSimpleWeekCalendar extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  G2xSimpleWeekCalendar(
    this.currentDate, {
    this.strWeekDays = const ["Sen", "Sel", "Rab", "Kam", "Jum", "Sab", "Min"],
    required this.dateCallback,
    this.defaultTextStyle = const TextStyle(color: Colors.white70),
    this.selectedTextStyle = const TextStyle(color: Colors.white),
    this.selectedBackgroundDecoration = const BoxDecoration(),
  });
  final DateTime currentDate;
  final List<String> strWeekDays;
  final DateCallback dateCallback;
  final TextStyle defaultTextStyle;
  final TextStyle selectedTextStyle;
  final BoxDecoration selectedBackgroundDecoration;
  @override
  _G2xSimpleWeekCalendarState createState() => _G2xSimpleWeekCalendarState();
}

class _G2xSimpleWeekCalendarState extends State<G2xSimpleWeekCalendar>
    with TickerProviderStateMixin {
  late DateTime currentDate;
  var weekDays = <int>[];
  var selectedIndex = 0;

  _setSelectedDate(int index) {
    setState(() {
      selectedIndex = index;
      currentDate =
          MyDateTime.getFirstDateOfWeek(currentDate).add(Duration(days: index));
          Get.find<HomeController>().updateTimeLine(currentDate);
    });
  }

  _altertWeek(int days) {
    setState(() {
      currentDate = currentDate.add(Duration(days: days));
      Get.find<HomeController>().updateTimeLine(currentDate);
    });
  }

  @override
  void initState() {
    super.initState();
    currentDate = widget.currentDate;

    selectedIndex = currentDate.weekday == 7 ? 0 : currentDate.weekday;
  }

  @override
  Widget build(BuildContext context) {
    weekDays = MyDateTime.getDaysOfWeek(currentDate);
    var rowWeeks = Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.white)),
            child: Text(
              MyDateTime.formatDate(currentDate),
              style: GoogleFonts.roboto(
                textStyle: TextStyle(color: HexColor('#F0E8F3'), fontSize: 13),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8,),
        Row(
          children: [
            InkWell(
              onTap: () => _altertWeek(-7),
              child: Icon(Icons.arrow_left,
                  color: widget.defaultTextStyle.color),
            ),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: widget.strWeekDays.map((i) {
                    return InkWell(
                      splashColor: Colors.transparent,
                        onTap: () =>
                            _setSelectedDate(widget.strWeekDays.indexOf(i)),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration:
                              selectedIndex == widget.strWeekDays.indexOf(i)
                                  ? widget.selectedBackgroundDecoration
                                  : const BoxDecoration(),
                          child: Column(
                            children: <Widget>[
                              Text(i,
                                  style: selectedIndex ==
                                          widget.strWeekDays.indexOf(i)
                                      ? widget.selectedTextStyle
                                      : widget.defaultTextStyle),
                              const SizedBox(
                                height: 2,
                              ),
                              selectedIndex == widget.strWeekDays.indexOf(i)
                                  ? CircleAvatar(
                                      backgroundColor: Colors.orange,
                                      child: Text(
                                          weekDays[widget.strWeekDays
                                                  .indexOf(i)]
                                              .toString(),
                                          style: selectedIndex ==
                                                  widget.strWeekDays
                                                      .indexOf(i)
                                              ? widget.selectedTextStyle
                                              : widget.defaultTextStyle))
                                  : Text(
                                      weekDays[
                                              widget.strWeekDays.indexOf(i)]
                                          .toString(),
                                      style: selectedIndex ==
                                              widget.strWeekDays.indexOf(i)
                                          ? widget.selectedTextStyle
                                          : widget.defaultTextStyle),
                            ],
                          ),
                        ));
                  }).toList()),
            ),
            InkWell(
              onTap: () => _altertWeek(7),
              child: Icon(Icons.arrow_right,
                  color: widget.defaultTextStyle.color),
            )
          ],
        )
      ],
    );
    return rowWeeks;
  }
}
