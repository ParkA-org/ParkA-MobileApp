import 'package:ParkA/components/Utils/graphql/graphql_client.dart';
import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/pages/MapPage/maps_page.dart';
import 'package:ParkA/routes/get_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/bindings/graphql_biding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final ParkaGraphqlClient parkaGraphqlClient = new ParkaGraphqlClient();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ParkA',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: get_pages,
      initialBinding: GraphqlClientBiding(),
      initialRoute: MapPage.routeName,
    );
  }
}

// decoration: BoxDecoration(
//   shape: BoxShape.circle,
//   boxShadow: [
//     BoxShadow(
//       offset: Offset(3.0, 10.0),
//       color: Colors.black38,
//       blurRadius: 5.0,
//     ),
//   ],
//   image: DecorationImage(
//     fit: BoxFit.fill,
//     image: NetworkImage(
//       'https://mangathrill.com/wp-content/uploads/2020/02/5432111-1.jpg',
//     ),
//   ),
// ),
