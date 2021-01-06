import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petsApp/models/product_model.dart';
import 'package:petsApp/configuration.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _quantityCounter = 0;

  void add() {
    if (_quantityCounter >= 0 && _quantityCounter < 10) {
      setState(() {
        _quantityCounter++;
      });
    }
  }

  void minus() {
    if (_quantityCounter > 0) {
      setState(() {
        _quantityCounter--;
      });
    }
  }

  bool _isNotFavorite = false;
  IconData favoriteIcon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    // get the product info from the item Tile page
    final Map data = ModalRoute.of(context).settings.arguments;
    ProductModel product =
        data["product"]; // image index in the configuration.dart file
    Image productImage = data["image"];

    _togglefavorite() {
      _isNotFavorite = !_isNotFavorite;
      _isNotFavorite
          ? favoriteIcon = Icons.favorite
          : favoriteIcon = Icons.favorite_border;
    }

    // to send an enquery about the product
    _mailURL(String productName) async {
      String mail =
          'mailto:messelemy@gmail.com?subject=Enquiry about ${product.name}';
      if (await canLaunch(mail)) {
        await launch(mail);
      } else {
        throw "error in opening the email";
      }
    }

    return Scaffold(
      backgroundColor: itemBackground,
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.mail),
                    iconSize: 30,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, "/contact_us");
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 3,
              child: Hero(
                tag: product.image,
                child: productImage,
              ),
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      product.name,
                      style: GoogleFonts.fjallaOne(
                        fontSize: 35,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                          ),
                          Text(
                            "${product.price} AED",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Condition",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                          ),
                          Text(
                            product.condition,
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
                              heroTag: null,
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
                              heroTag: null,
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
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _togglefavorite();
                            });
                          },
                          icon: Icon(
                            favoriteIcon,
                            color: Colors.red[900],
                            size: 35,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                            color: itemBackground,
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _mailURL(product.name);
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                              color: itemBackground,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "Make an enquiry",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
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
