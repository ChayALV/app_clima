
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prueba_tecnica/blocs/weather_bloc/weather_bloc_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorHomeScreen extends StatelessWidget {
  final String message;
  const ErrorHomeScreen({
    super.key, required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors:[
          Color.fromARGB(255, 0, 75, 137),
          Color.fromARGB(255, 92, 166, 226)
        ]
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
          width: 300,
          height: 300,
          child: SvgPicture.asset('assets/thunderstroms.svg')),
          Text('Error: $message'),
          GestureDetector(
            onTap: (){
              context.read<WeatherBloc>().add(CallWeatherEvent());
            },
            child:Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: const Center(child: Text('Recargar pagina'))
            ),
          )
        ],
      ),
    );
  }
}