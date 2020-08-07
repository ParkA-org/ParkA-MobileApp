import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicPage extends StatefulWidget {
  ProfilePicPage({Key key}) : super(key: key);

  @override
  _ProfilePicPageState createState() => _ProfilePicPageState();
}

class _ProfilePicPageState extends State<ProfilePicPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    File _image;
    final picker = ImagePicker();

    Future getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        _image = File(pickedFile.path);
      });
    }

    return Scaffold(
        body: Container(
      height: screenSize.height,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
                    ? Image.file(_image)
                    : SvgPicture.asset(
                        'resources/images/BlueProfileIcon.svg',
                        height: screenSize.height * 0.4,
                      ),
              ),
              height: screenSize.height * 0.4,
            ),
            // Buttons
            Container(
                height: screenSize.height * 0.2,
                color: Colors.blue,
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Continuar ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ))
          ]),
    ));
  }
}
