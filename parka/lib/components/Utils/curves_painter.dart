import "package:flutter/material.dart";

class WavyHeaderImage extends StatelessWidget {
  final Widget child;

  WavyHeaderImage({this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: this.child,
      clipper: BottomWaveClipper(),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 450;
    path.lineTo(0 * _xScaling, 17.9999 * _yScaling);
    path.cubicTo(
      114.477 * _xScaling,
      78.966 * _yScaling,
      270.744 * _xScaling,
      -42.7372 * _yScaling,
      375 * _xScaling,
      18.0001 * _yScaling,
    );
    path.cubicTo(
      375 * _xScaling,
      18.0001 * _yScaling,
      375 * _xScaling,
      516 * _yScaling,
      375 * _xScaling,
      516 * _yScaling,
    );
    path.cubicTo(
      375 * _xScaling,
      516 * _yScaling,
      0 * _xScaling,
      516 * _yScaling,
      0 * _xScaling,
      516 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      516 * _yScaling,
      0 * _xScaling,
      17.9999 * _yScaling,
      0 * _xScaling,
      17.9999 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      17.9999 * _yScaling,
      0 * _xScaling,
      17.9999 * _yScaling,
      0 * _xScaling,
      17.9999 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
