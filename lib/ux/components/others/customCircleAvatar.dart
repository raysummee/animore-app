import 'dart:math';

import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatefulWidget {
  final NetworkImage image;
  final String fallbackString;
  CustomCircleAvatar({@required this.image, this.fallbackString:""});
  @override
  _CustomCircleAvatarState createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  bool _checkLoading = true;

  @override
  void initState() {
    ImageStreamListener listener = ImageStreamListener(_setImage, onError: _setError);
    widget.image.resolve(new ImageConfiguration()).addListener(listener);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return _checkLoading == true ? 
      CircleAvatar(
        child: Text(
          widget.fallbackString, 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
          ),
        ),
      ):
      CircleAvatar(backgroundImage: widget.image,);
  }

  void _setImage(ImageInfo image, bool sync) {
    setState(() => _checkLoading = false);
  }

  void _setError(dynamic dyn, StackTrace st) {
    setState(() => _checkLoading = true);
  }
}