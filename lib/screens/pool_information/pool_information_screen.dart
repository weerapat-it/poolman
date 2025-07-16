import 'package:flutter/material.dart';

import 'components/body.dart';
import '../../constants.dart';
import 'package:JDPoolsApplication/screens/pool_information/models/Product.dart';
class PoolInformationScreen extends StatelessWidget {
  static String routeName = "/pool_information";
  @override
  Widget build(BuildContext context) {
    final PoolInformationDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryColor, //change your color here
        ),
        backgroundColor: kPrimaryColor2,
        centerTitle: true,
        title: Text("Pool Information",style: TextStyle(color: kPrimaryColor)),
      ),
      body: Body(product: agrs.product),
    );
  }
}

class PoolInformationDetailsArguments {
  final Product product;

  PoolInformationDetailsArguments({@required this.product});
}
