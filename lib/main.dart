import 'package:flutter/material.dart';
import 'package:petsApp/home_page.dart';
import 'package:petsApp/screens/product_details.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
