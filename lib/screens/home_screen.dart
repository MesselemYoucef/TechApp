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

  bool isDrawerOpen = false;

  AnimationController _animationController;

  String category = 'CCTV';

  Color itemIconColor = itemBackground; // for the category icon color
  Color itemBackgroundColor = Colors.transparent; // background for the category item color

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
                  IconButton(
                    icon: Icon(
                      Icons.mail,
                      color: Colors.grey[800],
                    ), 
                    onPressed: (){
                      Navigator.pushNamed(context, "/contact_us");
                    }
                    ),
                ],
              ),
            ),
            Container(
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
            //Categories List Section ==============>
            Container(
              height: 80,
              color: Colors.transparent,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  if (category == categories[index]['name']){
                      itemIconColor = Colors.white;
                      itemBackgroundColor = itemBackground;
                    }else{
                      itemIconColor = itemBackground;
                      itemBackgroundColor = Colors.white;
                  }
                  return Container(
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            category = categories[index]['name'];
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(2),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: itemBackgroundColor,
                              border:
                                  Border.all(color: itemBackground, width: 1),
                              borderRadius: BorderRadius.circular(5)),
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
                      Container(
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
