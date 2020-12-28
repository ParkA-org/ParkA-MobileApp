import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/review/review_data_model.dart';
import 'package:ParkA/data/dtos/review/create_review_dto.dart';
import 'package:ParkA/utils/graphql/mutations/review_mutations.dart';
import 'package:ParkA/utils/graphql/queries/review_queries.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class ReviewUseCases {
  static Future<bool> createReview(CreateReviewDto _createReviewDto) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    final Map<String, dynamic> createReviewInput = {
      "data": {
        "parking": _createReviewDto.parkingId,
        "reservation": _createReviewDto.reservationId,
        "review": _createReviewDto.review,
        "title": _createReviewDto.title,
        "calification": _createReviewDto.calification,
        "type": _createReviewDto.type
      }
    };

    final options = MutationOptions(
        variables: createReviewInput, documentNode: gql(createReviewMutation));

    final _result = await graphqlClient.mutate(options);
    if (_result.data != null) {
      return true;
    }
    return false;
  }

  static Future<Review> getReviewByReservation(id) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    final data = {
      "data": {
        "id": id,
      }
    };
    QueryOptions _queryOptions = new QueryOptions(
        documentNode: gql(getReviewByReservationQuery), variables: data);

    final _result = await graphqlClient.query(_queryOptions);
    print(_result);
    if (_result.data != null) {
      final review = _result.data['getReviewByReservation'];
      final Review reviewData = Review.reviewFromJson(review);
      return reviewData;
    }
    return null;
  }
}
