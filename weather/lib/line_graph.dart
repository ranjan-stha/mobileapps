import 'package:charts_flutter/flutter.dart' as charts;

class FeaturesDataModel {
  String date;
  Map<String, Features> features;

  FeaturesDataModel({this.date, this.features});
}

class Features {
  List<double> temperature;
  List<double> humidity;
  List<double> airPressure;
}

class LineGraphModel {
  int xAxis;
  int yAxis;

  LineGraphModel({
    this.xAxis,
    this.yAxis,
  });
}