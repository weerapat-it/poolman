<<<<<<< HEAD
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../constants.dart';
import '../../models/Product.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class checkListResultScreen extends StatelessWidget {

  static String routeName = "/detailsResult";
  @override
  Widget build(BuildContext context) {
    final agrs =
        ModalRoute.of(context).settings.arguments as checklistresultArguments;

    return Scaffold(
      backgroundColor: kwhite,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/bgjob.png',

            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(

              child: Text.rich(

                TextSpan(
                  text: "Job Report",
                  style: TextStyle(fontSize: 26, color: Colors.white,fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Body(value: agrs.value),

     Padding(
            padding: const EdgeInsets.only(top: 750.0),
            child:  Container(
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text.rich(

                            TextSpan(
                              text: "Back to menu",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pop();
                                  }
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/Shape.svg",
                        ),
                      ],

                  ),
                ],
              ),
            ),

      ),

        ],
      ),


=======
import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      // appBar: CustomAppBar(rating: agrs.product.rating),
      appBar: CustomAppBar(),
      body: Body(product: agrs.product),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    );
  }
}

<<<<<<< HEAD
class checklistresultArguments {
  final String value;

  checklistresultArguments({@required this.value});
=======
class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
}
