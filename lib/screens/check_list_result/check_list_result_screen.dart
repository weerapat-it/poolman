import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../constants.dart';
import '../../models/Product.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class checkListResultScreen extends StatelessWidget {

  static String routeName = "/detailsResult";
  @override
  Widget build(BuildContext context) {
    final agrs =
        ModalRoute.of(context).settings.arguments as checklistresultArguments;

    return Scaffold(
      backgroundColor: kwhite,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/bgjob.png',

            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(

              child: Text.rich(

                TextSpan(
                  text: "Job Report",
                  style: TextStyle(fontSize: 26, color: Colors.white,fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Body(value: agrs.value),

     Padding(
            padding: const EdgeInsets.only(top: 750.0),
            child:  Container(
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text.rich(

                            TextSpan(
                              text: "Back to menu",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pop();
                                  }
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/Shape.svg",
                        ),
                      ],

                  ),
                ],
              ),
            ),

      ),

        ],
      ),


    );
  }
}

class checklistresultArguments {
  final String value;

  checklistresultArguments({@required this.value});
}
