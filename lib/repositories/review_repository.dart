import '../models/restaurant_review.dart';
import '../services/google_api_service.dart';
import '../services/yelp_api_service.dart';
import '../services/open_table_service.dart';

class ReviewRepository {
  Future<RestaurantReview> fetchReviews(String query) async {
    final yelp = await YelpApiService.getRating(query);
    final google = await GoogleApiService.getRating(query);
    final openTable = await OpenTableService.getRating(query);

    return RestaurantReview(
      name: query,
      yelpRating: yelp,
      googleRating: google,
      openTableRating: openTable,
    );
  }
}
