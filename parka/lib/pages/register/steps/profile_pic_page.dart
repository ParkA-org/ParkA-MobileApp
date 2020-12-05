import 'dart:io';
import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/controllers/register-user-form/register_user_controller.dart';
import 'package:ParkA/pages/register/steps/user_information_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/functions/pick_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfilePicturePage extends StatelessWidget {
  static const String routeName = "/ProfilePicturePage";
  final RegisterUSerController _registerUSerController =
      Get.find<RegisterUSerController>();

  Future setImage() async {
    final _imagePath = await getImageFunction();
    _registerUSerController.setProfilePicture(_imagePath);
  }

  void nextStep(bool _omit) {
    if (!_omit) {
      Get.snackbar(
        "Error",
        "Agrega una imagen",
        margin: EdgeInsets.all(8.0),
        backgroundColor: ParkaColors.parkaGoogleRed,
      );
      return;
    }

    Get.toNamed(UserInformationPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          height: screenSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Back Button
              Expanded(
                flex: 0,
                child: ParkaHeader(
                  color: ParkaColors.parkaGreen,
                ),
              ),
              //Title of the page
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Imagen De Perfil",
                    textAlign: TextAlign.center,
                    style: kParkaPageTitleTextStyle,
                  ),
                ),
              ),
              // Image container
              Expanded(
                flex: 3,
                child: Obx(
                  () => Container(
                    child: GestureDetector(
                      onTap: () => setImage(),
                      child: _registerUSerController
                                  .createUserDto.profilePicture !=
                              null
                          ? Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black38),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(1.0, 15.0),
                                        blurRadius: 10.0,
                                        color: Colors.grey[700])
                                  ],
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(File(
                                        _registerUSerController
                                            .createUserDto.profilePicture)),
                                  ),
                                ),
                              ),
                            )
                          : SvgPicture.asset(
                              'resources/images/BlueProfileIcon.svg',
                              height: screenSize.height * 0.4,
                            ),
                    ),
                    height: screenSize.height * 0.4,
                  ),
                ),
              ),
              // Buttons
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF0B768C),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TransparentButton(
                        label: "Continuar",
                        color: Colors.white,
                        buttonTextStyle: kParkaBigButtonTextStyle,
                        trailingIconData: Icons.arrow_forward_ios,
                        onTapHandler: () {
                          this.nextStep(false);
                        },
                      ),
                      TransparentButton(
                        label: "Omitir",
                        color: ParkaColors.parkaLightGreen,
                        buttonTextStyle: kParkaBigButtonTextStyle.copyWith(
                          color: ParkaColors.parkaLimeGreen,
                        ),
                        onTapHandler: () {
                          this.nextStep(true);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
