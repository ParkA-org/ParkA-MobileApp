import 'package:ParkA/components/rating/star_rating.dart';
import 'package:ParkA/data/data-models/review/review_data_model.dart';
import 'package:ParkA/pages/profile/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import '../profile_page.dart';

class ParkaReviewHistoryTile extends StatelessWidget {
  final Review review;

  const ParkaReviewHistoryTile({
    Key key,
    @required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double tileHeight = constraints.maxWidth / 2.5;
        final double imageContainerSize =
            (constraints.maxHeight < constraints.maxWidth
                    ? constraints.maxHeight
                    : constraints.maxWidth) /
                6;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProfileScreen(userId: this.review.user.id),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4.0),
            height: tileHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        margin: EdgeInsets.only(right: 8.0),
                        width: imageContainerSize,
                        height: imageContainerSize,
                        child: ParkaCircleAvatarWidget(
                          pictureSizeDivider: 2.0,
                          imageUrl: this.review.user.profilePicture,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "${this.review.user.name} ${this.review.user.lastName}",
                            style: kParkaButtonTextStyle.copyWith(
                              fontSize: 22.0,
                            ),
                          ),
                          StarRating(
                            rating: this.review.calification.toInt(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    this.review.review,
                    style: kParkaInputTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: Color(0xFF949494),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
