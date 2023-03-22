import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prueba_tecnica/blocs/places_bloc/places_bloc.dart';
import 'package:flutter_prueba_tecnica/blocs/weather_bloc/weather_bloc_bloc.dart';
import 'package:flutter_prueba_tecnica/repositories/geo_locator_repositorie.dart';
import 'package:flutter_prueba_tecnica/repositories/lat_long_repositorie.dart';
import 'package:flutter_prueba_tecnica/repositories/place_respositorie.dart';
import 'package:flutter_prueba_tecnica/repositories/sp_repositorie.dart';
import 'package:flutter_prueba_tecnica/repositories/weather_repositorie.dart';
import 'package:flutter_prueba_tecnica/screens/home_screen/home_screen.dart';
import 'package:flutter_prueba_tecnica/theme/main_theme.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => WeatherRepositorie()),
        RepositoryProvider(create: (_) => LatLongRpositorie()),
        RepositoryProvider(create: (_) => PlaceRepositorie()),
        RepositoryProvider(create: (_) => GeoLoCatorRepositorie()),
        RepositoryProvider(create: (_) => SPRepositorie()),
        
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => WeatherBloc(
            RepositoryProvider.of<WeatherRepositorie>(_),
            RepositoryProvider.of<LatLongRpositorie>(_),
             RepositoryProvider.of<SPRepositorie>(_),

          )),
          BlocProvider(create: (_) => PlacesBloc(
             RepositoryProvider.of<PlaceRepositorie>(_),
             RepositoryProvider.of<GeoLoCatorRepositorie>(_),
             RepositoryProvider.of<SPRepositorie>(_),
          ))
        ],
        child: MaterialApp(
          theme: MianTheme().theme,
          title: 'Clima app',
          home: const HomeScreen()
        ),
      ),
    );
  }
}
