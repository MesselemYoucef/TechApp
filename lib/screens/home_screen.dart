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
      child: SingleChildScrollView(
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
                  Text("Search to adopt"),
                  Icon(Icons.settings)
                ]
              ),
            ),
            Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index){
                return Container(
                  child: Column(
                    children:[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: shadowList,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Image.asset(
                          categories[index]["iconPath"],
                          height: 50,
                          width: 50,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(categories[index]["name"])
                    ]
                  ),
                );
              },
              ),

            ),
            
            Container(
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[500],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: shadowList
                          ),
                          margin: EdgeInsets.only(top: 40)
                        ),
                        Align(
                          alignment: Alignment(0.0, 0.0),
                          child: Image.asset("images/pet-cat1.png")
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 60, bottom: 20),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        boxShadow: shadowList,
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Carrot",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                Icon(Icons.face)
                              ],
                            ),
                         
                          Text(
                            "Arabian Mao", 
                            style: TextStyle(
                              fontSize:  15.0,
                            ),
                          ),
                          Text("2 years old"),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.blueGrey,
                                  ),
                                Text("Distance: 2KM")
                              ]
                            ),
                          )
                        ]
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: shadowList
                          ),
                          margin: EdgeInsets.only(top: 40)
                        ),
                        Align(
                          alignment: Alignment(0.0, 0.0),
                          child: Image.asset("images/pet-cat2.png")
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 60, bottom: 20),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        boxShadow: shadowList,
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Carrot",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                Icon(Icons.face)
                              ],
                            ),
                         
                          Text(
                            "Arabian Mao", 
                            style: TextStyle(
                              fontSize:  15.0,
                            ),
                          ),
                          Text("2 years old"),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.blueGrey,
                                  ),
                                Text("Distance: 2KM")
                              ]
                            ),
                          )
                        ]
                      ),
                    ),
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