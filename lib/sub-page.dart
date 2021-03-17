import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:my_first_flutter_app/login.dart';
import 'package:my_first_flutter_app/loginVehicleDetails.dart';
import 'package:my_first_flutter_app/tools.dart';
import 'package:my_first_flutter_app/fuel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class SubPage extends StatefulWidget {
  SubPage({Key key}) : super(key: key);
  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    FuelPage(),
    ToolsPage(),
    FuelPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Maki.fuel),
              title: new Text('Fuel'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesome5.tools, size: 20,),
              title: new Text('Tools'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.multiline_chart),
                title: Text('Chart')
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}