import 'package:flutter_bloc/flutter_bloc.dart';
import 'review_event.dart';
import 'review_state.dart';
import '../../repositories/review_repository.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewRepository repository;

  ReviewBloc(this.repository) : super(ReviewInitial()) {
    on<FetchReviews>((event, emit) async {
      emit(ReviewLoading());
      try {
        final review = await repository.fetchReviews(event.query);
        emit(ReviewLoaded(review));
      } catch (e) {
        emit(ReviewError(e.toString()));
      }
    });
  }
}
