import 'package:ParkA/data/data-models/user/user_data_model.dart';

double userRating(User _user) {
  int len = _user.reviews.length;
  double rating = 0;

  _user.reviews.forEach((element) {
    rating += element.calification;
  });

  return len == 0 ? 5.0 : rating / len;
}
