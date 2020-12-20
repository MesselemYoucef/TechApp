import 'package:flutter/material.dart';
import 'package:petsApp/configuration.dart';


class ItemTile extends StatelessWidget {
  final String name;
  final String race;
  final String age;
  final String distance;
  final String image;

  ItemTile({this.name, this.age, this.distance, this.image, this.race});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                          boxShadow: shadowList),
                      margin: EdgeInsets.only(top: 40)),
                  Align(
                      alignment: Alignment(0.0, 0.0),
                      child: Hero(
                          tag: 1,
                          child: Image.asset(image)))
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 60, bottom: 20),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.face)
                        ],
                      ),
                      Text(
                        race,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Text("$age old"),
                      Container(
                        child: Row(children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blueGrey,
                          ),
                          Text("Distance: $distance")
                        ]),
                      )
                    ]),
              ),
            )
                    ],
                  ),
                
    );
  }
}