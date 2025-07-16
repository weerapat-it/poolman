import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:JDPoolsApplication/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/enums.dart';
import '../../../size_config.dart';
import 'package:JDPoolsApplication/screens/cart/cart_screen.dart';
import 'package:JDPoolsApplication/screens/home/components/icon_btn_with_counter.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import '../../constants.dart';
import 'components/body.dart';

class shopScreen extends StatelessWidget {
  final String search;

  shopScreen({
    Key key,
    this.search
  }) : super(key: key);
  static String routeName = "/shopScreen";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(63.0), // here the desired height
    child: buildAppBar(context),

        ),
        backgroundColor: kwhite,
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Body(search: search),
            ),
            bottomBar(),
          ],
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(selectedMenu: MenuState.shop),

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchField(search :search),
            Text(
                "Shop",style: TextStyle(color: kPrimaryColor)

            ),
            IconBtnWithCounter(
              svgSrc: "assets/icons/Cart Icon.svg",
              press: () =>
              // check().then((result) {
              //   print("result: "+result[0]+result[1]+result[2]);
              //   setState(() {
              //     status = result[2];
              //     if(status != 0 && status != null){
              //       // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
              //       // print(userId);
              //
              //       Navigator.pushNamed(context, CartScreen.routeName);
              //     }else{
              //       // guest();
              //       // Navigator.of(context).pushNamed( SignInScreen.routeName);
              Navigator.pushNamed(context, CartScreen.routeName),
              //     }
              //   });
              //
              // }),
              // Navigator.pushNamed(context, CartScreen.routeName),
            ),
            // Text(
            //   "${demoCarts.length} items",
            //   style: Theme.of(context).textTheme.caption,
            // ),
          ],
        ),
      ),

    );
  }
}
