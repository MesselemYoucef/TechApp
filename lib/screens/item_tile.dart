import 'package:flutter/material.dart';
import 'package:petsApp/configuration.dart';
import 'package:petsApp/models/product_model.dart';
import 'package:petsApp/services/storage_services.dart';

class ItemTile extends StatelessWidget {
  ProductModel product;
  Image productImage;

  Future<Widget> _getImage(BuildContext context, String imageName) async {
    Image image;
    await StorageServices.loadImage(context, imageName).then((value) {
      image = Image.network(value.toString(), fit: BoxFit.scaleDown);
    });
    return image;
  }

  ItemTile({this.product});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product_details',
            arguments: {'product': product, "image": productImage});
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
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500],
                                offset: Offset(0, 5),
                                blurRadius: 5)
                          ]),
                      margin: EdgeInsets.only(top: 20)),
                  Align(
                    alignment: Alignment(0.0, 0.0),
                    child: Hero(
                      tag: product.image,
                      //child: Image.asset("${product.image}"),
                      child: FutureBuilder(
                        future: _getImage(context, product.image),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                                productImage = snapshot.data;
                            return Container(
                              child: snapshot.data,
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return Container();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 60, bottom: 20),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500],
                          blurRadius: 10,
                          offset: const Offset(2, 5))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        product.price,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Text(product.condition),
                      Container(
                        child: Row(children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blueGrey,
                          ),
                          Text("Distance: ${product.distance}")
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
