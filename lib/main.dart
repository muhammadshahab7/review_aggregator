import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/review_bloc/review_bloc.dart';
import 'repositories/review_repository.dart';
import 'screens/search_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ReviewRepository repository = ReviewRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Review Aggregator',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => ReviewBloc(repository),
        child: SearchScreen(),
      ),
    );
  }
}
