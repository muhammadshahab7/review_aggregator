import 'dart:convert';
import 'package:http/http.dart' as http;
import '../private/secrets.dart';

class YelpApiService {
  static Future<double> getRating(String query) async {
    final url = Uri.parse(
      'https://api.yelp.com/v3/businesses/search?term=${Uri.encodeComponent(query)}&location=new york',
    );

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${Secrets.yelpApiKey}'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['businesses'] != null && data['businesses'].isNotEmpty) {
        return (data['businesses'][0]['rating'] as num).toDouble();
      } else {
        throw Exception("No Yelp result found");
      }
    } else {
      throw Exception("Yelp API error: ${response.statusCode}");
    }
  }
}
