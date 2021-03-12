import 'package:animore/logic/provider/landingPageCarouselNotify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarouselIndicator extends StatelessWidget {
  final int total;
  CarouselIndicator(this.total);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LandingPageCarouselNotify>(context);
    return Container(
      height: 8,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ClipOval(
            child: Container(
              color: provider.index == index? Colors.red: Colors.grey,
              height: 8,
              width: 8,
            ),
          ),
        ),
        itemCount: total,
      ),
    );
  }
}