import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class Favorite extends StatelessWidget{
  @override
  Widget build(BuildContext buildContext){
    final post = fetchPost();
    
    final appBar = AppBar(
      title: Text("Transaksi Baru"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        BadgeIconButton(
          itemCount: 1,
          icon: Icon(Icons.shopping_cart),
          badgeColor: Colors.red,
          badgeTextColor: Colors.white,
          hideZeroCount: true,
          onPressed: () {}
        ),
      ],
    );
    final userPicture = Hero(
      tag: 'userPicture',
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('lib/source/assets/gheaProfile.jpg'),
        ),
      ),
    );
    final drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Muhammad Nur Rachman"),
            accountEmail: Text("NurRachmen@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(buildContext).platform == TargetPlatform.iOS ? Colors.black : Colors.white,
              child: userPicture
            ),
          ),
          ListTile(
            title: Text("Transaksi"),
            leading: Icon(Icons.compare_arrows),
            onTap: () {},
          ),
          ListTile(
            title: Text("Pembayaran"),
            leading: Icon(Icons.payment),
            onTap: () {},
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: Center(
        child: FutureBuilder<Post>(
          future: post,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.body);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}