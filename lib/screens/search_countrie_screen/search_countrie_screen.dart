import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prueba_tecnica/blocs/places_bloc/places_bloc.dart';
import 'package:flutter_prueba_tecnica/blocs/weather_bloc/weather_bloc_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

part 'app_bar_search_screen.dart';
part 'input_search_screen.dart';

class SearchCountriScreen extends StatelessWidget {
  final VoidCallback funtion;
  const SearchCountriScreen({
    required this.funtion,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 50),
      child: ClipRect(
        child:  BackdropFilter(
          filter:ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child:  Container(
            width: MediaQuery.of(context).size.width,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                )
              ],
              border: Border.all(
                color: Colors.white.withOpacity(0.2), width: 2.5),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.2)
                ],
                stops: const [0.0, 1.0],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  _AppBarSearchSreen(funtion: funtion),
                  const _InputSearchScreen(),
                  const SizedBox(height: 10,),
                  const Divider(),
                  BlocConsumer<PlacesBloc,PlacesState>(
                    listener: (context, state){
                      if(state is SavedPlacesState){
                        context.read<WeatherBloc>().add(CallWeatherEvent());
                        funtion;
                      }
                    },
                    builder: (context, state){
                      if(state is RepeatKeyPlacesState){
                        return Center(child: Text(state.message));
                      }
                      if(state is FailedPlacesState){
                        return Center(child: Text(state.message));
                      }
                      if(state is PlacesInitial){
                        return Container();
                      }
                      if(state is LoadingPlacesState){
                        return LoadingAnimationWidget.fourRotatingDots(
                          size: 100, color:const Color.fromARGB(255, 255, 255, 255),
                        );
                      }
                      if(state is LoadedPlacesState){
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.places.predictions.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  context.read<PlacesBloc>().add(SavePlaceEvent(
                                    placeId: state.places.predictions[index].placeId,
                                    nameOfCountrie: state.places.predictions[index].description
                                  ));
                                },
                                child: ListTile(
                                  title: Text(state.places.predictions[index].description),
                                  subtitle: Text(state.places.predictions[index].structuredFormatting.secondaryText),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Container();
                    }, 
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}