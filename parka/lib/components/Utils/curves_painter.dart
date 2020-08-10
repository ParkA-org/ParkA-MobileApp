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
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 60);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
