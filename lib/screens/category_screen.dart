// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/side_bar_widget.dart';

class CategoryScreen extends StatelessWidget {
  static const String screenRoute = "Category";

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 600;
    final isTablet = MediaQuery.of(context).size.width >= 400 &&
        MediaQuery.of(context).size.width < 600;
    final isPhone = MediaQuery.of(context).size.width < 400;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(92, 107, 192, 1),
          centerTitle: true,
          title: Text("Category Screen"),
          actions: [
            Icon(Icons.more_vert, color: Colors.white),
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
          ]),
      drawer: isPhone || isTablet
          ? Drawer(
              elevation: 10,
              width: MediaQuery.of(context).size.width * 0.5,
              child: SideBarWidget(),
            )
          : null,
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
              child: Center(
                child: Text(
                  "Category Screen",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
