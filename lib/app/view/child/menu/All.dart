import 'package:flutter/material.dart';
import 'package:rachman_pos/app/view/component/ItemsMenu.dart';

class AllMenu extends StatefulWidget{
  final ValueChanged<void> addChart;
  final ValueChanged<void> removeChart;

  const AllMenu({
    Key key,
    this.addChart,
    this.removeChart,
  }) : super (key :key);

  @override
  _StateAllMenu createState() => _StateAllMenu();
}

class _StateAllMenu extends State<AllMenu>{

  int counterItems = 0;

  @override
  void initState(){
    super.initState();
    counterItems = counterItems ?? 0;
  }

  void _incrementItems(_){
    setState(() {
      counterItems++; 
    });
  }

  void decrementItems(_){
    setState(() {
     counterItems--; 
    });
  }

  void _addChart(_){
    widget.addChart(null);
  }

  void _removeChart(_){
    widget.removeChart(null);    
  }

  var data = [
    {
      "image" : "lib/app/assets/dummyImage.png",
      "menu" : "Mie Ayam",
      "description" : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "price" : "10.000"
    },
    {
      "image" : "lib/app/assets/dummyImage.png",
      "menu" : "Ayam Mie",
      "description" : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "price" : "15.000"
    },
    {
      "image" : "lib/app/assets/dummyImage.png",
      "menu" : "Jus Jeruk",
      "description" : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "price" : "12.000"
    },
    {
      "image" : "lib/app/assets/dummyImage.png",
      "menu" : "ES Kerim",
      "description" : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "price" : "14.000"
    },
    {
      "image" : "lib/app/assets/dummyImage.png",
      "menu" : "Gula Jawa",
      "description" : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "price" : "17.000"
    },
    {
      "image" : "lib/app/assets/dummyImage.png",
      "menu" : "Tahu,Tempe,Sambel & lalaban",
      "description" : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "price" : "16.000"
    },
    {
      "image" : "lib/app/assets/dummyImage.png",
      "menu" : "Nasi",
      "description" : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "price" : "21.000"
    }
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) => ItemsMenu(
                  dataState: data[index],
                  incrementItems: _incrementItems,
                  decrementItems: decrementItems,
                  addChart : _addChart,
                  removeChart : _removeChart
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }  
}