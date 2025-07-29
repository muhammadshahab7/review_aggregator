import 'package:flutter/material.dart';
import '../models/restaurant_review.dart';

class RatingCard extends StatelessWidget {
  final RestaurantReview review;

  const RatingCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(review.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Yelp: ${review.yelpRating}"),
            Text("Google: ${review.googleRating}"),
            Text("OpenTable: ${review.openTableRating}"),
          ],
        ),
      ),
    );
  }
}
