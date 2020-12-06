import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/data/data-models/user/user_data_model.dart';
import 'package:ParkA/pages/profile/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class OtherUserProfilePersonalInformationWidget extends StatelessWidget {
  final UserController userController = Get.find();

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

    return Container(
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
            child: AutoSizeText(
              userController.user.value != null
                  ? '${user.name} ${user.lastName}'
                  : "Iniciar sesion",
              maxLines: 1,
              minFontSize: 14.0,
              style: kParkaTextStyleBlack16,
            ),
          )
        ],
      ),
    );
  }
}
