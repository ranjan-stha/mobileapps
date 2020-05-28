import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:weather/line_graph.dart';

class LineChart extends StatefulWidget {
  LineChart(): super();
  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List<charts.Series> seriesList;
  bool animate;

  static List<charts.Series<LineGraphModel, int>> _createSampleData() {
    final data = [
      LineGraphModel(xAxis: 0, yAxis: 20),
      LineGraphModel(xAxis: 1, yAxis: 24),
      LineGraphModel(xAxis: 2, yAxis: 26),
      LineGraphModel(xAxis: 3, yAxis: 28),
      LineGraphModel(xAxis: 4, yAxis: 25),
      LineGraphModel(xAxis: 5, yAxis: 23),
    ];

    return [
      charts.Series<LineGraphModel, int>(
        id: 'Data',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LineGraphModel data, _) => data.xAxis,
        measureFn: (LineGraphModel data, _) => data.yAxis,
        data: data,
      ),
    ];
  }  

  @override
  void initState() {
    super.initState();
    seriesList = _createSampleData();
    animate = true;
  }

  @override
  Widget build(BuildContext context) {
    var axis = charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          lineStyle: charts.LineStyleSpec(color: charts.MaterialPalette.black,),
          labelStyle: charts.TextStyleSpec(
            fontSize: 12, color: 
            charts.MaterialPalette.black
          ),
        ),
    );
    return charts.LineChart(
      seriesList,
      animate: animate,
      animationDuration: Duration(seconds: 3),
      domainAxis: axis,
      primaryMeasureAxis: axis,
      behaviors: [
          new charts.ChartTitle('Temperature Prediction',
          behaviorPosition: charts.BehaviorPosition.top,
          titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
          new charts.ChartTitle('Values',
          behaviorPosition: charts.BehaviorPosition.start,
          titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
      ],
    );
  }
}
