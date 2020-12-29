import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/data/data-models/user/user_data_model.dart';

class Review {
  String id;
  User user;
  Parking parking;
  Reservation reservation;
  String review;
  double calification;
  bool type;
  String title;

  Review({
    this.calification,
    this.id,
    this.parking,
    this.reservation,
    this.review,
    this.title,
    this.type,
    this.user,
  });

  static Review reviewFromJson(Map<String, dynamic> _reviewData) {
    return Review(
      calification: double.tryParse(_reviewData["calification"].toString()),
      id: _reviewData["id"],
      review: _reviewData["review"],
      title: _reviewData["title"],
      type: _reviewData["type"],
      user: User.userFromJson(_reviewData["user"]),
    );
  }

  static List<Review> reviewsFromJson(List<dynamic> _reviewData) {
    List<Review> ret = new List();

    _reviewData.forEach((element) {
      ret.add(Review.reviewFromJson(element));
    });

    return ret;
  }
}
