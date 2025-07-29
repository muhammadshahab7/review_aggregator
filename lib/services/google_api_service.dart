import 'dart:convert';
import 'package:http/http.dart' as http;
import '../private/secrets.dart';

class GoogleApiService {
  static Future<double> getRating(String query) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/findplacefromtext/json'
      '?input=${Uri.encodeComponent(query)}&inputtype=textquery'
      '&fields=rating,name&key=${Secrets.googleApiKey}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['candidates'] != null && data['candidates'].isNotEmpty) {
        return (data['candidates'][0]['rating'] as num).toDouble();
      } else {
        throw Exception("No Google result found");
      }
    } else {
      throw Exception("Google API error: ${response.statusCode}");
    }
  }
}
