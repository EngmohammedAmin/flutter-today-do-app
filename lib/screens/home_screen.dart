import 'package:flutter/material.dart';

import '../widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String screenRoute = "Home";
  
  
// ConcreteMyAppBar myAppBar1 = ConcreteMyAppBar(title: 'My Screen Title');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen Title'),
      ),
      body: Center(
        child: Text('This is my screen content'),
      ),
    );
  }
}
