import 'package:ParkA/pages/ProfilePage/components/parka_circle_avatar_widget.dart';
import "package:flutter/material.dart";
import "package:ParkA/components/Utils/styles/text.dart";

class ProfilePersonalInformationWidget extends StatelessWidget {
  final Color color;

  const ProfilePersonalInformationWidget({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: ParkaCircleAvatarWidget(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  //TODO: Substitute with resizable text
                  child: Text(
                    "Sebastiano Faiella",
                    style: kParkaInputDefaultSyle.copyWith(color: this.color),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: this.color,
                    ),
                    Text(
                      "Santo Domingo",
                      style: kParkaInputDefaultSyle.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                      ),
                    ),
                    VerticalDivider(
                      thickness: 1.0,
                      color: Color(0xFF949494),
                    ),
                    Icon(
                      Icons.star,
                      color: this.color,
                    ),
                    Text(
                      "4.20",
                      style: kParkaInputDefaultSyle.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
