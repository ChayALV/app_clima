import 'dart:convert';

import 'package:flutter_prueba_tecnica/models/geocoding_model.dart';
import 'package:flutter_prueba_tecnica/repositories/base_repositorie.dart';

class GeoLoCatorRepositorie extends BaseRepositorie {
  Future<GeoCodingModel> getLatLang(String placeId) async{
    final Map<String,dynamic> queryParameters = {
      "place_id":placeId
    };
    final response = await getGeoCodeRepositorie(
      '/maps/api/geocode/json',
      queryParameters
    );
    final finalResponse = GeoCodingModel.fromJson(jsonDecode(response));
    return finalResponse;
  }
}