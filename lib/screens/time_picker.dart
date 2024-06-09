// import 'dart:html';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'tasks_screen.dart';
// import 'test.dart';

class TimePicker extends StatefulWidget {
  static const String screenRoute = 'time_picker';

  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}



class _TimePickerState extends State<TimePicker> {
DateTime dateTime = DateTime(2024, 2, 22, 9, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400],
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        title: const Text('Time Picker'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selected Date:       ${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: dateTime,
                      initialDatePickerMode: DatePickerMode.day,
                      initialEntryMode: DatePickerEntryMode.calendar,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );

                    if (newDate == null) return;
                    // ignore: use_build_context_synchronously
                    TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(
                        hour: dateTime.hour,
                        minute: dateTime.minute,
                      ),
                      initialEntryMode: TimePickerEntryMode.dial,
                    );
                    if (newTime == null) return;

                    final newDateTime = DateTime(
                      newDate.year,
                      newDate.month,
                      newDate.day,
                      newTime.hour,
                      newTime.minute,
                    );
                    setState(() {
                      dateTime = newDateTime;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    'select Date',
                    style: TextStyle(color: Colors.indigo[400]),
                  ),
                ),
              ],
            ),
          ),
         
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: const Text('Done'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
