import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petsApp/models/product_model.dart';


class ProductServices{
  final String categoryName;
  ProductServices({this.categoryName});

  final CollectionReference productCollection = FirebaseFirestore.instance.collection("products");


  Future updateProduct(String name, String category, String image, String condition, String price, String distance) async{
    return await productCollection.doc().set({
      'name': name,
      'category': category,
      'image' : image,
      'condition' : condition,
      'price' : price,
      'distance' : distance
    });
  }


  List<ProductModel> _productFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return ProductModel(
        name: doc.data()['name'] ?? '',
        category: categoryName,
        condition: doc.data()['condition'] ?? '',
        image: doc.data()['image'] ?? '',
        price: doc.data()['price'] ?? '',
        distance: doc.data()['distance'] ?? ''
      );
    }).toList();
  }

  Stream<List<ProductModel>> get products{
    return productCollection
    .where("category", isEqualTo: categoryName)
    .snapshots()
    .map(_productFromSnapshot);
  }
}