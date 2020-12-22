import 'package:flutter/material.dart';
import 'package:petsApp/screens/item_tile.dart';
import '../configuration.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double curvedEdges = 0;

  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(curvedEdges)),
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen
                    ? IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            curvedEdges = 0;
                            isDrawerOpen = false;
                          });
                        })
                    : IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = 300;
                            yOffset = 100;
                            scaleFactor = 0.8;
                            curvedEdges = 40;
                            isDrawerOpen = true;
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text(
                    "Search Product",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
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
                    Container(
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
          Expanded(
            child: ListView.builder(
              itemCount: itemDetails.length,
              itemBuilder: (context, index) {
                return ItemTile(
                  productName: itemDetails[index]['productName'],
                  price: itemDetails[index]['price'],
                  condition: itemDetails[index]['condition'],
                  distance: itemDetails[index]['distance'],
                  image: itemDetails[index]['image'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
