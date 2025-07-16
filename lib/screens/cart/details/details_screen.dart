import 'package:flutter/material.dart';

import '../../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsCartScreen extends StatelessWidget {
  static String routeName = "/details_cart";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArgumentsCart agrs =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      // appBar: CustomAppBar(rating: agrs.product.rating),
      appBar: CustomAppBar(),
      body: Body(product: agrs.product,item:agrs.item),
    );
  }
}

class ProductDetailsArgumentsCart {
  final Product product;
  final int item;

  ProductDetailsArgumentsCart({@required this.product, @required this.item});
}
