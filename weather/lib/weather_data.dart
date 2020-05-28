
class WeatherData {
  String status;
  Data data;

  WeatherData({
    this.status,
    this.data,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json){
    return WeatherData(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  String city;
  String state;
  String country;
  Location location;
  Current current;

  Data({
    this.city,
    this.state,
    this.country,
    this.location,
    this.current,
  });

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
    );

    
  }
}

class Location {
  String type;
  List<String> coordinates;

  Location({
    this.type,
    this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      type: json['type'],
      coordinates: parseCoordinates(json['coordinates']),
    );
  }

  static List<String> parseCoordinates(coordinatesJson){
    List<String> coordinates = new List<String>();
    coordinates.add(coordinatesJson[0].toString());
    coordinates.add(coordinatesJson[1].toString());
    return coordinates;
  }
}

class Current {
  Weather weather;
  Pollution pollution;

  Current({
    this.weather,
    this.pollution,
  });

  factory Current.fromJson(Map<String, dynamic> json){
    return Current(
      weather: Weather.fromJson(json['weather']),
      pollution: Pollution.fromJson(json['pollution']),
    );
  }
}

class Weather {
  String ts;
  String tp;
  String pr;
  String hu;
  String ws;
  String wd;
  String ic;

  Weather({
    this.ts,
    this.tp,
    this.pr,
    this.hu,
    this.ws,
    this.wd,
    this.ic,
  });

  factory Weather.fromJson(Map<String, dynamic>json){
    return Weather(
      ts: json['ts'],
      tp: json['tp'].toString(),
      pr: json['pr'].toString(),
      hu: json['hu'].toString(),
      ws: json['ws'].toString(),
      wd: json['wd'].toString(),
      ic: json['ic'],
    );
  }
}

class Pollution {
  String ts;
  String aqius;
  String mainus;
  String aqicn;
  String maincn;

  Pollution({
    this.ts,
    this.aqius,
    this.mainus,
    this.aqicn,
    this.maincn,
  });

  factory Pollution.fromJson(Map<String, dynamic>json){
    return Pollution(
      ts: json['ts'],
      aqius: json['aqius'].toString(),
      mainus: json['mainus'].toString(),
      aqicn: json['aqicn'].toString(),
      maincn: json['maincn'].toString(),
    );
  }
}