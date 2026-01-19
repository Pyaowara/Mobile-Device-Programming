import 'package:flutter/material.dart';
// import 'screens/shop_screen.dart';
import 'screens/navigate_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoListScreen());
  }
}
