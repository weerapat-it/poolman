import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/pool_list/models/Cart.dart';

import 'package:JDPoolsApplication/screens/regis_pool/register_pools.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        // Navigator.of(context).canPop();
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => registerPool(cart: cart)
        ));
      },

    child: Row(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: cart.product.images[0]!= '' ?Image.network("http://jdpoolswebservice.com/spintest/"+cart.product.images[0]):Icon(
                Icons.camera_alt,
                color: Colors.grey[800],
              ),
            ),
          ),
        ),

        SizedBox(width: 20),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pool : "+cart.product.title,
              style: TextStyle(color: kPrimaryColor, fontSize: 16),
              maxLines: 2,
            ),
            // SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "Width : ${cart.product.width} m.",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
                children: [
                  // TextSpan(
                  //     text: " x${cart.numOfItem}",
                  //     style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: "Height : ${cart.product.height} m.",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
                children: [
                  // TextSpan(
                  //     text: " x${cart.numOfItem}",
                  //     style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: "Depth : ${cart.product.depth} m.",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
                children: [
                  // TextSpan(
                  //     text: " x${cart.numOfItem}",
                  //     style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    ),
    );
  }
}
