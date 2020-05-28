import 'package:flutter/material.dart';
import 'package:weather/pages/current.dart';
import 'package:weather/pages/location.dart';
import 'package:weather/pages/about.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    Color text_color;
    print (data['icon']);

    switch(data['icon']) {
      case "01d":
        data["background"] = "clearsky.gif";
        text_color = Colors.black;
        break;
      case "01n":
        data["background"] = "clear_sky_night.gif";
        data["text_color"] = Colors.white;
        break;
      case "02d":
      case "03d":
      case "04d":
        data["background"] = "day_cloudy.gif";
        data["text_color"] = Colors.amberAccent;
        break;
      case "02n":
        data["background"] = "night_cloudy.gif";
        data["text_color"] = Colors.redAccent;
        break;
      case "09d":
      case "10d":
      case "10n":
        data["background"] = "rainy.gif";
        data["text_color"] = Colors.redAccent;
        break;
      case "11d":
      case "11n":
        data["background"] = "thunderstorm.gif";
        data["text_color"] = Colors.redAccent;
        break;
      default:
        data["background"] = "rainy.gif";
        data["text_color"] = Colors.redAccent;
    }

    final tabs = [
      Current.getWidget(context, data),
      LocationFinder.getWidget(context, data["latitude"], data["longitude"]),
      About(),
    ];

    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 20,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        backgroundColor: Colors.grey[800],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_location),
            title: Text('Location'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('About'),
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          setState((){
            _currentIndex = index;
          });
        },
      ),
    );
  }
}