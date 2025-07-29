abstract class ReviewEvent {}

class FetchReviews extends ReviewEvent {
  final String query;
  FetchReviews(this.query);
}
