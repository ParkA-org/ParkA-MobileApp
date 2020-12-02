import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/utils/graphql/queries/reservation_queries.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class ReservationUseCases {
  static Future<int> getAllReservationsAsOwnerCount() async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    QueryOptions _queryOptions =
        new QueryOptions(documentNode: gql(getAllReservationAsOwnerCountQuery));

    final _result = await graphqlClient.query(_queryOptions);

    if (_result.data != null) {
      return _result.data["getAllUserReservationsAsOwner"].length;
    }

    return 0;
  }

  static Future<int> getAllReservationsAsClientCount() async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    QueryOptions _queryOptions = new QueryOptions(
        documentNode: gql(getAllReservationAsClientCountQuery));

    final _result = await graphqlClient.query(_queryOptions);

    if (_result.data != null) {
      final List _reservations = _result.data["getAllUserReservationsAsClient"];
      return _reservations.length;
    }

    return 0;
  }

  static Future<Reservation> getReservationById(id) async {
    Reservation test = new Reservation();
    return test;
  }
}
