import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/data/data-models/review/review_data_model.dart';
import 'package:ParkA/pages/profile/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ShowReview extends StatefulWidget {
  const ShowReview({
    Key key,
    @required Reservation reservation,
    @required Review review,
  })  : _reservation = reservation,
        _review = review,
        super(key: key);

  final Reservation _reservation;
  final Review _review;

  @override
  _ShowReviewState createState() => _ShowReviewState();
}

class _ShowReviewState extends State<ShowReview> {
  int parkingVoteFilter = 4;
  String title;
  String review;
  String parkingId;
  String reservationId;
  String picture;
  String parkingName;
  bool type = false;

  void initState() {
    super.initState();
    this.parkingId = this.widget._reservation.parking.id;
    this.reservationId = this.widget._reservation.id;
    this.picture = this.widget._reservation.parking.mainPicture;
    this.parkingName = this.widget._reservation.parking.parkingName;
    this.review = this.widget._review.review;
    this.title = this.widget._review.title;
    this.parkingVoteFilter = (this.widget._review.calification).round();
  }

  void changeReview(value) {
    setState(() {
      this.review = value;
    });
  }

  void changeTitle(value) {
    setState(() {
      this.title = value;
    });
  }

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
        height: 570,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 2.0),
                child: AutoSizeText(
                  this.parkingName,
                  maxLines: 1,
                  maxFontSize: 30,
                  minFontSize: 25,
                  overflow: TextOverflow.ellipsis,
                  locale: Locale.fromSubtags(),
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
                    imageUrl: this.picture,
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
                child: AutoSizeText(
                  this.title,
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 22,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
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
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListView(
                    children: [
                      AutoSizeText(
                        this.review,
                        maxFontSize: 24,
                        minFontSize: 22,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
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
