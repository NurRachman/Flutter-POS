import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  @override
  InboxSate createState() => InboxSate();
}

class InboxSate extends State<Inbox>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        primary: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Init Inbox',
          style: TextStyle(
            fontSize: 24.0
          )
        ),
      ),
    );
  }
}