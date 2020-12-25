import 'package:flutter/material.dart';
import 'package:petsApp/configuration.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: productDetailsBG,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:Container(
              height: MediaQuery.of(context).size.height/1.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
              ),      
            )
          )
        ],
      ),
    );
  }
}