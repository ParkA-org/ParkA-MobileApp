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
    final double _yScaling = size.height / 290;
    path.lineTo(-0.480675 * _xScaling, -10 * _yScaling);
    path.cubicTo(
      146.154 * _xScaling,
      -10 * _yScaling,
      228.366 * _xScaling,
      -10 * _yScaling,
      375 * _xScaling,
      -10 * _yScaling,
    );
    path.cubicTo(
      375 * _xScaling,
      -10 * _yScaling,
      375 * _xScaling,
      146.809 * _yScaling,
      375 * _xScaling,
      248.172 * _yScaling,
    );
    path.cubicTo(
      375 * _xScaling,
      349.535 * _yScaling,
      0.687807 * _xScaling,
      227.675 * _yScaling,
      -0.480675 * _xScaling,
      248.172 * _yScaling,
    );
    path.cubicTo(
      -1.64916 * _xScaling,
      268.669 * _yScaling,
      -0.480675 * _xScaling,
      -10 * _yScaling,
      -0.480675 * _xScaling,
      -10 * _yScaling,
    );
    path.cubicTo(
      -0.480675 * _xScaling,
      -10 * _yScaling,
      -0.480675 * _xScaling,
      -10 * _yScaling,
      -0.480675 * _xScaling,
      -10 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
