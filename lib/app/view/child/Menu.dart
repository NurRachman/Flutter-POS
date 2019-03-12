import 'package:flutter/material.dart';
import 'menu/All.dart';
import 'menu/Favorite.dart';
import 'package:badges/badges.dart';
import 'menu/Minuman.dart';

class Menu extends StatefulWidget {
  @override
  MenuSate createState() => MenuSate();
}

class MenuSate extends State<Menu>{
  
  int counterChart = 0;

  void addChart(_){
    setState(() {
     counterChart++; 
    });
  }

  void removeChart(_){
    setState(() {
     counterChart--; 
    });
  }

  final tabBar = TabBar(
    tabs: <Widget>[
      Tab( text: 'Makanan'),
      Tab( text: 'Minuman' ),
      Tab( text: 'Desert'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            bottom: tabBar,
            title: Text('Menu'),
            actions: <Widget>[
              BadgeIconButton(
                itemCount: counterChart,
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                badgeColor: Colors.red,
                badgeTextColor: Colors.white,
                hideZeroCount: true,
              ),
            ],
          ),
          body: TabBarView(
            children: [
              Minuman(),
              AllMenu(
                addChart: addChart,
                removeChart: removeChart,
              ),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}