import 'package:geolocator/geolocator.dart';

class LatLongRpositorie{
  Future<Map<String,String>> getLocation() async {

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    final Map<String,String> response = {
      'lat' : position.latitude.toString(),
      'long' :position.longitude.toString()
    };
    return response;
  }
}