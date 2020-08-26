import 'package:flutter/material.dart';

class ParkAPlaceholder extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final Color color;
  final Widget child;
  final Alignment childAlignment;

  const ParkAPlaceholder(
      {Key key,
      @required this.height,
      @required this.width,
      this.color,
      this.borderRadius,
      this.child,
      this.childAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      alignment: childAlignment ?? Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 5, offset: Offset(0, 10), color: Color(0x40000000))
          ],
          color: color ?? Color(0xFFD7D2D2),
          borderRadius: borderRadius ?? BorderRadius.circular(15)),
      child: child ?? null,
    );
  }
}
