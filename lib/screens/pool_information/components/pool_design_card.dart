import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:JDPoolsApplication/screens/pool_information/models/Product.dart';
import 'package:JDPoolsApplication/screens/details/details_screen.dart';
import 'package:JDPoolsApplication/screens/pool_information/pool_information_screen.dart';

import 'pool_information_form.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class PoolDesignCard extends StatelessWidget {
  static String routeName = "/pool_card";
  const PoolDesignCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xFF979797).withOpacity(0.3),
              offset: const Offset(0, 2),
              blurRadius: 5),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.of(context).canPop();
              Navigator.pushNamed(
                  context,
                  PoolInformationScreen.routeName,
                  arguments: PoolInformationDetailsArguments(product: product)

              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                AspectRatio(
                  aspectRatio: 2.02,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Hero(
                      tag: product.id.toString(),
                      child: product.images[0]!= '' ?Image.network("http://jdpoolswebservice.com/spintest/"+product.images[0]):Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800]),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Pool name : "+product.title,
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "\$${product.price}",
                //       style: TextStyle(
                //         fontSize: getProportionateScreenWidth(18),
                //         fontWeight: FontWeight.w600,
                //         color: kPrimaryColor,
                //       ),
                //     ),
                //     InkWell(
                //       borderRadius: BorderRadius.circular(50),
                //       onTap: () {},
                //       child: Container(
                //         padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                //         height: getProportionateScreenWidth(28),
                //         width: getProportionateScreenWidth(28),
                //         decoration: BoxDecoration(
                //           color: product.isFavourite
                //               ? kPrimaryColor.withOpacity(0.15)
                //               : kSecondaryColor.withOpacity(0.1),
                //           shape: BoxShape.circle,
                //         ),
                //         child: SvgPicture.asset(
                //           "assets/icons/Heart Icon_2.svg",
                //           color: product.isFavourite
                //               ? Color(0xFFFF4848)
                //               : Color(0xFFDBDEE4),
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
