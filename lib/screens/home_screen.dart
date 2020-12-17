import 'package:flutter/material.dart';
import '../configuration.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double xOffset=0;
  double yOffset = 0;

  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      color: Colors.grey[200],
      child: Column(
        children: [
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen ? 
                IconButton(icon: Icon(Icons.menu), onPressed: (){
                  setState(() {
                    xOffset = 0;
                    yOffset = 0;
                    scaleFactor = 1;
                    isDrawerOpen = false;
                  });
                }) :
                IconButton(icon: Icon(Icons.menu), onPressed: (){
                  setState(() {
                    xOffset = 250;
                    yOffset = 150;
                    scaleFactor = 0.5;
                    isDrawerOpen = true;
                  });
                }),
                Column(
                  children: [
                    Text("Location"),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: primaryGreen),
                        Text("Dubai"),
                      ],
                    ),
                  ]
                ),
                CircleAvatar(backgroundColor: Colors.blue,)

              ],
            ),
          ),
      
          Container(
            padding: EdgeInsets.symmetric(horizontal:20, vertical: 15),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical:20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Icon(Icons.search),
                Text("Search a pet to adopt"),
                Icon(Icons.settings)
              ]
            ),
          )
        ],
      ),
    );
  }
}