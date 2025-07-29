import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/review_bloc/review_bloc.dart';
import '../blocs/review_bloc/review_event.dart';
import '../blocs/review_bloc/review_state.dart';
import '../widgets/rating_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Review Aggregator")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter restaurant name or location",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    context.read<ReviewBloc>().add(
                      FetchReviews(_controller.text),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ReviewBloc, ReviewState>(
                builder: (context, state) {
                  if (state is ReviewLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ReviewLoaded) {
                    return RatingCard(review: state.review);
                  } else if (state is ReviewError) {
                    return Center(child: Text("Error: ${state.message}"));
                  } else {
                    return Center(child: Text("Search for a place."));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
