import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/socal_card.dart';
import 'package:JDPoolsApplication/constants.dart';
import 'package:JDPoolsApplication/size_config.dart';

import 'edit_form.dart';
import 'edit_profile_form.dart';

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
                // SizedBox(height: SizeConfig.screenHeight * 0.03),
                // Text("Select address", style: headingStyle),
                // Text(
                //   "Complete your details or continue  \nwith social media",
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(height: SizeConfig.screenHeight * 0.06),
                EditForm(username:null,password:null),
                SizedBox(height: getProportionateScreenHeight(30)),
                // Text(
                //   "By continuing your confirm that you agree \nwith our Term and Condition",
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context).textTheme.caption,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
