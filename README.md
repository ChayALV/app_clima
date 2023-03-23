# flutter_prueba_tecnica

Hola que tal esta es la pueba tecnica que consiste en el diseño y consumo de apis para porder precentar la información del clima en diferentes regiones 

## Antes de comenzar
### Devemos seguir los siguientes pasos:

- clonar el repositorio
- abrir la consola en la raiz del proyecto
- ejecutar el comando [flutter pub get]
una vez echo esto es muy importante ir a VSCODE y en la pantalla de [RUN AND DEBUG], Escojer la opción de [CONFIGURACION BASE]
- Como se muesta en la imagen:
- 
![Captura de pantalla de RUN AND DEBUG](https://github.com/ChayALV/app_clima/blob/main/assets/Captura%20de%20pantalla%202023-03-22%20184400.png)

#### En caso de no usar VSCODE tengra que:
- Abiri una terminal
- introducir el comando [flutter run]
con las siguientes banderas
- --dart-define="API_KEY={Las api Keys estan el la ruta .vscode\launch.json}"
- --dart-define="PLACES_API_KEY={Las api Keys estan el la ruta .vscode\launch.json}"
- --dart-define="GEOCODE_API_KEY={Las api Keys estan el la ruta .vscode\launch.json}"
- 
tendra que luvit tal que asi:
[flutter run --dart-define="API_KEY={Las api Keys estan el la ruta .vscode\launch.json}" --dart-define="PLACES_API_KEY={Las api Keys estan el la ruta .vscode\launch.json}" --dart-define="GEOCODE_API_KEY={Las api Keys estan el la ruta .vscode\launch.json}"]

