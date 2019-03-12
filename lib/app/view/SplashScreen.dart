import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  StateSplashScreen createState() => StateSplashScreen();
}

class StateSplashScreen extends State<SplashScreen> {
  
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), () =>_handleAuth());
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.blue[800],
              Colors.blue[700],
              Colors.blue[600],
              Colors.blue[500],
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "POS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 44.0
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 2.0,
                    height: 44.0,
                  )
                ],
              )
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Muhammad Nur Rachman',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Point Of Sales',
                    style: TextStyle(
                      color: Colors.white54
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  _handleAuth() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var auth = sharedPreferences.getBool('auth') ?? false;
    if (auth) {
      Navigator.pushNamedAndRemoveUntil(context, 'main', (Route<dynamic> rotute) => false);      
    }else{
      Navigator.pushNamedAndRemoveUntil(context, 'login', (Route<dynamic> rotute) => false);
    }
  }

}