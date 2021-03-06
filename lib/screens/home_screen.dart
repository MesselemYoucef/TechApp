import 'package:flutter/material.dart';
import 'package:petsApp/screens/item_tile.dart';
import '../configuration.dart';
import 'package:provider/provider.dart';
import 'package:petsApp/models/product_model.dart';
import 'package:petsApp/services/product_services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  //Variables for the animation of the home screen to be reduced and pushed aside
  double xOffset = 0;
  double yOffset = 0;
  double curvedEdges = 0;
  double scaleFactor = 1;

  // bool var for the the drawer to check it if it is opened or not
  bool isDrawerOpen = false;

  // to control the animation of the icon whether it is a menu icon or a back-arrow
  AnimationController _animationController;

  // name of the category to start with
  String category = 'CCTV';

  Color itemIconColor = itemBackground; // for the category icon color
  Color itemBackgroundColor =
      Colors.transparent; // background for the category item color

  //functionality to handle the homescreen animation whether to shrink or scale
  // also to handle whe
  void _handleOnPressed() {
    isDrawerOpen
        ? setState(() {
            xOffset = 0;
            yOffset = 0;
            scaleFactor = 1;
            curvedEdges = 0;
            isDrawerOpen = !isDrawerOpen;
            _animationController.reverse();
          })
        : setState(() {
            xOffset = 300;
            yOffset = 100;
            scaleFactor = 0.8;
            curvedEdges = 40;
            isDrawerOpen = !isDrawerOpen;
            _animationController.forward();
          });
  }

  @override
  // setting up the animation controller for the icon to change its state
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  Widget build(BuildContext context) {
    return StreamProvider<List<ProductModel>>.value(// Stream for the products stores in db
      value: ProductServices(categoryName: category).products,
      child: AnimatedContainer( 
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(curvedEdges)),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(// holds the shrinking button + location + contact button
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: AnimatedIcon(
                        size: 30,
                        icon: AnimatedIcons.menu_arrow,
                        progress: _animationController,
                      ),
                      onPressed: () {
                        setState(() {
                          _handleOnPressed();
                        });
                      }),
                  Column(children: [
                    Text("Location"),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: itemBackground),
                        Text("Dubai"),
                      ],
                    ),
                  ]),
                  IconButton(
                      icon: Icon(
                        Icons.mail,
                        color: Colors.grey[800],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/contact_us");
                      }),
                ],
              ),
            ),
            Container(//Search bar for the product
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: itemBackground,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.search),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search Product",
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Icon(Icons.settings)
                  ]),
            ),
            
            Container(//List of the categories section
              height: 80,
              color: Colors.transparent,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  //perform a check the the selected category to color the background and the image
                  if (category == categories[index]['name']) {
                    itemIconColor = Colors.white;
                    itemBackgroundColor = itemBackground;
                  } else {
                    itemIconColor = itemBackground;
                    itemBackgroundColor = Colors.white;
                  }
                  return Container(
                    child: Column(
                      children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            category = categories[index]['name']; // when tapped it changes the category
                          });
                        },
                        child: Container(// category image
                          padding: EdgeInsets.all(2),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: itemBackgroundColor,
                            border: Border.all(color: itemBackground, width: 1,),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(2, 3),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            "images/categories/${categories[index]["iconPath"]}",
                            color: itemIconColor,
                            height: 50,
                            width: 50,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(// category title
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            categories[index]["name"],
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: itemBackground,
                            ),
                          ))
                    ]),
                  );
                },
              ),
            ),
            ProductList(),// calling the widgets that build the list of the products
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget { // widget for the products list
  const ProductList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<ProductModel>>(context) ?? []; // provide to get the products with their ProductModel class

    if (products.length != 0) { // if there is a product to display
      return Container(
        child: Expanded(
          child: ListView.builder(// products list builder
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ItemTile(product: products[index]); // calling the item tile which is responsible for the shaping of each product and passing to it the object product
            },
          ),
        ),
      );
    } else { // if there is no product to display, then, a not foud error image appears
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(
            "images/product-error.png",
            fit: BoxFit.contain,
          ),
        ),
      );
    }
  }
}
