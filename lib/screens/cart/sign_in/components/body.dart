import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/no_account_text.dart';
import 'package:JDPoolsApplication/components/socal_card.dart';
<<<<<<< HEAD
import '../../../../size_config.dart';
import 'sign_form.dart';
import 'package:JDPoolsApplication/screens/cart/sign_up/sign_up_screen.dart';

import '../../../../constants.dart';
=======
import '../../../size_config.dart';
import 'sign_form.dart';

>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "JDPOOLS",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \n",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocalCard(
                //       icon: "assets/icons/google-icon.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/facebook-2.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/twitter.svg",
                //       press: () {},
                //     ),
                //   ],
                // ),
                SizedBox(height: getProportionateScreenHeight(20)),
<<<<<<< HEAD
                // NoAccountText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? ",
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, SignUpCartScreen.routeName),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: kPrimaryColor2),
                  ),
                ),
              ],
            ),
=======
                NoAccountText(),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
              ],
            ),
          ),
        ),
      ),
    );
  }
}
