
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingHomeScreen extends StatelessWidget {
  const LoadingHomeScreen({
    super.key,
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
      child: Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          size: 100, color:const Color.fromARGB(255, 255, 255, 255),
        ) 
      ),
    );
  }
}
