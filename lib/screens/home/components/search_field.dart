import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

import 'package:JDPoolsApplication/screens/shop/shop_screen.dart';
class SearchField extends StatelessWidget {
  final String search;

  SearchField({
    Key key,
    this.search
  }) : super(key: key);
  var txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: txt..text = search,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          // print("search");
          // Navigator.of(context).pushNamedAndRemoveUntil( shopScreen.routeName, (Route<dynamic> route) => false);
          Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => shopScreen(search : value != null?value:"")), (route) => false);
        },
        // onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
