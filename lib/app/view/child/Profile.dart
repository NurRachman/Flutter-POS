import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  ProfileSate createState() => ProfileSate();
}

class ProfileSate extends State<Profile>{

  final detailProfile = Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(top: 2),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Muhammad NurRachman',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
            ),
            Text(
              'UBAH',
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
        SizedBox(height: 2),
        Text(
          'NurRachmen@kariawan.com',
        ),
        SizedBox(height: 10),
        Text(
          '+6282249406141',
        ),
      ],
    ),
  );

  final spaceBetween = SizedBox(
    height: 16,
    child: Container(
      color: Colors.grey[200],
    ),
  );

  final terhubungSebagai = Container(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Tersambung Sebagai',
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 14
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: <Widget>[
            Image(
              image: AssetImage('lib/app/assets/fb_icon_325x325.png'),
              width: 25,
              height: 25,
            ),
            SizedBox(width: 16),
            Text(
              'Muhammad Nur Rachman',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        )
      ],
    ),
  );

  final sisawaktu = Container(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Siswa Waktu Shift',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14
              ),
            ),
            Text(
              '05:21:17',
              style: TextStyle(
                fontSize: 16
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        GestureDetector(
          onTap: (){
            print('This Works');
          },
          child: Text(
            'AKHIRI SEKARANG',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        primary: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white54,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          detailProfile,
          spaceBetween,
          terhubungSebagai,
          spaceBetween,
          sisawaktu
        ],
      ),
    );
  }
}