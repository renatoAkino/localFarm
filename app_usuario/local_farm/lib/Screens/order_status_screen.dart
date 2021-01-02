import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:localfarm/widgets/status_progress_widget.dart';

class OrderStatuScreen extends StatelessWidget {
  //
  CarouselSlider carouselSlider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StatusProgressWidget(
        //index de 0 à 4
        index: 2,
      ),
    );
  }
}
