import 'package:flutter/material.dart';


class Product {
<<<<<<< HEAD
  final int payment_history_id,voucher_id;
  final String datetime;
  final int price,status;
  final List<String> images;
  // final double  width,height,depth;


  Product({
    @required this.payment_history_id,
    @required this.voucher_id,
    @required this.price,
    @required this.status,
    @required this.datetime,
    @required this.images,

    // @required this.title,
    // @required this.width,
    // @required this.height,
    // @required this.depth,
    // @required this.description,
=======
  final int history_id,spin_id;
  final String title, description;
  final List<String> images;
  final double  width,height,depth;


  Product({
    @required this.history_id,
    @required this.spin_id,
    @required this.images,

    @required this.title,
    @required this.width,
    @required this.height,
    @required this.depth,
    @required this.description,
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  });

}


// Our demo Products

List<Product> demoProducts = [
  // Product(
  //   id: 1,
  //   images: [
  //     "assets/images/ps4_console_white_1.png",
  //     "assets/images/ps4_console_white_2.png",
  //     "assets/images/ps4_console_white_3.png",
  //     "assets/images/ps4_console_white_4.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Wireless Controller for PS4™",
  //   price: 64.99,
  //   description: description,
  //   rating: 4.8,
  //   isFavourite: true,
  //   isPopular: true,
  // ),
  // Product(
  //   id: 2,
  //   images: [
  //     "assets/images/Image Popular Product 2.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Nike Sport White - Man Pant",
  //   price: 50.5,
  //   description: description,
  //   rating: 4.1,
  //   isPopular: true,
  // ),
  // Product(
  //   id: 3,
  //   images: [
  //     "assets/images/glap.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Gloves XC Omega - Polygon",
  //   price: 36.55,
  //   description: description,
  //   rating: 4.1,
  //   isFavourite: true,
  //   isPopular: true,
  // ),
  // Product(
  //   id: 4,
  //   images: [
  //     "assets/images/wireless headset.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Logitech Head",
  //   price: 20.20,
  //   description: description,
  //   rating: 4.1,
  //   isFavourite: true,
  // ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
