import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather/pages/line_chart.dart';

class Current {
  static getWidget(BuildContext context, Map data) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/${data['background']}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 60.0, 0, 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${data['city']}',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: data['text_color'],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  '${data['currentLocalDate']}',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Icon(
                      WeatherIcons.thermometer,
                      size: 30.0,
                      color: data['text_color'],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${data['temperature']} °C",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: data['text_color'],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      WeatherIcons.humidity,
                      size: 30.0,
                      color: data['text_color'],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${data['humidity']} %",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 20.0, color: data['text_color']),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Icon(
                      WeatherIcons.barometer,
                      size: 30.0,
                      color: data['text_color'],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${data['pressure']} KPa",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: data['text_color'],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      WeatherIcons.wind,
                      size: 30.0,
                      color: data['text_color'],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${data['wind']} m/s",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: data['text_color'],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Icon(
                      WeatherIcons.sunrise,
                      size: 30.0,
                      color: data['text_color'],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${data['sunrise']}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: data['text_color'],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      WeatherIcons.sunset,
                      size: 30.0,
                      color: data['text_color'],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${data['sunset']}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: data['text_color'],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Icon(
                      WeatherIcons.moonrise,
                      size: 30.0,
                      color: data['text_color'],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${data['moonrise']}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: data['text_color'],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      WeatherIcons.moonset,
                      size: 30.0,
                      color: data['text_color'],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${data['moonset']}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: data['text_color'],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: LineChart(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
