part of 'weather_bloc_bloc.dart';

abstract class WeatherBlocEvent {}

class CallWeatherEvent extends WeatherBlocEvent{}
class ChangeWeatherEvent extends WeatherBlocEvent{
  final String key;
  ChangeWeatherEvent({
    required this.key
  });
}
class DeleteCountriWeatherEvent extends WeatherBlocEvent{
  final String key;
  DeleteCountriWeatherEvent({
    required this.key
  });
}