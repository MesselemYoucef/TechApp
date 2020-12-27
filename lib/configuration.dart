import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color.fromRGBO(135, 90, 123, 1);
Color itemBackground = Color.fromRGBO(135, 90, 123, 1);
Color productDetailsBG = Color.fromRGBO(135, 90, 123, 1);

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 1))
];

List<Map> categories = [
  {'name': 'CCTV', 'iconPath': 'images/categories/camera-cctv.png'},
  {'name': 'DSLR', 'iconPath': 'images/categories/camera-dslr.png'},
  {'name': 'Desktops', 'iconPath': 'images/categories/desktop.png'},
  {'name': 'Mobiles', 'iconPath': 'images/categories/mobile.png'},
  {'name': 'Accessories', 'iconPath': 'images/categories/mouse.png'},
  {'name': 'Printers', 'iconPath': 'images/categories/printer.png'}
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
    'category': 'cctv'
  },
  {
    'productName': 'CCTV Camera2',
    'price': '99.99 AED',
    'condition': '2 years',
    'distance': '2 KM',
    'image': 'images/CCTV-Camera2.png',
    'category': 'cctv'
  },
  {
    'productName': 'CCTV Camera Dome 1',
    'price': '99.99 AED',
    'condition': '2 years',
    'distance': '2 KM',
    'image': 'images/CCTV-Dome-Camera1.png',
    'category': 'cctv'
  },
  {
    'productName': 'CCTV Camera Dome 2',
    'price': '99.99 AED',
    'condition': '2 years',
    'distance': '2 KM',
    'image': 'images/CCTV-Dome-Camera2.png',
    'category': 'cctv'
  },
  //////////////////////////////////////////
];
