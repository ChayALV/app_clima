import 'package:flutter/material.dart';


List<Color> getGradientByTemperatureIncelcius(double temperature){
    if (temperature >= 30 && temperature < 42) {
      return[
        Colors.orange.shade900,
        Colors.orange.shade300,
      ];
    }
    if (temperature >= 17 && temperature < 29) {
      return [
        Colors.blue,
        Colors.blue.shade200,
      ];
    }
    if (temperature >= 0 && temperature < 17) {
      return [
        Colors.indigo.shade900,
        Colors.blue.shade800,
      ];
    }
    return  [
      Colors.indigo.shade900,
      Colors.blue.shade800,
    ];;
}



List<Color> rainWeather = [
  Colors.grey.shade800,
  Colors.blueGrey,
];