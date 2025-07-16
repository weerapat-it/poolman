import 'package:JDPoolsApplication/screens/homepage_poolman.dart';
import 'package:JDPoolsApplication/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:JDPoolsApplication/screens/home/home_screen.dart';
import 'package:JDPoolsApplication/screens/history/history_screen.dart';
import 'package:JDPoolsApplication/screens/profile/profile_screen.dart';
import 'package:JDPoolsApplication/screens/home.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../../size_config.dart';
import '../constants.dart';
import '../enums.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  @override
  _CustomBottomNavBar createState() => _CustomBottomNavBar();
}

class _CustomBottomNavBar extends State<CustomBottomNavBar> {
  var userId,tokenIds,permission;

  Future check()  async {
    userId = await FlutterSession().get("userId");

    tokenIds = await FlutterSession().get("tokenId");

    permission = "${await FlutterSession().get("permission")}";
    print(tokenIds);
    return tokenIds;
  }
  // @override
  // void initState() {
  //   super.initState();
  //
  //   // WidgetsBinding.instance.addPostFrameCallback((_){
  //   //   check();
  //   check().then((result) {
  //     print("result: $result");
  //     setState(() {
  //       userId = result;
  //
  //     });
  //     if(userId != ''){
  //       Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
  //       // print(userId);
  //     }else{
  //
  //     }
  //   });
  //   //
  //   // });
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == widget.selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>

                    // Navigator.pushNamed(context, HomeScreen.routeName),
                Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false),

              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
                  color: MenuState.historyScreen == widget.selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,),
                onPressed: () =>

                    check().then((result) {
                      print("result: $result");
                      setState(() {
                        userId = result;
                        if(userId != ''&& userId != null){
                          // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                          // print(userId);
                          if(permission == "poolman") {
                            Navigator.of(context).pushNamedAndRemoveUntil( MyHomePagePoolman.routeName, (Route<dynamic> route) => false);
                          }else{
                            Navigator.of(context).pushNamedAndRemoveUntil( MyHomePageFirst.routeName, (Route<dynamic> route) => false);
                          }

                        }else{
                          Navigator.of(context).pushNamed( SignInScreen.routeName);
                        }
                      });

                    }),
                    // Navigator.pushNamed(context, MyHomePageFirst.routeName),
                // Navigator.of(context).pushNamedAndRemoveUntil( MyHomePageFirst.routeName, (Route<dynamic> route) => false),

              ),
        Container(
          // alignment: Alignment.center,s
          decoration: BoxDecoration(
            color: kSecondaryColor,
            gradient: LinearGradient(
                colors: [
                  kPrimaryColor,
                  kPrimaryColor,
                ],
                begin: Alignment.center,
                end: Alignment.center),
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: kSecondaryColor
                      .withOpacity(0.4),
                  offset: const Offset(5.0, 13.0),
                  blurRadius: 16.0),
            ],
          ),
          child: CircleAvatar(

                radius: 30,
                backgroundColor: kPrimaryColorbtn,
                child: IconButton(
                  icon: SvgPicture.asset("assets/icons/Camera Icon.svg",
                    color: MenuState.homeFirst == widget.selectedMenu
                        ? kwhite
                        : inActiveIconColor,),
                  onPressed: () {
                    check().then((result) {
                      print("result: $result");
                      setState(() {
                        tokenIds = result;
                        // if(userId != ''&& userId != null){
                        if(tokenIds != ''&& tokenIds != null){
                          // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                          // print(userId);
                          if(permission == "poolman") {
                            Navigator.of(context).pushNamedAndRemoveUntil( MyHomePagePoolman.routeName, (Route<dynamic> route) => false);
                          }else{
                            Navigator.of(context).pushNamedAndRemoveUntil( MyHomePageFirst.routeName, (Route<dynamic> route) => false);
                          }

                        }else{
                          Navigator.of(context).pushNamed( SignInScreen.routeName);
                        }
                      });

                    });
                  },
                ),

              ),
        ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/receipt.svg",
                  color: MenuState.historyPaymentScreen == widget.selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,),

                onPressed: () =>
                    check().then((result) {
                      print("result: $result");
                      setState(() {
                        userId = result;
                        if(userId != ''&& userId != null){
                          // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                          // print(userId);
                          Navigator.of(context).pushNamedAndRemoveUntil( historyScreen.routeName, (Route<dynamic> route) => false);
                        }else{
                          Navigator.of(context).pushNamed( SignInScreen.routeName);
                        }
                      });

                    }),
                // Navigator.pushNamed(context, ProfileScreen.routeName),
                // Navigator.of(context).pushNamedAndRemoveUntil( historyScreen.routeName, (Route<dynamic> route) => false),

              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Settings.svg",
                  color: MenuState.profile == widget.selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    check().then((result) {
                      print("result: $result");
                      setState(() {
                        userId = result;
                        if(userId != ''&& userId != null){
                          // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                          // print(userId);
                          Navigator.of(context).pushNamedAndRemoveUntil( ProfileScreen.routeName, (Route<dynamic> route) => false);
                        }else{
                          Navigator.of(context).pushNamed( SignInScreen.routeName);
                        }
                      });

                    }),
                    // Navigator.pushNamed(context, ProfileScreen.routeName),
                // Navigator.of(context).pushNamedAndRemoveUntil( ProfileScreen.routeName, (Route<dynamic> route) => false),

              ),
            ],
          )),
    );
  }
}
