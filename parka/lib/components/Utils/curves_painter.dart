import "package:flutter/material.dart";

class WavyHeaderImage extends StatelessWidget {
  final Widget child;
  final String type;

  WavyHeaderImage({this.child, this.type});

  @override
  Widget build(BuildContext context) {
    CustomClipper selectedClipper;

    switch (this.type) {
      case 'MainLogin':
        selectedClipper = BottomWaveClipper();
        break;
      case 'EmailLogin':
        selectedClipper = BottomWaveClipper();
        break;

      case 'Registration':
        selectedClipper = BottomWaveClipper();
        break;
      case 'IDPage':
        selectedClipper = IDPageClipper();
        break;

      default:
        selectedClipper = BottomWaveClipper();
        break;
    }

    return ClipPath(
      child: this.child,
      clipper: selectedClipper,
    );
  }
}

class IDPageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 200;
    path.lineTo(0.0000228882 * _xScaling, 33.7588 * _yScaling);
    path.cubicTo(
      0.00000727075 * _xScaling,
      -61.5327 * _yScaling,
      375 * _xScaling,
      80.0496 * _yScaling,
      375 * _xScaling,
      33.7588 * _yScaling,
    );
    path.cubicTo(
      375 * _xScaling,
      -12.532 * _yScaling,
      375 * _xScaling,
      210 * _yScaling,
      375 * _xScaling,
      210 * _yScaling,
    );
    path.cubicTo(
      375 * _xScaling,
      210 * _yScaling,
      0 * _xScaling,
      210 * _yScaling,
      0 * _xScaling,
      210 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      210 * _yScaling,
      0.0000385056 * _xScaling,
      129.05 * _yScaling,
      0.0000228882 * _xScaling,
      33.7588 * _yScaling,
    );
    path.cubicTo(
      0.0000228882 * _xScaling,
      33.7588 * _yScaling,
      0.0000228882 * _xScaling,
      33.7588 * _yScaling,
      0.0000228882 * _xScaling,
      33.7588 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
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
