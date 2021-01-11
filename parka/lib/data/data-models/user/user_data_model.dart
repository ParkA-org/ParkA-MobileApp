import 'package:ParkA/data/data-models/review/review_data_model.dart';

class User {
  String id;
  String name;
  String lastName;
  String email;
  String profilePicture;
  String informationId;
  List<Review> reviews;

  User({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.profilePicture,
    this.informationId,
    this.reviews,
  });

  static userFromJson(Map<String, dynamic> userData) {
    if (userData == null) return new User();

    return new User(
      id: userData["id"],
      email: userData["email"],
      lastName: userData["lastName"],
      name: userData["name"],
      profilePicture: userData["profilePicture"],
    );
  }

  static otherUserFromJson(Map<String, dynamic> userData) {
    if (userData == null) return new User();

    return new User(
      id: userData["id"],
      email: userData["email"],
      lastName: userData["lastName"],
      name: userData["name"],
      profilePicture: userData["profilePicture"],
      reviews: Review.reviewsFromJson(userData["reviews"]),
    );
  }
}
