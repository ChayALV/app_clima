class TemperatureComverter{
  static double kelvinToCelsius(double temperature){
    const double constCelsius = 273.15;
    double conversion = temperature - constCelsius;
    return double.parse(conversion.toStringAsFixed(3));
  }
  static double kelvinToFahrenheit(double temperature){
    const double constFahrenheit = 273.15;
    double conversion =((temperature - constFahrenheit)* 1.8 ) + 32;
    return double.parse(conversion.toStringAsFixed(3));
  }
}