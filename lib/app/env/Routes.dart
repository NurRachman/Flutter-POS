import 'package:flutter/material.dart';
import '../view/Login.dart';
import '../view/Main.dart';
import '../view/Transaction.dart';
import '../view/SplashScreen.dart';

final routes = <String, WidgetBuilder>{
  '/' : (context) => SplashScreen(),
  'login' : (contet) => Login(),
  'main' : (context) => Main(),
  'transaction' : (context) => Transaction(),
};