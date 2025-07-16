import 'package:flutter/material.dart';

<<<<<<< HEAD
import '../../../../size_config.dart';
=======
import '../../../size_config.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        // GestureDetector(
        //   onTap: press,
        //   child: Text(
        //     "See More",
        //     style: TextStyle(color: Color(0xFFBBBBBB)),
        //   ),
        // ),
      ],
    );
  }
}
