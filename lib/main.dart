import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/sub-page.dart';
import 'package:my_first_flutter_app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_first_flutter_app/fuel.dart';
import 'package:my_first_flutter_app/tools.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Map<int, Color> color =
  {
    50:Color.fromRGBO(236, 215, 26, .1),
    100:Color.fromRGBO(236, 215, 26, .2),
    200:Color.fromRGBO(236, 215, 26, .3),
    300:Color.fromRGBO(236, 215, 26, .4),
    400:Color.fromRGBO(236, 215, 26, .5),
    500:Color.fromRGBO(236, 215, 26, .6),
    600:Color.fromRGBO(236, 215, 26, .7),
    700:Color.fromRGBO(236, 215, 26, .8),
    800:Color.fromRGBO(236, 215, 26, .9),
    900:Color.fromRGBO(236, 215, 26, 1),
  };

  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFFECD71A, color);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: colorCustom,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            elevation: 0, // This removes the shadow from all App Bars.
          )
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/3304.jpg"), context);
    precacheImage(AssetImage("assets/1084.jpg"), context);
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 20, top: 100, right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hey there!", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black87, fontSize: 42),),
                Text("you little Beta tester", style: TextStyle(fontWeight: FontWeight.w200, color: Colors.black87, fontSize: 20),),
              ]
            ),
          ),
        ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  Future firstCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("firstLaunch") == false) {
      _read();
      _readTools();
      Timer(
          Duration(seconds: 2),
              () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => SubPage())));
    } else {
      Timer(
          Duration(seconds: 2),
              () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage())));
    }
  }

  void initState() {
    firstCheck();
    super.initState();
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key7';
    final key2 = 'my_int_key8';
    final key3 = 'my_int_key9';
    final key4 = 'fuel_key';
    final key5 = 'name_key';
    final value = prefs.getStringList(key) ?? 0;
    final value2 = prefs.getStringList(key2) ?? 0;
    final value3 = prefs.getStringList(key3) ?? 0;
    final value4 = prefs.getStringList(key4) ?? 0;
    final value5 = prefs.getStringList(key5) ?? 0;
    print('read: $value');
    print('read: $value2');
    print('read: $value3');
    print('read: $value4');
    print('read: $value5');
    textList = value;
    textList2 = value2;
    textList3 = value3;
    fuelPriceList = value4;
    namesList = value5;
  }

  _readTools() async {
    final prefs = await SharedPreferences.getInstance();
    final key6 = 'title_tools_key';
    final key7 = 'description_tools_key';
    final key8 = 'date_tools_key';
    final key9 = 'price_tools_key';
    final value6 = prefs.getStringList(key6) ?? 0;
    final value7 = prefs.getStringList(key7) ?? 0;
    final value8 = prefs.getStringList(key8) ?? 0;
    final value9 = prefs.getStringList(key9) ?? 0;
    print('read: $value6');
    print('read: $value7');
    print('read: $value8');
    print('read: $value9');
    titleToolsList = value6;
    descriptionToolsList = value7;
    dateToolsList = value8;
    priceToolsList = value9;
  }
}
