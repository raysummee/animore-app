import 'dart:async';
import 'dart:ui';

import 'package:animore/logic/provider/landingPageCarouselNotify.dart';
import 'package:animore/ux/components/complex/carousel/carouselIndicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarouselLanding extends StatefulWidget {
  @override
  _CarouselLandingState createState() => _CarouselLandingState();
}

class _CarouselLandingState extends State<CarouselLanding>{
  int indexPage;
  PageController _pageController;
  final Map<String, dynamic> landing = {
    "landing":[
      {
        "image": "lib/assets/images/dog_bone.png",
        "title": "Animore",
        "desc": "Take care of your pets with ease using Animore's various modules"
      },
      {
        "image": "lib/assets/images/dog_food.png",
        "title": "Food Diet",
        "desc": "Trouble following your pet's diet, Animore will help you on this!"
      },
    ]
  };

  @override
  void initState() {
    super.initState();
    indexPage = 0;
    _pageController = PageController(
      initialPage: 0,
    );
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if(_pageController.hasClients&&_pageController.position.hasContentDimensions)
      if (indexPage < (landing['landing'] as List).length-1) {
        _pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
        indexPage++;
      } else {
        _pageController.animateToPage(0, duration: Duration(milliseconds: 600), curve: Curves.decelerate);
        indexPage = 0;
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LandingPageCarouselNotify>(context);
    return Container(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: (page){
                provider.index = page;
              },
              itemBuilder: (context, index) => Container(
                child: Column(
                  children: [
                     SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(landing['landing'][index]['image'], fit: BoxFit.contain,)
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      landing['landing'][index]['title'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(60, 0, 55, 0),
                      child: Text(
                        landing['landing'][index]['desc'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              itemCount: (landing['landing'] as List).length,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          CarouselIndicator((landing['landing'] as List).length)

        ],
      ),
    );
  }
}