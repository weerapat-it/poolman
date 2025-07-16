import 'package:flutter/material.dart';

import '../../../constants.dart';

// We need satefull widget for our categories

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
<<<<<<< HEAD
  List<String> categories = ["product1", "product2", "product3", "product4"];
=======
  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
<<<<<<< HEAD
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 30,
=======
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
<<<<<<< HEAD
        padding: const EdgeInsets.symmetric(horizontal: 20),
=======
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
<<<<<<< HEAD
                color: selectedIndex == index ? kTextColor : Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20 / 4), //top padding 5
=======
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
