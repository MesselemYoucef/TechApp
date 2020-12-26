import 'package:flutter/material.dart';
import 'package:petsApp/configuration.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  
  int _quantityCounter = 0;
  void add() {
    if(_quantityCounter >= 0 && _quantityCounter < 10){
      setState(() {
        _quantityCounter++;
      });
    }

  }

  void minus() {
    if(_quantityCounter > 0){
      setState(() {
        _quantityCounter--;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromRGBO(135, 90, 123, 1),
    body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
        icon: Icon(Icons.arrow_back), 
        iconSize: 30,
        color: Colors.white, 
        onPressed: (){
          print("back button pressed");
        },
        ),
        IconButton(
          icon: Icon(Icons.mail), 
          iconSize: 30,
          color: Colors.white, 
          onPressed: (){
            print("back email pressed");
        },
        ), 
        ],
        ),
          ),
          Container(
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width/1.5,
        height: MediaQuery.of(context).size.height/3,
        child: Image.asset('images/CCTV-Camera1.png'),
          ),
          Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: MediaQuery.of(context).size.height / 1.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30))),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
          Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text(
          "Price",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
      ),
      Text(
          "99.99 AED",
          style: TextStyle(fontSize: 20),
      ),
        ],
          ),
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text(
          "Model",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
      ),
      Text(
          "m-1546",
          style: TextStyle(fontSize: 20),
      ),
        ],
          )
      ],
          ),
          Container(
      width: MediaQuery.of(context).size.width,
      child: (Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum fermentum sagittis justo, non mattis magna imperdiet vitae. Praesent vitae condimentum ligula. Aenean tincidunt dui enim, eget tempus ex fermentum ac.",
      )),
          ),
          Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
          Row(
        children: <Widget>[
      Container(
          height: 30,
          width: 30,
          child: FloatingActionButton(
            onPressed: minus,
            child: Icon(
          Icons.remove,
          color: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
      ),
      SizedBox(
          width: 10,
      ),
      Text(
          "$_quantityCounter",
          style: TextStyle(fontSize: 30),
      ),
      SizedBox(
          width: 10,
      ),
      Container(
          height: 30,
          width: 30,
          child: FloatingActionButton(
            onPressed: add,
            child: Icon(
          Icons.add,
          color: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
      )
        ],
          ),
          Icon(
        Icons.favorite,
        color: Colors.red[900],
        size: 30,
          )
      ],
          ),
          Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Container(
        height: 40,
        width: 60,
        decoration: BoxDecoration(
          color: productDetailsBG,
          borderRadius: BorderRadius.circular(5)),
        child: Icon(
      Icons.add_shopping_cart,
      color: Colors.white,
      size: 30,
        ),
          ),
          Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          color: productDetailsBG,
          borderRadius: BorderRadius.circular(5)),
        child: Center(
      child: Text(
          "Instant Checkout",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
      ),
        ),
          )
      ],
          )
      ],
        ),
          ),
        ],
          ),
    ),
        );
  }
}
