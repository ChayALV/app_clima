import 'dart:convert';

import 'package:flutter_prueba_tecnica/models/place_model.dart';
import 'package:flutter_prueba_tecnica/repositories/base_repositorie.dart';

class PlaceRepositorie extends BaseRepositorie {
  Future<PlaceModel> gePlaces(String query) async{
    final Map<String,dynamic> queryParameters = {
      "input":query
    };
    final response = await getPlaceRepositorie(
      '/maps/api/place/autocomplete/json',
      queryParameters
    );
    final finalResponse = PlaceModel.fromJson(jsonDecode(response));
    return finalResponse;
  } 
}