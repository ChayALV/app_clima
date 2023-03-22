part of '../home_screen.dart';

class _MainContentHomeScreen extends StatefulWidget {
  final VoidCallback funtion;
  final WeatherModel weather;
  const _MainContentHomeScreen({super.key, required this.funtion, required this.weather});

  @override
  State<_MainContentHomeScreen> createState() => _MainContentHomeScreenState();
}

class _MainContentHomeScreenState extends State<_MainContentHomeScreen> {
  String typeOfTempConst = "c";
  Widget changeTemp(String typeOfTemp){
    switch (typeOfTemp) {
      case "c":
        return Text(
          "${TemperatureComverter.kelvinToCelsius(widget.weather.main.temp)}°C",
          style: Theme.of(context).textTheme.titleLarge,
        );
      case "f":
        return Text(
          "${TemperatureComverter.kelvinToFahrenheit(widget.weather.main.temp)}°F",
          style: Theme.of(context).textTheme.titleLarge,
        );
      default:
      return Container();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _AppBarHomeScreen(
            countrieName: widget.weather.name,
            funtion:widget.funtion //,
          ),
          getImgByTemperature(
            TemperatureComverter.kelvinToCelsius(widget.weather.main.temp)
          ),
          GestureDetector(
            onTap: ()=> setState(() {
              if (typeOfTempConst == "c") {
                typeOfTempConst = 'f';
              } else {
                typeOfTempConst = 'c';
              }
            }),
            child: changeTemp(typeOfTempConst)
          ),
          Text(
            widget.weather.weather[0].main,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            widget.weather.weather[0].description,
            style: Theme.of(context).textTheme.displaySmall
            ,
          ),
        ],
      ),
    );
  }
}