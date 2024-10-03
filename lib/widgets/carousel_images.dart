import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, right: 8, left: 8),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 250,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: true,
        ),
        items: [
          SizedBox(
            child: Image.asset('lib/Asset/image/ADDD6.jpg'),
          ),
          SizedBox(
            child: Image.asset('lib/Asset/image/ADDD2.jpg'),
          ),
          SizedBox(
            child: Image.asset('lib/Asset/image/ADDD3.jpg'),
          ),
          SizedBox(
            child: Image.asset('lib/Asset/image/ADDD5.jpg'),
          ),
        ],
      ),
    );
  }
}
