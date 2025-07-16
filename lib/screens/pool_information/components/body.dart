import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/socal_card.dart';
import 'package:JDPoolsApplication/constants.dart';
import 'package:JDPoolsApplication/size_config.dart';
import 'pool_type_form.dart';
import 'pool_chemical.dart';
import 'pool_information_form.dart';
import 'slideshow.dart';

import 'package:JDPoolsApplication/screens/pool_information/models/Product.dart';
import 'pool_data.dart';
import 'package:JDPoolsApplication/screens/quality_page/quality_page_screen.dart';

import 'product_page.dart';
class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentStep = 1;
    StepperType stepperType = StepperType.horizontal;
    final _formKey = GlobalKey<FormState>();
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Stepper(
              type: stepperType,
              physics: ScrollPhysics(),
              currentStep: _currentStep,

              steps: <Step>[
                Step(
                  title: new Text('Spin data'),
                  content: Column(
                    children: <Widget>[

                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0 ?
                  StepState.complete : StepState.disabled,
                ),
                Step(
                  title: new Text('Pool data'),
                  content: SafeArea(
                    child: SizedBox(
                      width: double.infinity,

                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // SizedBox(height: SizeConfig.screenHeight * 0.02), // 4%
                            // Slideshow(),
                            PoolData(),
                            SizedBox(height: SizeConfig.screenHeight * 0.02),
                            Container(
                              width: double.maxFinite,
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              color: kPrimaryColorGreen, //define the background color
                              child: Text("Pool Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                            ),

                            SizedBox(height: SizeConfig.screenHeight * 0.02),



                            PoolInformationForm(product: product),
                            SizedBox(height: SizeConfig.screenHeight * 0.02),
                            // Container(
                            //   width: 100,
                            //   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                            //   color: kPrimaryColorGreen.withOpacity(0.6),
                            //   child: Text("Pool Type",style: TextStyle(backgroundColor: kPrimaryColorGreen),),
                            //   // Text
                            // ),
                            // Container(
                            //   width: double.maxFinite,
                            //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                            //   color: kPrimaryColorGreen, //define the background color
                            //   child: Text("Pool Type",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                            // ),
                            // SizedBox(height: SizeConfig.screenHeight * 0.02),
                            // PoolTypeForm(),
                            // Container(
                            //   width: double.maxFinite,
                            //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                            //   color: kPrimaryColorGreen, //define the background color
                            //   child: Text("Chemical",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                            // ),
                            // SizedBox(height: SizeConfig.screenHeight * 0.02),
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
                            // SizedBox(height: getProportionateScreenHeight(10)),
                            //
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                            //   child: DefaultButton(
                            //     text: "Submit",
                            //     press: () {
                            //
                            //         // if all are valid then go to success screen
                            //         // Navigator.pushNamed(context, QualityPageScreen.routeName);
                            //         Navigator.of(context).pushNamedAndRemoveUntil( QualityPageScreen.routeName, (Route<dynamic> route) => false);
                            //
                            //
                            //     },
                            //   ),
                            // ),
                            //
                            // SizedBox(height: getProportionateScreenHeight(10)),
                          ],


                        ),

                      ),
                    ),
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1 ?
                  StepState.complete : StepState.disabled,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

}
