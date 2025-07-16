import 'package:flutter/material.dart';

import 'Product.dart';

class Cart {
  final ProductQuality productQuality;
  final int numOfItem;

  Cart({@required this.productQuality, @required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCartsQuality = [
  // Cart(product: demoProducts[0], numOfItem: 2),
  // Cart(product: demoProducts[1], numOfItem: 1),
  // Cart(product: demoProducts[3], numOfItem: 1),
];
