import 'package:url_launcher/url_launcher.dart';

gotoHelp() async {
  String url = "https://github.com/ParkA-org/ParkA-MobileApp/wiki";
  final String encodedURL = Uri.encodeFull(url);

  if (await canLaunch(encodedURL)) {
    await launch(encodedURL);
  } else {
    throw 'Could not launch URL';
  }
}
