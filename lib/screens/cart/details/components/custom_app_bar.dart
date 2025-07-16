import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

<<<<<<< HEAD
import '../../../../size_config.dart';
=======
import '../../../size_config.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

class CustomAppBar extends PreferredSize {
  // final double rating;
  //
  // CustomAppBar({@required this.rating});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                color: Colors.white,
                padding: EdgeInsets.zero,
                onPressed: () =>
                    // Navigator.popUntil(context, ModalRoute.withName('/home')),
<<<<<<< HEAD
                    // Navigator.pop(context),

                  Navigator.of(context).pop('1'),

=======
                    Navigator.pop(context),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                child: SvgPicture.asset(
                  "assets/icons/Back ICon.svg",
                  height: 15,
                ),
              ),
            ),
            Spacer(),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(14),
            //   ),
            //   // child: Row(
            //   //   children: [
            //   //     Text(
            //   //       "$rating",
            //   //       style: const TextStyle(
            //   //         fontSize: 14,
            //   //         fontWeight: FontWeight.w600,
            //   //       ),
            //   //     ),
            //   //     const SizedBox(width: 5),
            //   //     SvgPicture.asset("assets/icons/Star Icon.svg"),
            //   //   ],
            //   // ),
            // )
          ],
        ),
      ),
    );
  }
}
