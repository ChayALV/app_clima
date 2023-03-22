import 'package:flutter/material.dart';

class MianTheme{
  ThemeData theme = ThemeData(
    fontFamily: "nexa-ligth",
    textTheme: const TextTheme(
      titleLarge : TextStyle(
        color: Colors.white,
        fontSize:100,
        fontFamily: "caviar"
      ),
      titleMedium:  TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontFamily: "nexa"
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize:30,
        fontFamily: "caviar"
      ),
      displaySmall:TextStyle(
        height: 0.5,
        color: Colors.white,
        fontSize: 15,
        fontFamily: "nexa-ligth"
      ),
      displayMedium:  TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: "nexa"
      ),
      labelSmall :  TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 20,
        fontFamily: "nexa-ligth"
      ),
      labelMedium :  TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 20,
        fontFamily: "nexa"
      ),
    )
  );
}