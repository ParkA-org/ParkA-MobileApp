import 'package:ParkA/components/Utils/graphql/graphql_client.dart';
import 'package:ParkA/pages/MapPage/maps_page.dart';
import 'package:ParkA/routes/get_routes.dart';
import 'package:ParkA/use-cases/user/user_use_cases.dart';
import 'package:ParkA/utils/graphql/public-client/parka_public_graphql_client.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final ParkaGraphqlClient parkaGraphqlClient = new ParkaGraphqlClient();
  final userUseCase = new UserUseCases();
  final parka = new PublicGraphqlClient();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ParkA',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: get_pages,
      initialRoute: MapPage.routeName,
    );
  }
}
