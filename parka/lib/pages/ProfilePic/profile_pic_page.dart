import 'dart:io';

import 'package:ParkA/components/Buttons/transparent_button_test.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicPage extends StatefulWidget {
  ProfilePicPage({Key key}) : super(key: key);

  static const String routeName = "/ProfilePicPage";

  @override
  _ProfilePicPageState createState() => _ProfilePicPageState();
}

class _ProfilePicPageState extends State<ProfilePicPage> {
  File _image;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final picker = ImagePicker();

    Future getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        _image = File(pickedFile.path);
      });
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
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: TransparentButtonWithIcon(
                        label: "Atras",
                        color: Color(0xFF0B768C),
                      )),
                  //Title of the page
                  const Center(
                      child: const Text(
                    "Imagen De Perfil",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B768C)),
                  )),
                  // Image container
                  Container(
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
                  // Buttons
                  WavyClipper.withTopWave(
                    type: 'IDPage',
                    child: Container(
                        width: screenSize.width,
                        color: Color(0xFF0B768C),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: screenSize.height * 0.075),
                            const Text(
                              "Continuar ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: screenSize.height * 0.05),
                            const Text(
                              "Omitir ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF63C7B2)),
                            ),
                            SizedBox(height: screenSize.height * 0.075),
                          ],
                        )),
                  )
                ]),
          ),
        ));
  }
}
