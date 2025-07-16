import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/constants.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
import 'package:JDPoolsApplication/size_config.dart';
import 'package:JDPoolsApplication/screens/home/home_screen.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  bool _checkbox = false;
  bool _checkboxListTile = false;
  List<Map<String, String>> splashData = [
    {
      "text": "JDPOOLS1",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "JDPOOLS2",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "JDPOOLS3",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text("Agree",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),
            Container(
              width: SizeConfig.screenWidth*0.9,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              color: bgColor,

              child: Column(
                children: [
                  Text(" aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      "bbbbbbbbbbbbbbbbbbbbbbbbbbb    cccccccccccccccccccc",style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
                  Text(" aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      "bbbbbbbbbbbbbbbbbbbbbbbbbbb    cccccccccccccccccccc",style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
                ],
              ),


            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('I am true'),
              value: _checkbox,
              onChanged: (value) {
                setState(() {
                  _checkbox = !_checkbox;
                });
              },
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

              child: Text("press check",style: TextStyle(color: Colors.red), textAlign: TextAlign.left),



            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),

                    Spacer(flex: 3),

                    RaisedButton(
                      onPressed: _checkbox == false ? null : disableButton,
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text('Click Here To Disable Button'),
                    ),
                    DefaultButton(
                      text: "Confirm",
                      press:
                        // Navigator.pushNamed(context, SignInScreen.routeName);
                        _checkbox == false ? null : disableButton,
                        // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);


                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  disableButton() {
    setState(() {
      // _checkbox = false;
      Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
    });
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
