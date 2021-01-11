import 'package:ParkA/data/data-models/user/user_data_model.dart';
import 'package:ParkA/pages/profile/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/pages/profile/profile_page.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/functions/get_user_rating.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";

class OtherUserProfilePersonalInformationWidget extends StatelessWidget {
  final Color color;

  final User user;

  OtherUserProfilePersonalInformationWidget({
    Key key,
    this.color,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(user.profilePicture);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(
              userId: this.user.id,
            ),
          ),
        );
      },
      child: Container(
        height: 50.0,
        margin: EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            ParkaCircleAvatarWidget(
              imageUrl: user.profilePicture,
            ),
            Container(
              padding: EdgeInsets.only(left: 8.0),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    '${user.name} ${user.lastName}',
                    maxLines: 1,
                    minFontSize: 14.0,
                    style: this.color == null
                        ? kParkaTextStyleBlack16
                        : kParkaTextStyleBlack16.copyWith(
                            color: this.color,
                          ),
                  ),
                  Row(
                    children: [
                      AutoSizeText(
                        "${userRating(this.user)} ",
                        maxLines: 1,
                        minFontSize: 14.0,
                        style: this.color == null
                            ? kParkaTextStyleBlack16
                            : kParkaTextStyleBlack16.copyWith(
                                color: this.color,
                              ),
                      ),
                      Icon(
                        Icons.star,
                        size: 14.0,
                        color: this.color == null ? Colors.black : this.color,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
