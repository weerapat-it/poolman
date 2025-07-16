import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/cart/cart_screen.dart';

import 'package:JDPoolsApplication/screens/mail/mail_screen.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class PDFBtn extends StatelessWidget {
  const PDFBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SearchField(),

          IconBtnWithCounter(
            svgSrc: "assets/icons/Flash Icon.svg",
            // numOfitem: 3,
            press: () => Navigator.pushNamed(context, MailScreen.routeName),
          ),
        ],
      ),
    );
  }
}
