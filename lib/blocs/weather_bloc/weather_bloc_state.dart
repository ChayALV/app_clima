part of 'weather_bloc_bloc.dart';

abstract class WeatherState {}

class WeatherBlocInitial extends WeatherState {}
class LoadingWeatherState extends WeatherState {}
class LoadedWeatherState extends WeatherState {
  final WeatherModel weather;
  final List<String> countries;
  LoadedWeatherState(
    {
      required this.weather,
      required this.countries
    }
  );
}
class FailedWeatherState extends WeatherState {
  final String message;
  FailedWeatherState(
    {
      required this.message
    }
  );
}

