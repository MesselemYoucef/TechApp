import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petsApp/configuration.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blueGrey[300],
              ),
            ),
            Expanded(
              child: Container(color: Colors.white),
            )
          ],
        )),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                IconButton(
                    icon: Icon(Icons.share),
                    color: Colors.white,
                    onPressed: () {})
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset('images/CCTV-Camera1.png'),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: shadowList),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(bottom: 40),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: primaryGreen,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      color: primaryGreen,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "Adoption",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
