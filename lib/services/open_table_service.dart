class OpenTableService {
  static Future<double> getRating(String query) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    // In real implementation, OpenTable doesn't provide public API, so scraping or third-party might be needed
    return 3.9; // Dummy OpenTable rating
  }
}
