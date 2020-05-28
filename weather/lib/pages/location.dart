import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_controller/map_controller.dart';
import 'package:weather/http_request.dart';
import 'package:weather/weather_data.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class LocationFinder {

  static String currentLatitude;
  static String currentLongitude;

  static setCurrentLocation(String cLatitude, String cLongitude) {
    currentLatitude = cLatitude;
    currentLongitude = cLongitude;
  }

  static getWidget(BuildContext context, String latitude, String longitude){
    MapController _mapController = MapController();

    Marker selectedLocMarker(String lat, String long) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: new LatLng(double.parse(lat), double.parse(long)), //LatLng(double.parse(this.widget.currentLatitude),double.parse(this.widget.currentLongitude)), //(27.7172, 85.324),
        builder: (context) => Container(
          child: IconButton(
            icon: Icon(Icons.location_on),
            color: Colors.redAccent,
            onPressed: () {},
          ),
        ),
      );
    }

    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.view_list,
        closeManually: true,
        elevation: 15.0,
        children: [
          SpeedDialChild(
            child: Icon(Icons.zoom_in),
            onTap: () {
              var zoom = _mapController.zoom + 1;
              _mapController.move(_mapController.center, zoom);
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.zoom_out),
            onTap: () {
              var zoom = _mapController.zoom - 1;
              _mapController.move(_mapController.center, zoom);
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.my_location),
            onTap: () {
              _mapController.move(LatLng(double.parse(currentLatitude), double.parse(currentLongitude)), 12);
            }
          ),
        ],
      ),
      body: Center(
        child: new FlutterMap(
            mapController: _mapController,
            options: MapOptions(
                zoom: 12,
                center: new LatLng(double.parse(latitude), double.parse(longitude)),//LatLng(double.parse(this.widget.currentLatitude), double.parse(this.widget.currentLongitude)), //(27.7172, 85.324),
                onTap: (LatLng coordinate) async {
                  HttpRequest httpRequest = HttpRequest();
                  WeatherData weatherData =
                      await httpRequest.getCurrentWeatherData(coordinate);

                  String currentLocalDate =
                      await httpRequest.getCurrentTimeZone(coordinate);

                  Map astronomyData =
                      await httpRequest.getCurrentAstronomy(coordinate);

                  Navigator.pushReplacementNamed(context, '/home', arguments: {
                    'city': weatherData.data.city,
                    'temperature': weatherData.data.current.weather.tp,
                    'humidity': weatherData.data.current.weather.hu,
                    'pressure': weatherData.data.current.weather.pr,
                    'wind': weatherData.data.current.weather.ws,
                    'icon': weatherData.data.current.weather.ic,
                    'longitude': weatherData.data.location.coordinates[0],
                    'latitude': weatherData.data.location.coordinates[1],
                    'currentLocalDate': currentLocalDate,
                    'sunrise': astronomyData['sunrise'],
                    'sunset': astronomyData['sunset'],
                    'moonrise': astronomyData['moonrise'],
                    'moonset': astronomyData['moonset'],
                  });
                }),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayerOptions(
                markers: [
                  selectedLocMarker(latitude, longitude),
                ],
              ),
            ]),
      ),
    );
  }
}

