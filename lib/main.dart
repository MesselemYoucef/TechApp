import 'package:flutter/material.dart';
import 'package:petsApp/home_page.dart';
import 'package:petsApp/screens/product_details.dart';

void main() {
  //runApp(MaterialApp(home: HomePage()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/product_details': (context) => ProductDetails()
      },
    );
  }
}
