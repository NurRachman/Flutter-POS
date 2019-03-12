import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  @override
  TransactionState createState() => TransactionState();
}

class TransactionState extends State<Transaction>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.pushNamed(context, '/');
          },
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}