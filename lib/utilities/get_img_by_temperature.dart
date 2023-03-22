import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget getImgByTemperature(double temperatureInCelsius){
  if (temperatureInCelsius >= 35 && temperatureInCelsius < 42) {
    return Stack(
      children: [
         Center(
           child: SizedBox(
            width: 500,
            height: 300,
            child: SvgPicture.asset("assets/cloudy.svg",fit: BoxFit.cover,)),
         ),
        Row(
          children: [
            _ImageBase(asset:"assets/sunny.svg"),
            _ImageBase(
              asset:"assets/hot.svg",
              width: 150,
            ),
          ],
        ),
      ],
    );
  }
  if (temperatureInCelsius >= 30 && temperatureInCelsius < 35) {
    return _ImageBase(asset:"assets/sunny.svg");
  }
  if (temperatureInCelsius >= 19 && temperatureInCelsius < 30) {
    return _ImageBase(asset:"assets/clear-cloudy.svg");
  }
  if (temperatureInCelsius >= 9 && temperatureInCelsius < 19) {
    return _ImageBase(asset:"assets/cold.svg");
  }
  return Container();
}
class _ImageBase extends StatelessWidget {
  final String asset;
  final double? width;
  
  _ImageBase({
    required this.asset,
    this.width
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300,
      height: 300,
      child: SvgPicture.asset(asset));
  }
}