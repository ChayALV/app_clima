part of '../home_screen.dart';

class _SecondaryContent extends StatelessWidget {
  final LoadedWeatherState state;
  const _SecondaryContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      width: MediaQuery.of(context).size.width,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TempMinAndtempMax(state: state),
              Text(
                "Ciudades",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              if(state.countries.isEmpty)
                Text(
                  "No hay ciduades agregadas",
                  style: Theme.of(context).textTheme.titleSmall
                ),
              ListTile(
                title: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        context.read<WeatherBloc>().add(CallWeatherEvent());
                      },
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          "Tu ubicacion actual",
                          style: Theme.of(context).textTheme.labelSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: state.countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              context.read<WeatherBloc>().add(ChangeWeatherEvent(key: state.countries[index]));
                            },
                            child: SizedBox(
                              width: 250,
                              child: Text(
                                state.countries[index],
                                style: Theme.of(context).textTheme.labelSmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: (){
                              context.read<WeatherBloc>().add(DeleteCountriWeatherEvent(key: state.countries[index]));
                            },
                            child: const Icon(Icons.delete,color: Colors.black,)
                          )
                        ],
                      ),
                    );
                  }
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
