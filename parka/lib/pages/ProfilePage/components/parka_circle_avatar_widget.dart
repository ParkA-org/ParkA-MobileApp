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
            image: DecorationImage(
              fit: BoxFit.fill,
              //TODO: sustitute with fade in Image
              image: NetworkImage(
                'http://www.naviearmatori.net/albums/userpics/10187/DSCF5546.JPG',
              ),
            ),
          ),
        );
      },
    );
  }
}
