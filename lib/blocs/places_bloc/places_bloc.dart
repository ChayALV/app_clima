import 'package:bloc/bloc.dart';
import 'package:flutter_prueba_tecnica/models/geocoding_model.dart';
import 'package:flutter_prueba_tecnica/models/place_model.dart';
import 'package:flutter_prueba_tecnica/repositories/geo_locator_repositorie.dart';
import 'package:flutter_prueba_tecnica/repositories/place_respositorie.dart';
import 'package:flutter_prueba_tecnica/repositories/sp_repositorie.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final PlaceRepositorie _placeRepositorie;
  final GeoLoCatorRepositorie _geoLoCatorRepositorie;
  final SPRepositorie _sPRepositorie;
  PlacesBloc(
    this._placeRepositorie,
    this._geoLoCatorRepositorie,
    this._sPRepositorie
  ) : super(PlacesInitial()) {
    on<GetPlacesEvent>(_getPlaces);
    on<SavePlaceEvent>(_savePlace);
  }

  Future<void>_getPlaces(
    GetPlacesEvent event,
    Emitter<PlacesState> emit
  ) async { 
    emit(LoadingPlacesState());
    try {
      PlaceModel places = await _placeRepositorie.gePlaces(event.query);
      emit(LoadedPlacesState(places: places));
    } catch (e) {
      emit(FailedPlacesState(message: e.toString()));
    }
  }
  Future<void>_savePlace(
    SavePlaceEvent event,
    Emitter<PlacesState> emit
  ) async { 
    emit(LoadingPlacesState());
    try {
      GeoCodingModel geocoding = await _geoLoCatorRepositorie.getLatLang(event.placeId);
      List<String>? keys = await _sPRepositorie.getKeysOfCountries();
      if (keys == null) {
        _sPRepositorie.setKeysOfCountries([event.nameOfCountrie]);
      }
      if (_validatorKey(keys!, event.nameOfCountrie)) {
        emit(RepeatKeyPlacesState(message: 'La ciudad ya esta registrada'));
        return;
      }
      keys.add(event.nameOfCountrie);
      _sPRepositorie.setKeysOfCountries(keys);
      _sPRepositorie.setLatLangOfCountrie(
        [
          geocoding.results[0].geometry.location.lat.toString(),
          geocoding.results[0].geometry.location.lng.toString(),
        ] 
        ,event.nameOfCountrie
      );
      emit(SavedPlacesState());
    } catch (e) {
      emit(FailedPlacesState(message: e.toString()));
    }
  }
  bool _validatorKey(List<String> keys ,String key){
    for (var element in keys) {
      if (element == key ) {
        return true;
      }
    }
    return false;
  }
}
