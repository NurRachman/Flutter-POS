import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../view//component//ItemsMenuV2.dart';

class Dashborad extends StatefulWidget {

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 5),
      LinearSales(1, 25),
      LinearSales(2, 100),
      LinearSales(3, 75),
      LinearSales(4, 75),
      LinearSales(5, 75),
      LinearSales(6, 75),
      LinearSales(7, 75),
      LinearSales(8, 75),
    ];
    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  DashboardState createState() => DashboardState(_createSampleData());
}

class DashboardState extends State<Dashborad>{
  final List<charts.Series> seriesList;
  final bool animate;
  var clicked = false;
  var amount = 0;

  DashboardState(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        primary: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              height: 200,
              child: charts.LineChart(
                seriesList,
                animate: false,
                defaultRenderer: charts.LineRendererConfig(includePoints: true),
              )
            ),
            ItemsMenuV2()
          ],
        ),
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}