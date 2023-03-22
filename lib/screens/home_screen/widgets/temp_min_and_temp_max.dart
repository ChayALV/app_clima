
import 'package:flutter/material.dart';
import 'package:flutter_prueba_tecnica/blocs/weather_bloc/weather_bloc_bloc.dart';
import 'package:flutter_prueba_tecnica/utilities/temaperature_converter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TempMinAndtempMax extends StatelessWidget {
  const TempMinAndtempMax({
    super.key,
    required this.state,
  });

  final LoadedWeatherState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            SvgPicture.asset("assets/cold.svg",height: 100),
            const Text("Temperatura minima"),
            Text(
              "${TemperatureComverter.kelvinToCelsius(state.weather.main.tempMin)}",
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
        Column(
          children: [
            SvgPicture.asset("assets/hot.svg",height: 100,),
            const Text("Temperatura maxima"),
            Text(
              "${TemperatureComverter.kelvinToCelsius(state.weather.main.tempMax)}",
              style: Theme.of(context).textTheme.titleSmall
            )
          ],
        )
      ],
    );
  }
}