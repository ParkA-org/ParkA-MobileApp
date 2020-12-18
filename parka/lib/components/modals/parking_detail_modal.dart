import 'package:ParkA/components/buttons/circle_button.dart';
import 'package:ParkA/components/images/image_page.dart';
import 'package:ParkA/components/place-holders/no_image_placeholder.dart';
import 'package:ParkA/components/rating/star_rating.dart';
import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/pages/create-reservation/create_reservation_page.dart';
import 'package:ParkA/pages/parking-detail/parking_detail_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ParkingDetailModal extends StatelessWidget {
  final Parking parking;
  final UserController _userController = Get.find<UserController>();

  ParkingDetailModal({Key key, @required this.parking}) : super(key: key);

  _launchMapsURL() async {
    String url =
        "https://www.google.com/maps/search/?api=1&query=${parking.latitude},${parking.longitude}";
    final String encodedURL = Uri.encodeFull(url);

    if (await canLaunch(encodedURL)) {
      await launch(encodedURL);
    } else {
      throw 'Could not launch URL';
    }
  }

  List<Widget> _pictureGalleryBuilder(
      List<String> pictures, BuildContext context) {
    if (!pictures.contains(parking.mainPicture)) {
      pictures.insert(0, parking.mainPicture);
    }
    List<Widget> imageGallery = new List();
    pictures.forEach((picture) {
      imageGallery.add(Padding(
        padding: const EdgeInsets.all(12.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ImagePage(picture)));
          },
          child: Container(
              width: 140,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1.0, 10.0),
                      blurRadius: 5.0,
                      color: Colors.grey[600])
                ],
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(picture)),
                borderRadius: BorderRadius.circular(15.0),
              )),
        ),
      ));
    });

    return imageGallery;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.75,
      builder: (context, scrollController) =>
          ListView(controller: scrollController, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${parking.parkingName}",
                      overflow: TextOverflow.clip,
                      style: kParkaTextStyleGrey.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      StarRating(rating: parking.rating.toInt()),
                      Text("(${parking.rating})",
                          style: kParkaTextStyleGrey.copyWith(
                              color: ParkaColors.parkaGreen))
                    ],
                  ),
                  ShowParkingFeaturesWidget(features: parking.features),
                  Divider(
                    thickness: 1.0,
                    color: Color(0xFF949494),
                  ),
                  SizedBox(
                    height: 90,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleButton(
                            onTap: () {
                              if (_userController.user.value == null) {
                                Get.snackbar(
                                  "Error",
                                  "Necesitas iniciar sesion para reservar",
                                  margin: EdgeInsets.all(8.0),
                                  backgroundColor: ParkaColors.parkaGoogleRed,
                                );

                                return;
                              } else if (_userController.user.value.id ==
                                  this.parking.user.id) {
                                Get.snackbar(
                                  "Error",
                                  "No puedes alquilar tu parqueo",
                                  margin: EdgeInsets.all(8.0),
                                  backgroundColor: ParkaColors.parkaGoogleRed,
                                );
                                return;
                              }

                              Get.to(
                                CreateParkingReservationPage(
                                  parkingId: this.parking.id,
                                ),
                              );
                            },
                          ),
                          CircleButton(
                            onTap: _launchMapsURL,
                            fillColor: Colors.white,
                            text: "Direcciones",
                            icon: Icon(
                              Icons.directions,
                              color: ParkaColors.parkaGreen,
                              size: 35,
                            ),
                          )
                        ]),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Color(0xFF949494),
                  ),
                  Text("${parking.priceHours}" r" RD$ por hora",
                      style: kParkaTextStyleGrey.copyWith(
                          color: ParkaColors.parkaGreen,
                          fontWeight: FontWeight.bold)),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: (parking.pictures != null &&
                                  parking.mainPicture != null) ||
                              (parking.pictures.isNotEmpty &&
                                  parking.mainPicture.isNotEmpty)
                          ? _pictureGalleryBuilder(parking.pictures, context)
                          : [NoImagePlaceholder()],
                    ),
                  )
                ]),
          ),
        ),
      ]),
    );
  }
}
