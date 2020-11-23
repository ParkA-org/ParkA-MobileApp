import 'package:ParkA/components/Buttons/round_button.dart';
import 'package:ParkA/components/place-holders/no_image_placeholder.dart';
import 'package:ParkA/components/rating/star_rating.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/pages/parking-detail/parking_detail_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParkingDetailModal extends StatelessWidget {
  final Parking parking;

  ParkingDetailModal({Key key, @required this.parking}) : super(key: key);

  List<Widget> _pictureGalleryBuilder(List<String> pictures) {
    if (!pictures.contains(parking.mainPicture)) {
      pictures.insert(0, parking.mainPicture);
    }
    List<Widget> imageGallery = new List();
    pictures.forEach((picture) {
      imageGallery.add(Padding(
        padding: const EdgeInsets.all(12.0),
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
      ));
    });

    return imageGallery;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.65,
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
                    height: 40,
                    child: Row(
                      children: [
                        RoundedButton(
                          hasShadow: true,
                          hasIcon: true,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Color(0xFF949494),
                  ),
                  Text("${parking.perHourPrice}" r" RD$ por hora",
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
                          ? _pictureGalleryBuilder(parking.pictures)
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
