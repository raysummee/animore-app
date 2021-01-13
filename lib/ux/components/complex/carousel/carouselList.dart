import 'package:animore/ux/components/complex/carousel/carouselItem.dart';
import 'package:flutter/material.dart';

class CarouselList extends StatefulWidget {
  @override
  _CarouselListState createState() => _CarouselListState();
}

class _CarouselListState extends State<CarouselList> with TickerProviderStateMixin{
  PageController _pageController;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 999,
      keepPage: false,
      viewportFraction: 0.7
    );
    animationController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 1),
    );
    animationController.forward();
    _pageController.addListener(() {
      animationController.repeat();
    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animationController.repeat();
  }
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    animationController.repeat();
    return Container(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index){
          
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselItem(
              index,
              _pageController,
              animationController,
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                    
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image(image: AssetImage("lib/assets/images/puppy.jpg"),fit: BoxFit.cover,),
                  ),
                ),
              ),
              200,
              260
            ),
          );
        }
      ),
    );
  }
}