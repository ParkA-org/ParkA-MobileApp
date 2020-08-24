import "package:flutter/material.dart";

class WavyClipper extends StatelessWidget {
  final Widget child;
  final String type;

  const WavyClipper.withTopWave(
      {@required this.child, this.type = "TopWaveClipper"});

  const WavyClipper.withBottomWave(
      {@required this.child, this.type = "BottomWaveClipper"});

  @override
  Widget build(BuildContext context) {
    CustomClipper selectedClipper;
    switch (type) {
      case 'TopWaveClipper':
        selectedClipper = TopWaveClipper();
        break;
      case 'BottomWaveClipper':
        selectedClipper = BottomWaveClipper();
        break;
      default:
        selectedClipper = TopWaveClipper();
        break;
    }

    return ClipPath(
      child: this.child,
      clipper: selectedClipper,
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 400;
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

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 700;
    path.lineTo(0 * _xScaling, -3 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      -3 * _yScaling,
      381 * _xScaling,
      -3 * _yScaling,
      381 * _xScaling,
      -3 * _yScaling,
    );
    path.cubicTo(
      381 * _xScaling,
      254.746 * _yScaling,
      381 * _xScaling,
      399.254 * _yScaling,
      381 * _xScaling,
      657 * _yScaling,
    );
    path.cubicTo(
      213.548 * _xScaling,
      710.324 * _yScaling,
      68.3344 * _xScaling,
      567.571 * _yScaling,
      0 * _xScaling,
      657 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      657 * _yScaling,
      0 * _xScaling,
      -3 * _yScaling,
      0 * _xScaling,
      -3 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      -3 * _yScaling,
      0 * _xScaling,
      -3 * _yScaling,
      0 * _xScaling,
      -3 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
