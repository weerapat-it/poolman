import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/custom_surfix_icon.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/components/form_error.dart';
import 'package:JDPoolsApplication/screens/complete_profile/complete_profile_screen.dart';
import '../../../screens/bloc/bloc.dart';
import '../../../screens/page/Gmap_page.dart';
import '../../../screens/page/main_gmap.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
class RatingStatus extends StatefulWidget {
  final String value;

  const RatingStatus({Key key, @required this.value}) : super(key: key);

  @override
  _RatingStatusState createState() => _RatingStatusState();
}

class _RatingStatusState extends State<RatingStatus> {
  var userId;
  void initState() {
    InsertMethod();
  }
  List data = [];

  var kPrimaryColorGreen = Color(0xFFd6df21);
  InsertMethod()async{

    userId = "${await FlutterSession().get("userId")}";
    print("userId" + userId);
    var url = Uri.https('jdpoolswebservice.com', '/spintest/cal_spintest.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/cal_spintest.php";
    var res = await http.post(url,headers:{"Accept" : "application/json"},
        body: {
          // "customer":_dropDownValue,
          "userid":userId,
          "data" : widget.value,
        }
    );
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
      if(data[0] == "PROBLEMS"){

        kPrimaryColorGreen = Color(0xffff0000);
      }else{

        kPrimaryColorGreen = Color(0xFFd6df21);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              color: kPrimaryColorGreen, //define the background color

              child: Text((data?.length > 0 ? data[0] : ''),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),

          ],

        ),

    );
  }

}
