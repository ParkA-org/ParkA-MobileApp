import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/vehicle/dto/create_vehicle_dto.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/data/dtos/vehicle/update_vehicle_dto.dart';

import 'package:ParkA/utils/functions/upload_image.dart';
import 'package:ParkA/utils/graphql/mutations/vehicle_mutations.dart';
import 'package:ParkA/utils/graphql/queries/vehicle_queries.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class VehicleUseCases {
  static Future<Vehicle> getVehicleById(String id) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    final queryVariables = {
      "input": {"id": id}
    };

    QueryOptions queryOptions = QueryOptions(
        documentNode: gql(getVehicleByIdQuery), variables: queryVariables);

    final QueryResult getVehiclebyIdResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    print(getVehiclebyIdResult.data);
    print(getVehiclebyIdResult.exception);

    if (getVehiclebyIdResult.data != null) {
      final vehicleData = getVehiclebyIdResult.data["getVehicleById"];
      return Vehicle.vehiclefromJson(vehicleData);
    }

    return null;
  }

  static Future<List<Vehicle>> getAllUserVehicles() async {
    final graphqlClient = Get.find<GraphqlClientController>();

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllUserVehiclesQuery));

    final QueryResult getAllUserVehiclesResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    print(getAllUserVehiclesResult.data);
    print(getAllUserVehiclesResult.exception);
    if (getAllUserVehiclesResult.data != null) {
      final List<Vehicle> vehiclesData = Vehicle.vehiclesFromJason(
        getAllUserVehiclesResult.data["getAllUserVehicles"],
      );

      return vehiclesData;
    }

    return [];
  }

  static Future<bool> createVehicle(CreateVehicleDto createVehicleDto) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    String imageUrl = await uploadImage(createVehicleDto.mainPicture);

//TODO: add funtion to upload mutiple images
    print(createVehicleDto.model);
    print(createVehicleDto.licensePlate);
    print(createVehicleDto.colorExterior);
    print(createVehicleDto.mainPicture);
    print(imageUrl);
    print(createVehicleDto.year);
    print(createVehicleDto.alias);
    print(createVehicleDto.bodyStyle);

    final createVehicleInput = {
      "data": {
        "model": createVehicleDto.model,
        "licensePlate": createVehicleDto.licensePlate,
        "colorExterior": createVehicleDto.colorExterior,
        "mainPicture": imageUrl,
        "detail": "",
        "pictures": [],
        "year": createVehicleDto.year,
        "alias": createVehicleDto.alias,
        "bodyStyle": createVehicleDto.bodyStyle,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createVehicleMutation),
      variables: createVehicleInput,
    );

    final QueryResult createVehiclesResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    print(createVehiclesResult.data);
    print(createVehiclesResult.exception.toString());
    if (createVehiclesResult.data != null) {
      return true;
    }

    return false;
  }

  static Future<bool> updateVehicle(UpdateVehicleDto _updateVehicleDto) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    bool checkMainPicture = GetUtils.isURL(_updateVehicleDto.mainPicture);
    String _imageUrl = _updateVehicleDto.mainPicture;

    if (!checkMainPicture) {
      _imageUrl = await uploadImage(_updateVehicleDto.mainPicture);
    }

//TODO: add funtion to upload mutiple images
    print(_updateVehicleDto.model);
    print(_updateVehicleDto.licensePlate);
    print(_updateVehicleDto.colorExterior);
    print(_updateVehicleDto.mainPicture);
    print(_imageUrl);
    print(_updateVehicleDto.year);
    print(_updateVehicleDto.alias);
    print(_updateVehicleDto.bodyStyle);

    // final _updateVehicleInput = {
    //   "data": {
    //     "model": _updateVehicleDto.model,
    //     "licensePlate": _updateVehicleDto.licensePlate,
    //     "colorExterior": _updateVehicleDto.colorExterior,
    //     "mainPicture": _imageUrl,
    //     "pictures": [],
    //     "year": _updateVehicleDto.year,
    //     "alias": _updateVehicleDto.alias,
    //     "bodyStyle": _updateVehicleDto.bodyStyle,
    //   }
    // };

    final _updateVehicleInput = {
      "input": {
        "getVehicleByIdPayload": {
          "id": _updateVehicleDto.id,
        },
        "updateVehiclePayload": {
          "alias": _updateVehicleDto.alias,
          "colorExterior": _updateVehicleDto.colorExterior,
          "detail": "",
          "licensePlate": _updateVehicleDto.licensePlate,
          "mainPicture": _updateVehicleDto.mainPicture,
          "model": _updateVehicleDto.model,
          "bodyStyle": _updateVehicleDto.bodyStyle,
          "year": _updateVehicleDto.year,
          "pictures": [
            "https://upload.wikimedia.org/wikipedia/commons/f/f1/2018_Toyota_Corolla_%28MZEA12R%29_Ascent_Sport_hatchback_%282018-11-02%29_01.jpg",
            "https://st.motortrend.com/uploads/sites/5/2019/11/2020-Toyota-Corolla-Hybrid-LE-front-three-quarter-in-motion.jpg"
          ]
        }
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(updateVehicleMutation),
      variables: _updateVehicleInput,
    );

    final QueryResult updateVehiclesResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    print(updateVehiclesResult.data);
    print(updateVehiclesResult.exception.toString());
    if (updateVehiclesResult.data != null) {
      return true;
    }

    return false;
  }
}
