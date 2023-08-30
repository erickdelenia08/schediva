import '../controllers/insert_schedule_controller.dart';
import 'package:flutter/material.dart';

class ItemSchedule extends StatelessWidget {
  const ItemSchedule({
    super.key,
    required this.controller,
  });

  final InsertScheduleController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
        elevation: 10,
        child: Builder(builder: (context) {
          return Stack(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog();
                      });
                },
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: SizedBox(
                              height: 40,
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 3),
                                    color: Colors.blue,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '15.00',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          ' - ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '19.00',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  )),
                            )),
                        const VerticalDivider(
                          color: Colors.blue,
                          thickness: 2,
                          width: 5,
                        ),
                        const Flexible(
                            fit: FlexFit.tight,
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Event',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'hhaha',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                      child: Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.red,
                          ),
                          padding: const EdgeInsets.all(3),
                          height: 12,
                          width: 24,
                          child: Image.asset('assets/icon/icon_x.png')),
                      onTap: () {}))
            ],
          );
        }));
  }
}
