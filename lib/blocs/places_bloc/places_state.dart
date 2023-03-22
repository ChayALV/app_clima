part of 'places_bloc.dart';

abstract class PlacesState {}

class PlacesInitial extends PlacesState {}
class LoadingPlacesState extends PlacesState {}
class SavedPlacesState extends PlacesState {}
class LoadedPlacesState extends PlacesState {
  final PlaceModel places;
  LoadedPlacesState({required this.places});
}
class FailedPlacesState extends PlacesState {
  final String message;
  FailedPlacesState({
    required this.message
  });
}

class RepeatKeyPlacesState extends PlacesState {
  final String message;
  RepeatKeyPlacesState({
    required this.message
  });
}