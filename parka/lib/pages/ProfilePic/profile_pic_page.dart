import 'dart:io';
import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/pages/ID/ID_page.dart';
import 'package:ParkA/pages/ProfilePic/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ProfilePicPage extends StatefulWidget {
  ProfilePicPage({Key key}) : super(key: key);
  Object arguments;
  static const String routeName = "/ProfilePicPage";

  @override
  _ProfilePicPageState createState() => _ProfilePicPageState();
}

class _ProfilePicPageState extends State<ProfilePicPage> {
  File _image;
  String _path;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final picker = ImagePicker();

    Map<String, dynamic> createAccount =
        ModalRoute.of(context).settings.arguments;
    Future getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      this._path = pickedFile.path;
      setState(() {
        _image = File(pickedFile.path);
      });
    }

    Future nextStep() async {
      print(this._path);
      createAccount["profilepage"]["pictures"] = this._path ?? "null";
      createAccount["countries"] = await getCountries();
      createAccount["typedocuments"] = await getTypeDocument();
      Navigator.pushNamed(
        context,
        IDPage.routeName,
        arguments: createAccount,
      );
    }

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
                child: Container(
                  child: GestureDetector(
                    onTap: () => getImage(),
                    child: _image != null
                        ? ClipOval(child: Image.file(_image))
                        : SvgPicture.asset(
                            'resources/images/BlueProfileIcon.svg',
                            height: screenSize.height * 0.4,
                          ),
                  ),
                  height: screenSize.height * 0.4,
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
                        onTapHandler: () async {
                          nextStep();
                        },
                      ),
                      TransparentButton(
                        label: "Omitir",
                        color: ParkaColors.parkaLightGreen,
                        buttonTextStyle: kParkaBigButtonTextStyle.copyWith(
                          color: ParkaColors.parkaLimeGreen,
                        ),
                        onTapHandler: () async {
                          nextStep();
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
