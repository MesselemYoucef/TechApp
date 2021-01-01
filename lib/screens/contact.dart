import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petsApp/configuration.dart';


class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Contact Us",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.fjallaOne(
                    textStyle: TextStyle(
                      color: itemBackground,
                      fontSize: 50.0
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}