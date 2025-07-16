import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/socal_card.dart';
import 'package:JDPoolsApplication/constants.dart';
import 'package:JDPoolsApplication/size_config.dart';
import 'rating_status.dart';
import 'product_page.dart';
import 'recomendation_page.dart';
import 'rating_form.dart';
import 'pdf_btn.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:JDPoolsApplication/screens/home/components/home_header.dart';

class Body extends StatelessWidget {

  final String value;

   Body({Key key, @required this.value}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Column(
          children: <Widget>[


    //   Column(
    //
    //   children: [
    //   // SizedBox(height: getProportionateScreenHeight(20)),
    //   HomeHeader(),
    //
    //   // SizedBox(height: getProportionateScreenHeight(20)),
    //   ],
    // ),

    // Here... Wrap your "SingleChildScrollView" with   "Expanded"
    Expanded(
      child: SizedBox(
        width: double.infinity,

          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: SizeConfig.screenHeight * 0.02), // 4%

                // HomeHeader(),
                SizedBox(height: SizeConfig.screenHeight * 0.02), // 4%
                RatingForm(value:value),
                // Container(
                //   width: double.maxFinite,
                //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                //   color: kSecondaryColor, //define the background color
                //   child: Text("Water Quality",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                // ),

                // SizedBox(height: SizeConfig.screenHeight * 0.02),
                // PoolInformationForm(),
                RatingStatus(value:value),
                SizedBox(height: SizeConfig.screenHeight * 0.02),

                // Container(
                //   width: 100,
                //   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                //   color: kPrimaryColorGreen.withOpacity(0.6),
                //   child: Text("Pool Type",style: TextStyle(backgroundColor: kPrimaryColorGreen),),
                //   // Text
                // ),


                // PoolTypeForm(),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  color: kSecondaryColor, //define the background color
                  child: Text("RECOMMENDATION",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                RecomendationPage(value:value),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                ProductPage(value:value),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                // PDFBtn(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                // PoolChemicalForm(),
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
                SizedBox(height: getProportionateScreenHeight(10)),

              ],


          ),

        ),
      ),
          ),
    ],
      ),
    );
  }
}
