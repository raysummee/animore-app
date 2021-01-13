import 'dart:math';

import 'package:animore/ux/components/complex/wave/waveClipper.dart';
import 'package:flutter/material.dart';

class WaveBody extends StatefulWidget {
  final Size size;
  final int xOffset;
  final int yOffset;
  final Color color;
  WaveBody({
    @required this.size,
    this.xOffset:0,
    this.color,
    this.yOffset:0
  });

  @override
  _WaveBodyState createState() => _WaveBodyState();
}

class _WaveBodyState extends State<WaveBody> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Offset> animList1=[];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );
    _controller.addListener(() {
      animList1.clear();
      for(int i = -2 - widget.xOffset; i<= widget.size.width.toInt() + 2; i++){
        animList1.add(new Offset(i.toDouble() + widget.xOffset, sin((_controller.value * 360 - i ) % 360 * pi/180)* 20+ 50 + widget.yOffset));
      }
    });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: AnimatedBuilder(
        animation: CurvedAnimation(
          parent: _controller, 
          curve: Curves.easeInOut
        ), 
        builder: (context, child){
          return ClipPath(
            child: Container(
              width: widget.size.width,
              height: widget.size.height,
              color: widget.color,
            ),
            clipper: WaveClipper(
              animation: _controller.value,
              waveList1: animList1
            ),
          );
        }
      ),
    );
  }
}