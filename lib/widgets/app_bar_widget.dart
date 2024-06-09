// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
   AppBarWidget({super.key});

  

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

//  final DateTime dateTime = DateTime(2024, 2, 22, 9, 30);

  void updateTime() {
    
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromRGBO(92, 107, 192, 1),
        centerTitle: true,
        title: Text(
          "AppBar"
          // '${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}',
        ));

    // return AppBar(
    //   backgroundColor: const Color.fromRGBO(92, 107, 192, 1),
    //   centerTitle: true,
    //   title: Text(
    //     '${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}',
    //     style: const TextStyle(
    //       color: Colors.white,
    //       fontSize: 18,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   leading: Icon(Icons.menu, color: Colors.white),
    //   actions: [
    //     ElevatedButton(
    //       onPressed: () async {
    //         DateTime? newDate = await showDatePicker(
    //           context: context,
    //           initialDate: dateTime,
    //           initialDatePickerMode: DatePickerMode.day,
    //           initialEntryMode: DatePickerEntryMode.calendar,
    //           firstDate: DateTime.now(),
    //           lastDate: DateTime(2100),
    //         );

    //         if (newDate == null) return;
    //         // ignore: use_build_context_synchronously
    //         TimeOfDay? newTime = await showTimePicker(
    //           context: context,
    //           initialTime: TimeOfDay(
    //             hour: dateTime.hour,
    //             minute: dateTime.minute,
    //           ),
    //           initialEntryMode: TimePickerEntryMode.dial,
    //         );
    //         if (newTime == null) return;

    //         final newDateTime = DateTime(
    //           newDate.year,
    //           newDate.month,
    //           newDate.day,
    //           newTime.hour,
    //           newTime.minute,
    //         );
    //         setState(() {
    //           dateTime = newDateTime;
    //         });
    //       },
    //       child: Text('Select a Time'),
    //     ),
    //     SizedBox(
    //       width: 10,
    //     ),
    //   ],
    // );
  }
}
