import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/dtos/reservation/create_reservation_dto.dart';
import 'package:ParkA/pages/create-reservation/utils/generate_schedule_util.dart';
import 'package:ParkA/utils/graphql/mutations/reservation_mutation.dart';
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

    print(_result.exception.toString());

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

  static Future<bool> createReservation(
      CreateReservationDto _createReservationDto) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    final Map<String, dynamic> createReservationInput = {
      "data": {
        "parking": _createReservationDto.parking.id,
        "owner": _createReservationDto.parking.user.id,
        "checkInDate": _createReservationDto.checkInDate,
        "checkOutDate": _createReservationDto.checkOutDate,
        "vehicle": _createReservationDto.vehicle.id,
        "paymentInfo": _createReservationDto.paymentInfo.id,
        "total": _createReservationDto.total,
        "rentDate": formatDate(_createReservationDto.rentDate),
      }
    };

    final options = MutationOptions(
        variables: createReservationInput,
        documentNode: gql(createReservationMutation));

    final _result = await graphqlClient.mutate(options);

    print(_result.exception.toString());

    if (_result.data != null) {
      return true;
    }

    return false;
  }

  static Future<Reservation> getReservationById(id) async {
    Reservation test = new Reservation();
    return test;
  }
}
