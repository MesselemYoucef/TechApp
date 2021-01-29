import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petsApp/configuration.dart';
import 'package:petsApp/models/product_model.dart';
import 'package:petsApp/services/storage_services.dart';

class ItemTile extends StatelessWidget {
  ProductModel product;
  Image productImage;

  Future<Widget> _getImage(BuildContext context, String imageName) async { // get the image from the cloud Storage
    Image image;
    await StorageServices.loadImage(context, imageName).then((value) {
      image = Image.network(value.toString(), fit: BoxFit.scaleDown);
    });
    return image;
  }

  ItemTile({this.product}); // initialize the product
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {// tap to go to the produclt details view
        Navigator.pushNamed(context, '/product_details',
            arguments: {'product': product,  'image': productImage});
      },
      child: Container(// container to hold all the product info
        height: 220,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container( //container to hold the picture of the product
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
                  Align(// to put the main picture on top of the previous container
                    alignment: Alignment(0.0, 0.0),
                    child: Hero(
                      tag: product.image,
                      //child: Image.asset("${product.image}"),
                      child: FutureBuilder(
                        future: _getImage(context, product.image),
                        builder: (context, snapshot) {// perform a checkup whether the connection state is don or not yet
                          if (snapshot.connectionState ==
                              ConnectionState.done) { // succuss => display the product image
                            productImage = snapshot.data;
                            return Container(
                              child: snapshot.data,
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {// waiting => display the circular progress indicator
                            return Container(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return Container();// in case of failure => display empty container
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(// the product main info card
              child: Container(
                margin: EdgeInsets.only(top: 60, bottom: 20),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500],
                          blurRadius: 10,
                          offset: const Offset(0, 5))
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
                        style: GoogleFonts.fjallaOne(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${product.price} AED",
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
