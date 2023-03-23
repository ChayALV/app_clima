import 'package:bloc/bloc.dart';
import 'package:flutter_prueba_tecnica/models/weather_model.dart';
import 'package:flutter_prueba_tecnica/repositories/lat_long_repositorie.dart';
import 'package:flutter_prueba_tecnica/repositories/sp_repositorie.dart';
import 'package:flutter_prueba_tecnica/repositories/weather_repositorie.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherState> {

  final WeatherRepositorie _weatherRepositorie;
  final LatLongRpositorie _latLongRpositorie;
  final SPRepositorie _sPRepositorie;

  WeatherBloc(
    this._weatherRepositorie,
    this._latLongRpositorie,
    this._sPRepositorie
    ) : super(WeatherBlocInitial()) {
    
      on<CallWeatherEvent>(_call);
      on<ChangeWeatherEvent>(_changeWeather);
      on<DeleteCountriWeatherEvent>(_deleteCountriWeather);
    }
    Future<void> _call(
        CallWeatherEvent event,
        Emitter<WeatherState> emit
    ) async{
      emit(LoadingWeatherState());
       
      try {
        List<String>? countries = await _sPRepositorie.getKeysOfCountries();
        Map<String,String> location = await _latLongRpositorie.getLocation();
        String long = location['long']??"";
        String lat = location['lat']??"";
        WeatherModel weather = await _weatherRepositorie.getWeather(lat, long);
        emit(LoadedWeatherState(
          weather: weather,
          countries: countries ?? []
        ));
      } catch (e) {
        emit(FailedWeatherState(message: e.toString()));        
      }
    }
    Future<void> _changeWeather(
      ChangeWeatherEvent event,
      Emitter<WeatherState> emit
    )async{
      emit(LoadingWeatherState());
      try{
        List<String>? countries 
          = await _sPRepositorie.getKeysOfCountries();
        List<String>? latLang 
          = await _sPRepositorie.getLatLangOfCountrie(event.key);
        if (latLang == null) {
          emit(FailedWeatherState(message: 'Error al guardar la cuidad'));
          return;
        }
        WeatherModel weather = await _weatherRepositorie.getWeather(latLang[0], latLang[1]);
        emit(LoadedWeatherState(
          weather: weather,
          countries: countries ?? []
        ));
      }catch(e){
         emit(FailedWeatherState(message: e.toString()));
      }
    }
    
    Future<void> _deleteCountriWeather(
      DeleteCountriWeatherEvent event,
      Emitter<WeatherState> emit
    )async{
      emit(LoadingWeatherState());
      try{
        List<String>? countries 
          = await _sPRepositorie.getKeysOfCountries();
        
        countries!.remove(event.key);

        await _sPRepositorie.setKeysOfCountries(countries);
        
        Map<String,String> location = await _latLongRpositorie.getLocation();
        String long = location['long']??"";
        String lat = location['lat']??"";
        WeatherModel weather = await _weatherRepositorie.getWeather(lat, long);
        emit(LoadedWeatherState(
          weather: weather,
          countries: countries
        ));
      }catch(e){
         emit(FailedWeatherState(message: e.toString()));
      }
    }
}
