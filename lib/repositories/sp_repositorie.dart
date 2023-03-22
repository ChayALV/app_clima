import 'package:shared_preferences/shared_preferences.dart';

class SPRepositorie {
  
  Future<List<String>?> getKeysOfCountries() async{
    final prefs = await SharedPreferences.getInstance();
    final List<String>? countries 
      = prefs.getStringList('COUNTRIES');
    return countries;
  }

  Future<bool> setKeysOfCountries(List<String> countries) async{
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList('COUNTRIES',
      countries);
  }
  
  Future<List<String>?> getLatLangOfCountrie(String key) async{
    final prefs = await SharedPreferences.getInstance();
    final List<String>? latLang
      = prefs.getStringList(key);
    return latLang;
  }

  Future<bool> setLatLangOfCountrie(List<String> latLang,String key) async{
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(key,
      latLang);
  }
}