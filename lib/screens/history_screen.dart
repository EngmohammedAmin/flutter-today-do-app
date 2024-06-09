// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  static const String screenRoute = "History";

  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(92, 107, 192, 1),
          centerTitle: true,
          title: Text("History Screen"),
          leading: Icon(Icons.menu, color: Colors.white),
          actions: [
            SizedBox(width: 10),
            Icon(Icons.add, color: Colors.white),
            SizedBox(width: 10),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        body: Center(
          child: Text(
            "History Screen",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ));
  }
}
