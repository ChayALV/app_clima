
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prueba_tecnica/blocs/weather_bloc/weather_bloc_bloc.dart';
import 'package:flutter_prueba_tecnica/models/weather_model.dart';
import 'package:flutter_prueba_tecnica/screens/home_screen/error_home_screen.dart';
import 'package:flutter_prueba_tecnica/screens/home_screen/loading_home_screen.dart';
import 'package:flutter_prueba_tecnica/screens/home_screen/widgets/temp_min_and_temp_max.dart';
import 'package:flutter_prueba_tecnica/screens/search_countrie_screen/search_countrie_screen.dart';
import 'package:flutter_prueba_tecnica/utilities/background.dart';
import 'package:flutter_prueba_tecnica/utilities/colors.dart';
import 'package:flutter_prueba_tecnica/utilities/get_img_by_temperature.dart';
import 'package:flutter_prueba_tecnica/utilities/temaperature_converter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

part 'widgets/app_bar_home_screen.dart';
part 'widgets/mian_content_home_screen.dart';
part 'widgets/secondary_content_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool openMenu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherBloc,WeatherState>(
        listener:(context,state){},
        builder: (context,state){
          if (state is WeatherBlocInitial){
            context.read<WeatherBloc>().add(CallWeatherEvent());
          }
          if (state is FailedWeatherState){
            return ErrorHomeScreen(message: state.message,);
          }
          if (state is LoadingWeatherState){
            return const LoadingHomeScreen();
          }
          if (state is LoadedWeatherState){
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25)
              ),
              child: Stack(
                children: [
                  BackGround(
                    gradient: getGradientByTemperatureIncelcius(
                      TemperatureComverter.kelvinToCelsius(state.weather.main.temp)
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        _MainContentHomeScreen(
                          funtion: ()=> setState(()=> openMenu = !openMenu),
                          weather: state.weather,
                        ),
                        _SecondaryContent(state: state,)
                      ],
                    ),
                  ),
                  if(openMenu)
                    SearchCountriScreen(
                      funtion: ()=> setState(() => openMenu = !openMenu)
                    )  
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

