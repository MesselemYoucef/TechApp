import 'package:flutter/material.dart';
import 'package:petsApp/configuration.dart';

class ItemTile extends StatelessWidget {
  final String productName;
  final String price;
  final String condition;
  final String distance;
  final String image;

  ItemTile(
      {this.productName,
      this.condition,
      this.distance,
      this.image,
      this.price});
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
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(10)),
                        boxShadow: shadowList),
                    margin: EdgeInsets.only(top: 40)),
                Align(
                    alignment: Alignment(0.0, 0.0),
                    child: Hero(tag: 1, child: Image.asset(image)))
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
                  )),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.face)
                      ],
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Text("$condition old"),
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
