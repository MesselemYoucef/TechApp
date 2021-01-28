import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/drawer_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Screen for the main menu
        DrawerScreen(),

        // Screen for the products and it is the main screen for the user to start with
        HomeScreen()
      ],
    ));
  }
}
