import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/pages/profile/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class ProfileTabWidget extends StatelessWidget {
  const ProfileTabWidget({
    Key key,
    @required String name,
    @required Parking parking,
  })  : _parking = parking,
        _name = name,
        super(key: key);

  final String _name;
  // ignore: unused_field
  final Parking _parking;

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
          onTap: () {},
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: ParkaCircleAvatarWidget(
                    imageUrl:
                        "https://parka-api-bucket-aws.s3.amazonaws.com/pp_857565fdc3.jfif",
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
                          'David Bujosa',
                          style: kParkaTextStyleBlack18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Text(
                              '4.20 ',
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
        true != true
            ? Container()
            : InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "Contatar ",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Color(0xff077187),
                              fontSize: 17.0),
                        ),
                        Icon(
                          Icons.message,
                          color: Color(0xff077187),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
