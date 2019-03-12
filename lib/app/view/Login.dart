import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/shape/LoginShape.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login>{
  // Initial State
  TextEditingController _username, _password;
  var errorUsername, errorPassword, isVisible = true;

  @override
  void initState(){
    super.initState();
    _username = new TextEditingController();
    _username.addListener((){
      setState(() {
       errorUsername = null; 
      });
    });
    _password = new TextEditingController();
    _password.addListener((){
      setState(() {
       errorPassword = null; 
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
  // Style Outline Start
  //   final outlineFocused = OutlineInputBorder(
  //     borderSide: BorderSide(
  //         color: Colors.blueAccent,
  //         width: 3.0
  //       ),
  //       borderRadius: BorderRadius.circular(8)
  //   );

  //   final outlineLostFocused = OutlineInputBorder(
  //   borderSide: BorderSide(
  //       color: Colors.blueAccent,
  //       width: 2.0
  //     ),
  //     borderRadius: BorderRadius.circular(8)
  // );
  // Style Outline End

  // Form Input
  final username = TextFormField(
    keyboardType: TextInputType.text,
    autofocus: true,
    controller: _username,
    textInputAction: TextInputAction.next,
    maxLines: 1,
    obscureText: false,
    decoration: InputDecoration(
      // focusedBorder: outlineFocused,
      // enabledBorder: outlineLostFocused,
      // border: OutlineInputBorder(),
      hintText: "Username",
      // contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      labelText: 'Username',
      icon: Icon(Icons.account_circle),
      errorText: errorUsername
    ),
  );

  final password = TextFormField(
    keyboardType: TextInputType.text,
    autofocus: true,
    obscureText: isVisible,
    controller: _password,
    maxLines: 1,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      // border: OutlineInputBorder(),
      // focusedBorder: outlineFocused,
      // enabledBorder: outlineLostFocused,
      hintText: "Password",
      // contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      labelText: 'Password',
      // labelStyle: TextStyle(
      //   color: Colors.black
      // )
      icon: Icon(Icons.vpn_key),
      suffixIcon: IconButton(
        icon: Icon(isVisible ? Icons.remove_red_eye : Icons.panorama_fish_eye),
        onPressed: (){
          setState(() {
            isVisible = !isVisible; 
          });
        },
      ),
      errorText: errorPassword
    ),
  );
  // Form Input

  final loginButton = Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(8),
    child: MaterialButton(
      minWidth: double.infinity,
      onPressed: (){
        if (_username.text.isNotEmpty && _username.text.toLowerCase() == "nurrachman" && _password.text.isNotEmpty && _password.text.toLowerCase() == "1234") {
          _authLogin(true);
          Navigator.pushNamedAndRemoveUntil(context, 'main', (Route<dynamic> rotute) => false);
        } else {
          _authLogin(false);
          // displayDialog();
          setState(() {
           errorPassword = "Password Salah";
           errorUsername = "Username Salah"; 
          });
        }
      },
    color: Colors.blueAccent,
    child: Text('Masuk', style: TextStyle(color: Colors.white)),
    ),
  );

  final headerLogin = Stack(
    children: <Widget>[
      ClipPath(
        clipper: LoginShape(),
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue[800],
                Colors.blue[700],
                Colors.blue[600],
                Colors.blue[500],
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "POS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 2.0,
                    height: 35.0,
                  )
                ],
              ),
              Row(
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
            ],
          ),
        ),
      ),
    ],
  );

  return Scaffold(
    body: Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            headerLogin,
            Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 32.0),
                    Text(
                      'Lengkapi Form Berikut Untuk Masuk',
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 16.0),
                    username,
                    SizedBox(height: 16.0),
                    password,
                    SizedBox(height: 8.0),
                    loginButton
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )
  );
 }

 void displayDialog(){
   showDialog(
    context: context,
    builder: (BuildContext buildContext){
      return AlertDialog(
        title: Text("NuraPOS"),
        content: Text("Username and Password Wong"),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      );
    }
  );
 }
}

_authLogin(bool authLogin) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setBool('auth', authLogin);
}