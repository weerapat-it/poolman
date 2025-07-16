import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/job/models/Cart.dart';

import 'package:JDPoolsApplication/screens/check_list/check_list_screen.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'package:http/http.dart' as http;
class CartCard extends StatelessWidget {
   CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;
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
    return   GestureDetector(
        onTap: () {
      // Navigator.of(context).canPop();

          showLoaderDialog(context);
          print("aaaa :" + cart.product.job_id.toString());
          new Future.delayed(new Duration(seconds: 1), () async {
            Navigator.pop(context); //pop dialog

            Navigator.of(context).pushNamed( checkListScreen.routeName,arguments: jobListArguments(cart.product.job_id.toString(),cart.product.name.toString()));
          });
      // Navigator.of(context).pushNamed( checkListScreen.routeName,arguments: jobListArguments(value:cart.product.job_id.toString()));

        },

    child:Padding(
      padding: const EdgeInsets.only(bottom: 19.0),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xFF979797).withOpacity(
                    0.5),
                offset: const Offset(0, 0),
                blurRadius: 10.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              // SizedBox(
              //   width: 231,
              //   child: AspectRatio(
              //     aspectRatio: 0.88,
              //     child: Container(
              //       padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              //       decoration: BoxDecoration(
              //         color: Color(0xFFF5F6F9),
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       // child: Image.asset(cart.product.images[0]),
              //     ),
              //   ),
              // ),
              // SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.product.title,
                    style: TextStyle(color:kPrimaryColor2, fontSize: 16,fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 44,
                        child: SvgPicture.asset(
                              "assets/icons/iconprofilejob.svg",

                            ),
                          ),


                      SizedBox(width: 8),
                      Column(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "${cart.product.name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: Colors.black,fontSize: 14.0),
                              // children: [
                              //   TextSpan(
                              //       text: " x${cart.numOfItem}",
                              //       style: Theme.of(context).textTheme.bodyText1),
                              // ],
                            ),
                          ),
                          // Text.rich(
                          //   TextSpan(
                          //     text: "${cart.product.name}",
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.w600, color: Colors.black,fontSize: 14.0),
                          //     // children: [
                          //     //   TextSpan(
                          //     //       text: " x${cart.numOfItem}",
                          //     //       style: Theme.of(context).textTheme.bodyText1),
                          //     // ],
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 44,
                          child: SvgPicture.asset(
                            "assets/icons/iconaddressjob.svg",

                          ),
                         ),

                        SizedBox(width: 8),
                        Column(
                          children: [
                            SizedBox(
                              width: 150,
                              child:Text.rich(
                              TextSpan(
                                text: "${cart.product.address}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, color: kTextColor,fontSize: 14.0),
                                // children: [
                                //   TextSpan(
                                //       text: " x${cart.numOfItem}",
                                //       style: Theme.of(context).textTheme.bodyText1),
                                // ],
                              ),

                            ),
                            ),
                            // Text.rich(
                            //   TextSpan(
                            //     text: "${cart.product.address}",
                            //
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.w600, color: kTextColor,fontSize: 14.0),
                            //     // children: [
                            //     //   TextSpan(
                            //     //       text: " x${cart.numOfItem}",
                            //     //       style: Theme.of(context).textTheme.bodyText1),
                            //     // ],
                            //   ),
                            //
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 44,
                          child: SvgPicture.asset(
                            "assets/icons/icondatejob.svg",

                          ),
                        ),
                        SizedBox(width: 8),
                        Row(

                          children: [
                            Text.rich(
                              TextSpan(
                                text: "${cart.product.date}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, color: Colors.black,fontSize: 14.0),
                                // children: [
                                //   TextSpan(
                                //       text: " x${cart.numOfItem}",
                                //       style: Theme.of(context).textTheme.bodyText1),
                                // ],
                              ),
                            ),

                            // Text.rich(
                            //   TextSpan(
                            //     // text: "${cart.product.date}",
                            //     text: "time",
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.w600, color: Colors.black,fontSize: 14.0),
                            //     // children: [
                            //     //   TextSpan(
                            //     //       text: " x${cart.numOfItem}",
                            //     //       style: Theme.of(context).textTheme.bodyText1),
                            //     // ],
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Text.rich(
                  //   TextSpan(
                  //     text: "Tel : ${cart.product.tel}",
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w600, color: Colors.black),
                  //     // children: [
                  //     //   TextSpan(
                  //     //       text: " x${cart.numOfItem}",
                  //     //       style: Theme.of(context).textTheme.bodyText1),
                  //     // ],
                  //   ),
                  //
                  // ),

                ],
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}