import 'package:animated_card/animated_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  Images(this.images);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    print(Colors.amber);
    return AnimatedCard(
      child: Column(
        children: <Widget>[
          Text(
            'Images:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (_, i) => Card(
              child: FancyShimmerImage(
                imageUrl: images[i],
              ),
            ),
            options: CarouselOptions(
              aspectRatio: 1,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
        ],
      ),
    );
  }
}
