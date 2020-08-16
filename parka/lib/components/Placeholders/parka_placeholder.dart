import 'package:flutter/material.dart';

class ParkAPlaceholder extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final Color color;
  final Widget child;

  const ParkAPlaceholder(
      {Key key,
      @required this.height,
      @required this.width,
      this.color,
      this.borderRadius,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color ?? Color(0xFFD7D2D2),
          borderRadius: borderRadius ?? BorderRadius.circular(15)),
      child: child ?? null,
    );
  }
}
