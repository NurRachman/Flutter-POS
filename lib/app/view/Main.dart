import 'package:flutter/material.dart';
import '../helper/bottom bar/FABAnchoredOverlay.dart';
import '../helper/bottom bar/FABBottomAppBar.dart';
import 'child/Dashboard.dart';
import 'child/Menu.dart';
import 'child/Inbox.dart';
import 'child/Profile.dart';

class Main extends StatefulWidget{
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin{
  int positionTab = 0;
  void selectedTab(int index){
    setState(() {
      positionTab = index;
    });
  }
  @override
  Widget build(BuildContext context){
    
    final List<Widget> childRoutes = [
      Dashborad(),
      Menu(),
      Inbox(),
      Profile(),
    ];

    Widget buildFloatActionButton(BuildContext context){
      return AnchoredOverlay(
        showOverlay: false,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'transaction');
          },
          tooltip: 'Transaciton',
          child: Icon(Icons.add),
          elevation: 2.0,
        ),
      );
    }

    final fabBottomBar = FABBottomAppBar(
      centerItemText: '',
      color: Colors.grey,
      selectedColor: Colors.blueAccent,
      notchedShape: CircularNotchedRectangle(),
      onTabSelected: selectedTab,
      items: [
        FABBottomAppBarItem(iconData: Icons.menu, text: 'Dashboard'),
        FABBottomAppBarItem(iconData: Icons.layers, text: 'Menu'),
        FABBottomAppBarItem(iconData: Icons.inbox, text: 'Inbox'),
        FABBottomAppBarItem(iconData: Icons.account_circle, text: 'Profile'),
      ],
    );

    return Scaffold(
      bottomNavigationBar: fabBottomBar,
      floatingActionButton: buildFloatActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: childRoutes[positionTab],
    );
  }
}