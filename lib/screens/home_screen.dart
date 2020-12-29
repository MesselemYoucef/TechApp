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
  double xOffset = 0;
  double yOffset = 0;
  double curvedEdges = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  AnimationController _animationController;

  String category = 'CCTV';

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
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  Widget build(BuildContext context) {
    return StreamProvider<List<ProductModel>>.value(
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
            Container(
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
                        Icon(Icons.location_on, color: primaryGreen),
                        Text("Dubai"),
                      ],
                    ),
                  ]),
                  Icon(
                    Icons.mail,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
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
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          print("Category Tapped ${categories[index]['name']}");
                          setState(() {
                            category = categories[index]['name'];
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: shadowList,
                              borderRadius: BorderRadius.circular(5)),
                          child: Image.asset(
                            categories[index]["iconPath"],
                            height: 40,
                            width: 40,
                            color: Colors.grey[700],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            categories[index]["name"],
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ))
                    ]),
                  );
                },
              ),
            ),
            ProductList(),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final products = Provider.of<List<ProductModel>>(context) ?? [];

    return Container(
      child: Expanded(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
              return ItemTile(product: products[index]);
          },
        ),
      ),
    );
  }
}
