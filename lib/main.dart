import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:petsApp/screens/drawer_screen.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
          DrawerScreen(),
          HomeScreen()
       ],
     )
    );
  }
}
