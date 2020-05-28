import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/http_request.dart';
import 'package:weather/weather_data.dart';
import 'package:weather/pages/location.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  

  void getCurrentLocData() async {
    HttpRequest httpRequest = HttpRequest();
    WeatherData weatherData = await httpRequest.getCurrentWeatherData(null);

    String currentLocalDate = await httpRequest.getCurrentTimeZone(null);

    Map astronomyData = await httpRequest.getCurrentAstronomy(null);

    await httpRequest.getForecastWeatherData();
    
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

    setState(() {
      LocationFinder.setCurrentLocation(weatherData.data.location.coordinates[1], 
                                        weatherData.data.location.coordinates[0]);
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
