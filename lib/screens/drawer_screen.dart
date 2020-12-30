import 'package:flutter/material.dart';
import '../configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 40, left: 10),
      color: primaryGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("POWERMAX",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  SizedBox(height: 10),
                  Text("Company Description",
                      style: TextStyle(
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
          Column(
            children: drawerItems
                .map((element) => GestureDetector(
                      onTap: () {
                        print("it is tapped");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              element['icon'],
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(element['title'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.settings, color: Colors.white),
              SizedBox(
                width: 10,
              ),
              Text("Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              VerticalDivider(),
              Text("Logout",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20))
            ],
          )
        ],
      ),
    );
  }
}
