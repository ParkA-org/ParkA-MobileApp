import 'package:ParkA/data/data-models/user/user_data_model.dart';
import 'package:ParkA/pages/profile/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/pages/profile/profile_page.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/functions/get_user_rating.dart';
import 'package:flutter/material.dart';

class ProfileTabWidget extends StatelessWidget {
  const ProfileTabWidget({
    Key key,
    @required String name,
    @required User user,
  })  : _user = user,
        _name = name,
        super(key: key);

  final String _name;
  final User _user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            this._name,
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(
                  userId: this._user.id,
                ),
              ),
            );
          },
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: ParkaCircleAvatarWidget(
                    imageUrl: this._user.profilePicture != null
                        ? this._user.profilePicture
                        : "https://parka-api-bucket-aws.s3.amazonaws.com/avatars_000437232558_yuo0mv_t500x500_de6a11e027.jpg",
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          this._user.name + " " + this._user.lastName,
                          style: kParkaTextStyleBlack18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Text(
                              userRating(this._user).toString(),
                              style: kParkaTextStyleBlack18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // true != true
        //     ? Container()
        //     // : InkWell(
        //     //     onTap: () {},
        //     //     child: Padding(
        //     //       padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
        //     //       child: Container(
        //     //         child: Row(
        //     //           children: [
        //     //             Text(
        //     //               "Contatar ",
        //     //               style: TextStyle(
        //     //                   fontFamily: "Montserrat",
        //     //                   color: Color(0xff077187),
        //     //                   fontSize: 17.0),
        //     //             ),
        //     //             Icon(
        //     //               Icons.message,
        //     //               color: Color(0xff077187),
        //     //             ),
        //     //           ],
        //     //         ),
        //     //       ),
        //     //     ),
        //     //   ),
      ],
    );
  }
}
