import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color.fromRGBO(135, 90, 123, 1);
Color itemBackground = Color.fromRGBO(135, 90, 123, 1);
Color productDetailsBG = Color.fromRGBO(135, 90, 123, 1);

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 1))
];

List<Map> categories = [
  {'name': 'CCTV', 'iconPath': 'images/categories/CCTV-icon-20201230.png'},
  {'name': 'DSLR', 'iconPath': 'images/categories/dslr-icon-20201230.png'},
  {'name': 'Laptop', 'iconPath': 'images/categories/laptop-icon-20201230.png'},
  {'name': 'Mobiles', 'iconPath': 'images/categories/mobile-icon-20201230.png'},
  {
    'name': 'Accessories',
    'iconPath': 'images/categories/accessories-icon-20201230.png'
  },
  {
    'name': 'Printers',
    'iconPath': 'images/categories/printer-icon-20201230.png'
  },
  {'name': 'iPad', 'iconPath': 'images/categories/ipad-icon-20201230.png'}
];

List<Map> drawerItems = [
  {'icon': FontAwesomeIcons.dove, 'title': 'New Arivals'},
  {'icon': Icons.favorite, 'title': 'Bestsellers'},
  {'icon': FontAwesomeIcons.users, 'title': 'About Us'},
  {'icon': Icons.mail, 'title': 'Contact Us'},
];

List<Map> itemDetails = [
  {
    'productName': 'CCTV Camera1',
    'price': '99.99 AED',
    'condition': '2 years',
    'distance': '2 KM',
    'image': 'images/CCTV-Camera1.png',
    'category': 'CCTV'
  },
  {
    'productName': 'CCTV Camera2',
    'price': '99.99 AED',
    'condition': '2 years',
    'distance': '2 KM',
    'image': 'images/CCTV-Camera2.png',
    'category': 'CCTV'
  },
  {
    'productName': 'CCTV Camera Dome 1',
    'price': '99.99 AED',
    'condition': '2 years',
    'distance': '2 KM',
    'image': 'images/CCTV-Dome-Camera1.png',
    'category': 'CCTV'
  },
  {
    'productName': 'CCTV Camera Dome 2',
    'price': '99.99 AED',
    'condition': '2 years',
    'distance': '2 KM',
    'image': 'images/CCTV-Dome-Camera2.png',
    'category': 'CCTV'
  },
  //////////////////////////////////////////
  {
    'productName': 'Laptop 1',
    'price': '88.39 AED',
    'condition': '1 years',
    'distance': '1 KM',
    'image': 'images/laptop1.png',
    'category': 'Laptop'
  },
  {
    'productName': 'Laptop 2',
    'price': '88.39 AED',
    'condition': '1 years',
    'distance': '1 KM',
    'image': 'images/laptop2.png',
    'category': 'Laptop'
  },
  {
    'productName': 'Laptop 3',
    'price': '88.39 AED',
    'condition': '1 years',
    'distance': '1 KM',
    'image': 'images/laptop3.png',
    'category': 'Laptop'
  },
  {
    'productName': 'Laptop 4',
    'price': '88.39 AED',
    'condition': '1 years',
    'distance': '1 KM',
    'image': 'images/laptop4.png',
    'category': 'Laptop'
  },
  {
    'productName': 'Laptop 5',
    'price': '88.39 AED',
    'condition': '1 years',
    'distance': '1 KM',
    'image': 'images/laptop5.png',
    'category': 'Laptop'
  },
  //////////////////////////////////////////
  {
    'productName': 'iPad 1',
    'price': '88.39 AED',
    'condition': '1 years',
    'distance': '1 KM',
    'image': 'images/iPad1.png',
    'category': 'iPad'
  },
  {
    'productName': 'iPad 2',
    'price': '88.39 AED',
    'condition': '1 years',
    'distance': '1 KM',
    'image': 'images/iPad2.png',
    'category': 'iPad'
  },
  //////////////////////////////////////////
  {
    'productName': 'Printer 1',
    'price': '88.39 AED',
    'condition': '1 years',
    'distance': '1 KM',
    'image': 'images/printer1.png',
    'category': 'Printers'
  },
  {
    'productName': 'Printer 2',
    'price': '88.39 AED',
    'condition': '1 years',
    'distance': '1 KM',
    'image': 'images/printer2.png',
    'category': 'Printers'
  },
  {
    'productName': 'Printer 3',
    'price': '88.39 AED',
    'condition': '1 years',
    'distance': '1 KM',
    'image': 'images/printer3.png',
    'category': 'Printers'
  }
];
