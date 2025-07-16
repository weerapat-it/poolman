import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:JDPoolsApplication/screens/profile/complete_profile/complete_profile_screen.dart';
import 'package:JDPoolsApplication/screens/edit_profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import 'package:JDPoolsApplication/enums.dart';

import 'package:JDPoolsApplication/screens/home/components/icon_btn_with_counter.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'components/custom_app_bar.dart';
import 'package:flutter_session/flutter_session.dart';
class ProfileScreen extends StatefulWidget {
static String routeName = "/profile";
@override
_ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userId,tokenIds,status,userEmail,userFirst,userLast,user,permission,userTel;
  String tokenId;
  List data = [];
  @override
  void initState() {

    _getThingsOnStartup().then((value){
      check().then((result) {
        setState(() {
          status = result[2];
          if(status != '0' && status != "null"){
            // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
            // print(userId);

            // Navigator.pushNamed(context, CartScreen.routeName);
          }else{
            // guest();
            // Navigator.of(context).pushNamed( SignInScreen.routeName);
            // Navigator.pushNamed(context, CartScreen.routeName);

            Navigator.pushNamed(context, SignInScreen.routeName);
          }
        });

      });
    });
    super.initState();
  }
  Future check()  async {

    userEmail = "${await FlutterSession().get("userEmail")}";
    userId = "${await FlutterSession().get("userId")}";
    tokenIds = "${await FlutterSession().get("tokenId")}";
    status = "${await FlutterSession().get("status")}";
    userFirst = "${await FlutterSession().get("userFirstname")}";
    userLast = "${await FlutterSession().get("userLastname")}";
    permission = "${await FlutterSession().get("permission")}";
    userTel = "${await FlutterSession().get("userTel")}";

    user = userFirst.toString()+" "+userLast.toString();
    data.add(userId.toString());
    data.add(tokenIds.toString());
    data.add(status.toString());

    print(data);
    return data;
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     color: kwhite,
  //     child: Scaffold(
  //       appBar: PreferredSize(
  //         preferredSize: Size.fromHeight(63.0), // here the desired height
  //         child: buildAppBar(context),
  //
  //       ),
  //       backgroundColor: kwhite,
  //       body: Stack(
  //         children: <Widget>[
  //           Padding(
  //             padding: const EdgeInsets.only(bottom: 80.0),
  //             child: Body(),
  //           ),
  //           bottomBar(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      // appBar: buildAppBar(context),
      backgroundColor: kwhite,
      body: Stack(
        children: <Widget>[
          Container(
            height: 341,

            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              image: DecorationImage(
                  image: AssetImage("assets/images/bgjob.png"),
                  fit: BoxFit.cover),
            ),

            child: Padding(
              padding: const EdgeInsets.only(top: 54.0),
              child: Column(
                children: [

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
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

                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child:Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    "assets/icons/arrow-left.svg",
                                  ),
                                ),


                              ),
                            ),
                          ],
                        ),
                      ),




                    ],

                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,


                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child:Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              "assets/icons/user-circle.svg",
                              color: Colors.white,
                            ),
                          ),


                        ),
                      ),

                    ],

                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text.rich(

                        TextSpan(
                          text: "User name",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        textAlign: TextAlign.center,
                      ),



                    ],

                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text.rich(

                        TextSpan(
                          text: userFirst!="" ?user :"customer name",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        textAlign: TextAlign.center,
                      ),



                    ],

                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text.rich(

                        TextSpan(
                          text: "Tel.",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        textAlign: TextAlign.center,
                      ),



                    ],

                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text.rich(

                        TextSpan(
                          text: userTel!="" ?userTel :"Tel.",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        textAlign: TextAlign.center,
                      ),



                    ],

                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text.rich(

                        TextSpan(
                          text: "Permission",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        textAlign: TextAlign.center,
                      ),



                    ],

                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text.rich(

                        TextSpan(
                          text: permission!="" ?permission :"Permission",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        textAlign: TextAlign.center,
                      ),



                    ],

                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 340.0),
            child: Body(),
          ),
          bottomBar(),
        ],
      ),

    );
  }


Widget bottomBar() {
  return Column(
    children: <Widget>[
      const Expanded(
        child: SizedBox(),
      ),
      BottomBarView(selectedMenu: MenuState.profile),
    ],
  );
}
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryColor2,
    centerTitle: true,

    title:Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(

        children: [

          IconBtnWithCounter(
            svgSrc: "assets/icons/User Icon.svg",

            // numOfitem: 3,
            press: () =>
                check().then((result) {
                  print("result: "+result[0]+result[1]+result[2]);
                  setState(() {
                    status = result[2];
                    if(status != '0' && status != "null"){
                      // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                      // print(userId);

                      // Navigator.pushNamed(context, CartScreen.routeName);
                    }else{
                      // guest();
                      // Navigator.of(context).pushNamed( SignInScreen.routeName);
                      // Navigator.pushNamed(context, CartScreen.routeName);

                      Navigator.pushNamed(context, SignInScreen.routeName);
                    }
                  });

                }),
          ),
          status != '0' && status != "null"?
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              userEmail.toString(),style: TextStyle(fontSize: 14),

            ),
          ):Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Guest",style: TextStyle(fontSize: 14),

            ),
          ),
          status != '0' && status != "null"?
          new GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CompleteProfileEditScreen.routeName,arguments: SignUpArgumentsProfile(username:null,password: null));

              // Navigator.of(context).pushNamed( EditProfileScreen.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "edit >",style: TextStyle(fontSize: 14),

              ),
            ),
          )
          :Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "",style: TextStyle(fontSize: 14),

            ),
          ),
        ],
      ),
    ),

  );
}
  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 0));
  }
}