import 'package:flutter/material.dart';

//imported packages by dependencies
import 'package:carousel_pro/carousel_pro.dart';

class CarouselProImagesClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/carousel/malgudi_days.jpg'),
          AssetImage('images/carousel/one_hundred_years_of_solitude.jpg'),
          AssetImage('images/carousel/seto_dharti.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(seconds: 1),
        dotSize: 5.0,
        indicatorBgPadding: 5.0,
      ),
    );
  }
}
