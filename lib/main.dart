// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:todaydo_app/models/task_data.dart';
import 'package:todaydo_app/screens/category_screen.dart';
import 'package:todaydo_app/screens/home_screen.dart';
import 'screens/history_screen.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';

import 'screens/test.dart';
import 'screens/time_picker.dart';

void main() {
  runApp(const MyApp());
   
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      return ChangeNotifierProvider(
        create: (context) => TaskData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: TasksScreen.screenRoute,
          routes: {
            TimePicker.screenRoute: (context) => const TimePicker(),
            Test.screenRoute: (context) => const Test(),
            CategoryScreen.screenRoute: (context) => const CategoryScreen(),
            HistoryScreen.screenRoute: (context) => const HistoryScreen(),
            HomeScreen.screenRoute: (context) =>  HomeScreen(),
          },
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => const TasksScreen(),
            );
          },
        ),
      );
    } catch (e) {
      return Text(e.toString());
    }
  }
}
