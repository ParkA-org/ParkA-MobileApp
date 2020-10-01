import 'package:flutter/material.dart';

const parkaCircleAvatarWidgetDefaultBoxStyle = BoxDecoration(
  shape: BoxShape.circle,
);

class ParkaCircleAvatarWidget extends StatelessWidget {
  final double pictureSizeDivider;
  final String imageUrl;

  const ParkaCircleAvatarWidget({
    Key key,
    this.imageUrl,
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
          child: this.imageUrl == null
              ? Icon(
                  Icons.account_circle,
                  size: circleAvatarSize,
                  color: Colors.white,
                )
              : Container(),
          decoration: this.imageUrl == null
              ? parkaCircleAvatarWidgetDefaultBoxStyle
              : parkaCircleAvatarWidgetDefaultBoxStyle.copyWith(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      this.imageUrl,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
