import 'package:flutter/material.dart';

class CarouselItem extends StatefulWidget {
  final int index;
  final PageController pageController;
  final AnimationController animationController;
  final Widget customCardWidget;
  final double cardHeight;
  final double cardWidth;
  CarouselItem(this.index, this.pageController, this.animationController, this.customCardWidget, this.cardHeight, this.cardWidth);

  @override
  _CarouselItemState createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> with TickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      child: widget.customCardWidget,
      builder: (context, child){
        double value = 1.0;
        if(widget.pageController.position.haveDimensions){
          value = widget.pageController.page - widget.index;
          value = ( 1 - (value.abs() * .40)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * widget.cardHeight,
            width: widget.cardWidth,
            child: child,
          ),
        );
      }
    );
  }
}