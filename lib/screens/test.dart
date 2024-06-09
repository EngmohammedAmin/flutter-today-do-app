// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// import 'tasks_screen.dart';

class Test extends StatefulWidget {
  static const String screenRoute = 'Test';

  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(92, 107, 192, 1),
        title: Text('Reorderable List'),
        centerTitle: true,
      ),
      body: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              var item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
              _selectedIndex = newIndex;
            });
          },
          children: [
            for (var item in items)
              Card(
                key: ValueKey(item),
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(5),
                clipBehavior: Clip.antiAlias,
                elevation: 5,
                shadowColor: Colors.black54,
                color: Colors.blue[200],
                child: ListTile(
                  title: Text(
                    item,
                    style: TextStyle(
                      color: items[_selectedIndex] == item
                          ? Colors.red
                          : Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = items.indexOf(item);
                      
                    });
                  },
                  // trailing: Icon(Icons.arrow_forward),
                ),
              ),
          ]),
    );
  }
}

