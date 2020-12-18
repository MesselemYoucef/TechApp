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
                  child: Container(
                    color: Colors.white
                  ),
                )
              ],
            )
            ),
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
                    onPressed: (){
                    Navigator.pop(context);
                  }),
                  IconButton(
                    icon: Icon(Icons.share), 
                    color: Colors.white,
                    onPressed: (){}
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset('images/pet-cat2.png'),
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
                  boxShadow: shadowList
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height:150,
                color: Colors.black,
              ),
            )
        ],
      )
    );
  }
}