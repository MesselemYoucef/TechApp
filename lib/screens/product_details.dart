import 'package:flutter/material.dart';
import 'package:petsApp/configuration.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _n = 0;

  void add() {
    if (_n >= 0) {
      setState(() {
        _n++;
      });
    }
  }

  void minus() {
    if (_n >= 0) {
      setState(() {
        _n++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(135, 90, 123, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(top: 0),
                width: MediaQuery.of(context).size.width / 1.9,
                height: MediaQuery.of(context).size.height / 2.7,
                child: Image.asset('images/CCTV-Camera2.png')),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
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
                              "99.99",
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
                              "$_n",
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
                              "Contact Us",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
