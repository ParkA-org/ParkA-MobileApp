import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getLocationData(LatLng position) async {
  final apiUrl =
      'https://api.tomtom.com/search/2/reverseGeocode/${position.latitude},${position.longitude}.json?key=0ohHjbjOShhcUfGhd61gionzeCLVmCv5';

  http.Response positionData = await http.get(apiUrl);

  print(positionData.body);
}
