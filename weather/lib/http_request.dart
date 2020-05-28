import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:weather/apis.dart';
import 'package:weather/weather_data.dart';
import 'package:latlong/latlong.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  String url;

  HttpRequest();

  Future<WeatherData> getCurrentWeatherData(LatLng coordinate) async {
    String finalUrl;
    if(coordinate == null){
      finalUrl = '${APIs.URL_NEAREST_CITY}?key=${APIs.TOKEN}';
    } else {
      finalUrl = '${APIs.URL_NEAREST_CITY}?lat=${coordinate.latitude}&lon=${coordinate.longitude}&key=${APIs.TOKEN}';
    }
    
    print ('Request url is $finalUrl');
    Response response = await get(finalUrl);
    Map data = jsonDecode(response.body);
    // Check for 200 OK
    WeatherData weatherData = WeatherData.fromJson(data);
    //print (weatherData.data.current.weather.tp);
    return weatherData;
  }

  Future<String> getCurrentTimeZone(LatLng coordinate) async {
    String finalUrl;
    if (coordinate == null){
      finalUrl = '${APIs.IPGL_TIMEZONE}?apiKey=${APIs.IPGL_TOKEN}';
    } else {
      finalUrl = '${APIs.IPGL_TIMEZONE}?apiKey=${APIs.IPGL_TOKEN}&lat=${coordinate.latitude}&long=${coordinate.longitude}';
    }
    
    print ('Request url is $finalUrl');

    Response response = await get(finalUrl);
    Map data = jsonDecode(response.body);

    return data["date_time_txt"];
  }

  Future<Map> getCurrentAstronomy(LatLng coordinate) async {
    String finalUrl;
    if(coordinate == null){
      finalUrl = '${APIs.IPGL_ASTRONOMY}?apiKey=${APIs.IPGL_TOKEN}';
    } else {
      finalUrl = '${APIs.IPGL_ASTRONOMY}?apiKey=${APIs.IPGL_TOKEN}&lat=${coordinate.latitude}&long=${coordinate.longitude}';
    }
    
    print ('Request url is $finalUrl');

    Response response = await get(finalUrl);
    Map data = jsonDecode(response.body);

    return {
      'sunrise': data['sunrise'],
      'sunset': data['sunset'],
      'moonrise': data['moonrise'],
      'moonset': data['moonset'],
    };
  }

  // Get data from ClimaCell
  Future<void> getForecastWeatherData() async {
    String finalUrl = 'https://climacell-microweather-v1.p.rapidapi.com/weather/nowcast?fields=precipitation&unit_system=si&lat=42.8237618&lon=-71.2216286';
    print (finalUrl);
    
    var response = await http.get(finalUrl, headers: {
        "x-rapidapi-host": "climacell-microweather-v1.p.rapidapi.com",
        "x-rapidapi-key": "a77bca25e8mshe166d34181e9639p1f5a18jsn851a14c2705e"
    });

    print (response.body);
  }
}