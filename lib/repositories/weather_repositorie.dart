import 'dart:convert';

import 'package:flutter_prueba_tecnica/models/weather_model.dart';
import 'package:flutter_prueba_tecnica/repositories/base_repositorie.dart';

class WeatherRepositorie extends BaseRepositorie {
  Future<WeatherModel> getWeather(String lat,String long) async{
    final Map<String,dynamic> queryParameters = {
      "lat":lat,
      "lon":long
    };
    final response = await getWeatheRepositorie('/data/2.5/weather',queryParameters);
    final finalResponse = WeatherModel.fromJson(jsonDecode(response));
    return finalResponse;
  } 
}