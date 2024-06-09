// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todaydo_app/main.dart';
import 'package:todaydo_app/models/task.dart';
import 'package:todaydo_app/models/task_data.dart';
import 'package:todaydo_app/screens/add_task_screen.dart';

import 'package:todaydo_app/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

import '../widgets/side_bar_widget.dart';
import 'category_screen.dart';
import 'history_screen.dart';
import 'test.dart';

class TasksScreen extends StatefulWidget {
  static const String screenRoute = 'tasks_screen';

  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime dateTime = DateTime(2024, 2, 22, 9, 30);
  int index = 0;
  final pages = [
    const CategoryScreen(),
    const CategoryScreen(),
    const HistoryScreen(),
  ];

  List<Task> tasks = [];
  void getPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, TasksScreen.screenRoute);
        break;
      case 1:
        Navigator.pushNamed(context, CategoryScreen.screenRoute);
        break;
      case 2:
        Navigator.pushNamed(context, HistoryScreen.screenRoute);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 600;
    final isTablet = MediaQuery.of(context).size.width >= 400 &&
        MediaQuery.of(context).size.width < 600;
    final isPhone = MediaQuery.of(context).size.width < 400;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (int index) {
            setState(() {
              this.index = index;
            });
            getPage(context, index);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              tooltip: 'Home',
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              label: 'category',
              tooltip: 'category',
              selectedIcon: Icon(Icons.category),
            ),
            NavigationDestination(
              icon: Icon(Icons.history_edu_outlined),
              label: 'History',
              tooltip: 'History',
              selectedIcon: Icon(Icons.history_edu),
            ),
          ]),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(92, 107, 192, 1),
        centerTitle: true,
        title: Text(
          '${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        // leading: Icon(Icons.menu, color: Colors.white),
        actions: [
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
            child: Text('Select a Time'),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: isPhone || isTablet
          ? Drawer(
              elevation: 10,
              width: MediaQuery.of(context).size.width * 0.75,
              child: SideBarWidget(),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen((newTaskTitle) {
                  // setState(() {
                  //   tasks.add(Task(name: newTaskTitle));
                  //   Navigator.pop(context);
                  // });
                }),
              ),
            ),
          );
        },
        backgroundColor: Colors.indigo[400],
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.teal[400],
      body: Row(
        children: [
          if (isDesktop)
            Container(
              width: 200,
              color: Colors.black26,
              child: SideBarWidget(),
            ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 60,
                left: 20,
                right: 20,
                bottom: 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.playlist_add_check,
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'ToDayDo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      '${Provider.of<TaskData>(context).tasks.length} Tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            icon: Icon(Icons.warning, color: Colors.red),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            title: Text("Delete all tasks?"),
                            content: Text(
                                "Are you sure you want to delete all tasks?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Test.screenRoute);
                                  },
                                  child: Text("Yes")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("No")),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: TasksList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
