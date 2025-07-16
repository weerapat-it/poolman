import 'package:flutter/material.dart';

<<<<<<< HEAD
import '../../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsCartScreen extends StatelessWidget {
  static String routeName = "/details_cart";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArgumentsCart agrs =
=======
import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      // appBar: CustomAppBar(rating: agrs.product.rating),
      appBar: CustomAppBar(),
<<<<<<< HEAD
      body: Body(product: agrs.product,item:agrs.item),
=======
      body: Body(product: agrs.product),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    );
  }
}

<<<<<<< HEAD
class ProductDetailsArgumentsCart {
  final Product product;
  final int item;

  ProductDetailsArgumentsCart({@required this.product, @required this.item});
=======
class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
}
