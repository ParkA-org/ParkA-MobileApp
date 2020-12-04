import 'package:ParkA/components/inputs/parka_input_test.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/pages/profile/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({
    Key key,
    Parking parking,
    Reservation reservation,
  }) : super(key: key);

  @override
  _ReviewDialogState createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  int parkingVoteFilter = 4;
  String title;
  String review;
  bool type = false;

  void changeParkingVoteFilter(int vote) {
    setState(() {
      this.parkingVoteFilter = vote;
    });
  }

  List<Widget> _reviewStars() {
    List<Widget> ret = new List<Widget>();

    for (int i = 1; i <= 5; ++i) {
      IconData _icon =
          this.parkingVoteFilter >= i ? Icons.star : Icons.star_border;

      ret.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              this.changeParkingVoteFilter(i);
            },
            child: Icon(
              _icon,
              color: ParkaColors.parkaGreen,
              size: 40.0,
            ),
          ),
        ),
      );
    }

    setState(() {});

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: 470,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: AutoSizeText(
                  "La casa de colon",
                  maxLines: 1,
                  maxFontSize: 30,
                  minFontSize: 30,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff077187)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: ParkaCircleAvatarWidget(
                    imageUrl:
                        "https://parka-api-bucket-aws.s3.amazonaws.com/pp_857565fdc3.jfif",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _reviewStars(),
                  ),
                ),
              ),
              Expanded(
                child: AutoSizeText(
                  "Titulo",
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 22,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff077187)),
                ),
              ),
              Expanded(
                child: ParkaInputTest(enable_padding: true),
              ),
              Expanded(
                child: AutoSizeText(
                  "Comentario",
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 22,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff077187)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ParkaInputTest(
                    enable_padding: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: Color(0xff077187),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 20.0),
                        child: AutoSizeText(
                          "Enviar",
                          maxLines: 1,
                          maxFontSize: 20,
                          minFontSize: 20,
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
