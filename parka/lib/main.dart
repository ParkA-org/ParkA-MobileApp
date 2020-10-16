import 'package:ParkA/pages/MapPage/maps_page.dart';
import 'package:ParkA/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/bindings/graphql_biding.dart';

void main() {
  runApp(ParkApp());
}

class ParkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ParkA',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: getRoutePages,
      initialBinding: GraphqlClientBiding(),
      initialRoute: MapPage.routeName,
    );
  }
}
