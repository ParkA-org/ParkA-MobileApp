import 'dart:convert';

import 'package:ParkA/data/data-models/position/position_data_model.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getLocationData(LatLng position) async {
  final apiKeyJson =
      await rootBundle.loadString('lib/config/tomtom_api_key.json');

  final apiKey = jsonDecode(apiKeyJson)["api_key"];

  final apiUrl =
      'https://api.tomtom.com/search/2/reverseGeocode/${position.latitude},${position.longitude}.json?key=$apiKey';

  http.Response positionRawData =
      await http.get(apiUrl, headers: {'Content-Type': 'application/json'});

  Map<String, dynamic> positionData =
      json.decode(utf8.decode(positionRawData.bodyBytes));

  return Position.fromJson(positionData["addresses"][0]);
}
