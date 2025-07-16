import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/rounded_icon_btn.dart';
import 'package:JDPoolsApplication/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget  {
  const ColorDots({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;
  @override
  _ColorDots createState() => new _ColorDots();

}
class _ColorDots extends State<ColorDots> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          MyStatefulWidget(),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              setState(() {
                qty = qty >0? qty-1:qty;
              });
            },
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Text(
            "$qty",
            style: Theme.of(context).textTheme.headline6,
          ),

          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              setState(() {
                qty = qty+1;
              });
            },
          ),

        ],

      ),

    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    @required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropDownValue= '100g';
  //
  // String get size_product => _dropDownValue.text.toString();
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropDownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: kPrimaryColor2),
      underline: Container(
        height: 2,
        color: kPrimaryColor2,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropDownValue = newValue;
        });
      },
      items: <String>['100g', '500g', '1000g']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );


  }
}

