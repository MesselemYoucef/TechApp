import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class StorageServices extends ChangeNotifier{
  StorageServices();

  static Future<dynamic> loadImage(BuildContext context, String image) async{
    return await FirebaseStorage.instance.ref().child("images").child(image).getDownloadURL();
  }

}