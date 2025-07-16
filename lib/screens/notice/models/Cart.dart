import 'package:flutter/material.dart';

import 'Product.dart';

class Cart {
  final Product product;
<<<<<<< HEAD

  Cart({@required this.product});
=======
  final int numOfItem;

  Cart({@required this.product, @required this.numOfItem});
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
}

// Demo data for our cart

List<Cart> demoCarts = [
  // Cart(product: demoProducts[0], numOfItem: 2),
  // Cart(product: demoProducts[1], numOfItem: 1),
  // Cart(product: demoProducts[3], numOfItem: 1),
];
