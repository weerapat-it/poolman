import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/constants.dart';
import 'package:JDPoolsApplication/size_config.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  final String username;
  final String password;

  Body({Key key, @required this.username,@required this.password}) : super(key: key);



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
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Edit Profile", style: headingStyle),

                SizedBox(height: SizeConfig.screenHeight * 0.06),
                CompleteProfileForm(username:username,password:password),
                SizedBox(height: getProportionateScreenHeight(30)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
