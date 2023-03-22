import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key, this.gradient});
  final List<Color>? gradient;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:gradient ??[
                Colors.blue,
                Colors.blue.shade200
              ]
            )
          ),
        ),
      ),
    );
  }
}