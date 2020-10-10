import 'package:flutter/material.dart';

class ParkaCircleAvatarWidget extends StatelessWidget {
  final double pictureSizeDivider;

  const ParkaCircleAvatarWidget({
    Key key,
    this.pictureSizeDivider = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double circleAvatarSize =
            (constraints.maxHeight < constraints.maxWidth
                    ? constraints.maxHeight
                    : constraints.maxWidth) /
                this.pictureSizeDivider;

        return Container(
          width: circleAvatarSize,
          height: circleAvatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(3.0, 10.0),
                color: Colors.black38,
                blurRadius: 5.0,
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                'https://mangathrill.com/wp-content/uploads/2020/02/5432111-1.jpg',
              ),
            ),
          ),
        );
      },
    );
  }
}
