import 'package:flutter/material.dart';

class LoginShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0.0, size.height);
    
    // var firstEndPoint = Offset(size.width, size.height / .5);
    // var contentEndPoint = Offset(size.width - 50.0, size.height * 0.25);

    // path.relativeQuadraticBezierTo(contentEndPoint.dy, contentEndPoint.dx, firstEndPoint.dx, firstEndPoint.dy);

    var endPoint = Offset(size.width, size.height - 80.0);
    var ontentEndPoint = Offset(size.width * 0.75, size.height - 50.0);
    
    path.quadraticBezierTo(ontentEndPoint.dx, ontentEndPoint.dy, endPoint.dx, endPoint.dy);

    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
  
}