import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class Slideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Container(
        height: 150,
        width: 350,
        child:Swiper(

      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "https://images.unsplash.com/photo-1595445364671-15205e6c380c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=764&q=80",
          fit: BoxFit.fitHeight,
        );

      },
      itemCount: 10,
      viewportFraction: 0.7,
      scale: 0.9,
    ),
    );
  }
}

