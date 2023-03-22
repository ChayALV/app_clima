import 'dart:math';

import 'package:http/http.dart' as http;

class BaseRepositorie{
  String apiKey = const String.fromEnvironment('API_KEY');
  String placesApiKey = const String.fromEnvironment('PLACES_API_KEY');
  String geoCodeApiKey = const String.fromEnvironment('GEOCODE_API_KEY');
  String weatheBaseUrl = "api.openweathermap.org";
  String googleBaseUrl = "maps.googleapis.com";


  Future<dynamic> getWeatheRepositorie(String method,Map<String, dynamic> queryParameters) async {
    queryParameters.addAll({'appid': apiKey});
    final uri =
      Uri.https(weatheBaseUrl, method, queryParameters);  
    final response = await http.get(uri);
    return response.body;
  }

  Future<dynamic> getPlaceRepositorie(String method,Map<String, dynamic> queryParameters) async {
    queryParameters.addAll({'key': placesApiKey});
    final uri =
      Uri.https(googleBaseUrl, method, queryParameters);  
    final response = await http.get(uri);
    return response.body;
  }

  Future<dynamic> getGeoCodeRepositorie(String method,Map<String, dynamic> queryParameters) async {
    queryParameters.addAll({'key': geoCodeApiKey});
    final uri =
      Uri.https(googleBaseUrl, method, queryParameters);  
    final response = await http.get(uri);
    return response.body;
  }
}