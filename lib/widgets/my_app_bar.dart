import 'package:flutter/material.dart';

// Define the abstract class
abstract class MyAppBar {
  late String title;
  // other abstract methods or properties can be defined here
}

// Create a concrete subtype that extends the abstract class
class ConcreteMyAppBar extends MyAppBar {
  ConcreteMyAppBar({required this.title});
  

  @override
  String title;
 
}



