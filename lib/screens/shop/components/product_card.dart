import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:JDPoolsApplication/models/Product.dart';
import 'package:JDPoolsApplication/screens/details/details_screen.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../shop_screen.dart';

class ProductCard extends StatelessWidget {
  static String routeName = "/product_card";
  static String result;
  const ProductCard({
    Key key,
    this.width = 100,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  showLoaderDialog(BuildContext context){



    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return Image.asset("assets/images/spingif.gif",width: 30,height: 30,);
      },
    );

  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(10),right: getProportionateScreenWidth(10),top:getProportionateScreenWidth(10),bottom: getProportionateScreenWidth(10) ),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        height: getProportionateScreenHeight(140),
        child: GestureDetector(
          onTap: () {

            Navigator.of(context).canPop();
            showLoaderDialog(context);
            new Future.delayed(new Duration(seconds: 1), () async {
              Navigator.pop(context); //pop dialog

               result = "${await  Navigator.pushNamed(
                  context,
                  DetailsScreen.routeName,
                  arguments: ProductDetailsArguments(product: product)

              )}";
              print("callback"+ result );
              if(result == '1') {
                // print("callbackaaa"+ result );
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) => shopScreen(search: null)), (
                    route) => false);
              }
              // Navigator.pushNamed(
              //     context,
              //     DetailsScreen.routeName,
              //     arguments: ProductDetailsArguments(product: product)
              //
              // );
            });

          },
          child: Container(
            decoration: BoxDecoration(
            color: kwhite,
            boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xFF979797).withOpacity(1),
            offset: const Offset(0, -2),
            blurRadius: 8.0),
            ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),

    child:Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                    decoration: BoxDecoration(
                      color: kwhite.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Hero(
                      tag: product.id.toString(),
                      child: product.images[0]!= '' ?Image.network(product.images[0]):Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ),

                Text(
                  product.title,
                  style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: getProportionateScreenWidth(10),),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Price : ",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(10),

                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "฿${NumberFormat.decimalPattern().format(product.price)}",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(10),
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor2,
                          ),
                        ),
                        if(product.qty != 0)
                          Text(
                            " x ${NumberFormat.decimalPattern().format(product.qty)}",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(10),
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor2,
                            ),
                          ),
                      ],
                    ),
                    // InkWell(
                    //   borderRadius: BorderRadius.circular(50),
                    //   onTap: () {},
                    //   child: Container(
                    //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    //     height: getProportionateScreenWidth(28),
                    //     width: getProportionateScreenWidth(28),
                    //     decoration: BoxDecoration(
                    //       color: product.isFavourite
                    //           ? kPrimaryColor.withOpacity(0.15)
                    //           : kSecondaryColor.withOpacity(0.1),
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: SvgPicture.asset(
                    //       "assets/icons/Heart Icon_2.svg",
                    //       color: product.isFavourite
                    //           ? Color(0xFFFF4848)
                    //           : Color(0xFFDBDEE4),
                    //     ),
                    //   ),
                    // ),
                  ],
                )
              ],
      ),
    ),
          ),
        ),
      ),
    );
  }
}
