part of 'places_bloc.dart';

abstract class PlacesEvent {}

class GetPlacesEvent extends PlacesEvent{
  final String query;
  GetPlacesEvent({required this.query});
}

class SavePlaceEvent extends PlacesEvent{
  final String nameOfCountrie;
  final String placeId;
  SavePlaceEvent({
    required this.placeId,
    required this.nameOfCountrie
  });
}

