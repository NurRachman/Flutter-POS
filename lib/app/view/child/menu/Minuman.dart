import 'package:flutter/material.dart';
import '../../component//ItemsMenuV2.dart';

class Minuman extends StatefulWidget{
  @override
  _StateMinuman createState() => _StateMinuman();
}

class _StateMinuman extends State<Minuman>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) => ItemsMenuV2(),
        ),
      )
    );
  }  
}