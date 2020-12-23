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
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, '/product_screen');
        
          Navigator.pushNamed(context, '/product_screen');
       
        
      },
      child: Container(
        height: 220,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: itemBackground,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(10)),
                      ),
                      margin: EdgeInsets.only(top: 20)),
                  Align(
                      alignment: Alignment(0.0, 0.0), child: Image.asset(image))
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
                      Text(
                        productName,
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
