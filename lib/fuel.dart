import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:my_first_flutter_app/login.dart';
import 'package:my_first_flutter_app/loginVehicleDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class FuelPage extends StatefulWidget {
  FuelPage({Key key}) : super(key: key);
  @override
  _FuelPageState createState() => _FuelPageState();
}

List<String> textList = [];
List<String> textList2 = [];
List<String> textList3 = [];
List<String> fuelPriceList = [];
List<String> namesList = [];

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
class _FuelPageState extends State<FuelPage> {
  TextEditingController myController = new TextEditingController();
  TextEditingController myController2 = new TextEditingController();
  TextEditingController myController3 = new TextEditingController();
  String control = "";
  String control2 = "";
  String control3 = "";
  String currDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  double liters = 0;
  double average = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 20, top: 100, right: 0, bottom: 6),
                                child: Row(
                                  children: [
                                    FadeHello(4,
                                      Text(
                                        "Hello, " + namesList[0] + "!",
                                        style: TextStyle(fontWeight: FontWeight.w700, color: const Color(0xff4B4B4B), fontSize: 31),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18, top: 0, right: 0, bottom: 0),
                              child: FadeHello(6, Row(
                                children: [
                                  GestureDetector(
                                    child: Icon(Icons.directions_car, color: const Color(0xffECD71A),),
                                    onDoubleTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                    },
                                  ),
                                  Text(
                                    "    " + namesList[1],
                                    style: TextStyle(fontWeight: FontWeight.w400, color: const Color(0xffECD71A), fontSize: 16),
                                  ),
                                  Text("             -" + liters.toStringAsFixed(2) + " zł", style: TextStyle(color: const Color(0xffB4B4B4),fontWeight: FontWeight.w500)),
                                ],
                              ),),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 100, right: 40),
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: const Color(0xffECD71A).withOpacity(0.4),
                          ),
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffECD71A),
                              ),
                              child: Text(average.toStringAsFixed(1), style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w500),)
                          ),
                        )
                      ],
                    ),
                  ),
                  FutureBuilder(
                    builder: (context, connection) {
                      return new Flexible(child:
                      new ListView.builder(
                        itemCount: textList.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          if(index == textList.length - 1)
                          {
                            return
                              Padding(
                                padding: const EdgeInsets.only(bottom:40),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left:19.0, right: 10.0),
                                      width: 22.0,
                                      height: 22.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xffECD71A).withOpacity(0.4),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.all(6.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(0xffECD71A),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          textList3[0],
                                          style: TextStyle(fontWeight: FontWeight.w500, color: const Color(0xffECD71A)),
                                        ),
                                        Text(
                                          textList[0] + "km",
                                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20, color: const Color(0xffB4B4B4)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                          }
                          else {
                            return new Dismissible(
                                key: Key(textList[textList.length - 1 - index]),
                                background: refreshBg(),
                                onDismissed: (direction) {
                                  setState(() {
                                    textList.removeAt(textList.length - 1 - index);
                                    textList2.removeAt(textList2.length - 1 - index);
                                    textList3.removeAt(textList3.length - 1 - index);
                                    fuelPriceList.removeAt(fuelPriceList.length - 1 - index);
                                  });
                                  _save();
                                  countPrices();
                                  countAvg();
                                },
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(left:19.0, right: 10.0),
                                              width: 22.0,
                                              height: 22.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: const Color(0xffECD71A).withOpacity(0.4),
                                              ),
                                              child: Container(
                                                margin: const EdgeInsets.all(6.0),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: const Color(0xffECD71A),
                                                ),
                                              )
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                textList3[textList3.length - 1 - index],
                                                style: TextStyle(fontWeight: FontWeight.w500, color: const Color(0xffECD71A)),
                                              ),
                                              Text(
                                                textList[textList.length - 1 - index] + "km",
                                                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20, color: const Color(0xffB4B4B4)),
                                              ),
                                            ]
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(left: 29.0, right: 12, top: 5, bottom: 5),
                                                width: 2.0,
                                                height: 120.0,
                                                decoration: BoxDecoration(
                                                    color: const Color(0xffECD71A),
                                                    border: Border.all(
                                                      color: const Color(0xffECD71A),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                                ),
                                              ),
                                              Container(
                                                height: 100,
                                                width: MediaQuery.of(context).size.width * 0.8,
                                                margin: const EdgeInsets.only(left: 10.0),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                                ),
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                                      child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(height:2),
                                                                Row(
                                                                  children: [
                                                                    Icon(RpgAwesome.water_drop, size: 20, color: const Color(0xffB4B4B4)),
                                                                    Text(" " + textList2[textList2.length - 1 - index] + "l",style: TextStyle(color: const Color(0xffB4B4B4), fontSize: 16, fontWeight: FontWeight.w300)),
                                                                  ]
                                                                ),
                                                                SizedBox(height:10),
                                                                Row(
                                                                  children: [
                                                                    Icon(Entypo.tag, size: 20, color: const Color(0xffB4B4B4)),
                                                                    Text(" " +  (double.parse(textList2[textList2.length - 1 - index]) * double.parse(fuelPriceList[fuelPriceList.length - 1 - index])).toStringAsFixed(2)  + "zł",style: TextStyle(color: const Color(0xffB4B4B4), fontSize: 16, fontWeight: FontWeight.w300)),
                                                                  ]
                                                                )
                                                              ],
                                                            ),
                                                          ]
                                                      ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.centerRight,
                                                    margin: const EdgeInsets.only(right: 40.0),
                                                    width: 60.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: const Color(0xffECD71A),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.2),
                                                          spreadRadius: 2,
                                                          blurRadius: 2,
                                                          offset: Offset(0, 0),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            ((double.parse(textList2[textList2.length - 1 - index]) / (double.parse(textList[textList.length - 1 - index]) - double.parse(textList[textList.length - 2 - index])))*100).toStringAsFixed(1),
                                                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28, color: Colors.white)
                                                        )
                                                    ),
                                                  ),
                                                ]
                                                )
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]
                                )
                            );
                          }
                        },
                      )
                      );
                    },
                  ),
                ],
              ),
            ),
          ]
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(child: Icon(Maki.fuel, color: Colors.white),backgroundColor: Colors.greenAccent,onPressed: (){
            showBottomSheet(context: context, builder: (context) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0)),
                color: const Color(0xffECD71A),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(-1, -1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesome.road, size: 32, color: Colors.white),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.5,
                            margin: const EdgeInsets.only(left: 20, top: 20.0, bottom: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: myController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'current mileage',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.greenAccent),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.greenAccent),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                contentPadding: EdgeInsets.only(left:20.0, bottom: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(RpgAwesome.water_drop, size: 32, color: Colors.white),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.5,
                            margin: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: myController2,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'liters',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.greenAccent),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.greenAccent),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                contentPadding: EdgeInsets.only(left:20.0, bottom: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Entypo.tag, size: 32, color: Colors.white),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.5,
                            margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: myController3,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'price per liter',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.greenAccent),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.greenAccent),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                contentPadding: EdgeInsets.only(left:20.0, bottom: 10),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors.greenAccent, // button color
                      child: InkWell(
                          splashColor: Colors.lightGreenAccent, // inkwell color
                          child: SizedBox(width: 60, height: 60, child: Icon(Icons.done, color: Colors.white, size: 32)),
                          onTap: () {
                            if (myController.text != "" && myController2.text != "" && myController3.text != "")
                            {
                              setState(() {
                                control = myController.text;
                                control2 = myController2.text;
                                control3 = myController3.text;
                                textList.add(myController.text.replaceAll(new RegExp(r"\s+"), "").replaceAll(",", "."));
                                textList2.add(myController2.text.replaceAll(new RegExp(r"\s+"), "").replaceAll(",", "."));
                                textList3.add(currDate.toString());
                                fuelPriceList.add(myController3.text.replaceAll(new RegExp(r"\s+"), "").replaceAll(",", "."));
                              });
                              _save();
                              countPrices();
                              countAvg();
                              myController.clear();
                              myController2.clear();
                              myController3.clear();
                              Navigator.of(context).pop();
                            }
                          }
                      ),
                    ),
                  ),
                ],
              ),
            ));
          }),
        ),
      ),
    );
  }

  Widget refreshBg() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        color: Colors.redAccent,
      ),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  @override
  void initState() {
    _read();
    countPrices();
    countAvg();
    super.initState();
  }

  void countPrices() {
    liters = 0;
    String currMonth = DateFormat('MM').format(DateTime.now()).toString();
    String currYear = (DateTime.now().year).toString();
    for( var i = 1; i <= textList.length - 1; i++ ) {
      List tempDatesList = textList3[i].split(".");
      if (tempDatesList[1] == currMonth && tempDatesList[2] == currYear){
        setState(() {
          liters += (double.parse(textList2[textList.length - i])  * double.parse(fuelPriceList[textList.length - i]));
        });
      }
    }
  }

  void countAvg() {
    double tempAvg = 0;
    for (var i = 1; i <= textList.length - 1; i++) {
        tempAvg += (double.parse(textList2[textList.length - i]) / (double.parse(textList[textList.length - i]) - double.parse(textList[textList.length - i - 1])));
    }
    setState(() {
      average = tempAvg * 100 / (textList.length - 1);
      if (average.isNaN)
        average = 0;
    });
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key7';
    final key2 = 'my_int_key8';
    final key3 = 'my_int_key9';
    final key4 = 'fuel_key';
    final key5 = 'name_key';
    final value = textList;
    final value2 = textList2;
    final value3 = textList3;
    final value4 = fuelPriceList;
    final value5 = namesList;
    prefs.setStringList(key, value);
    prefs.setStringList(key2, value2);
    prefs.setStringList(key3, value3);
    prefs.setStringList(key4, value4);
    prefs.setStringList(key5, value5);
    print('saved $value');
    print('saved $value2');
    print('saved $value3');
    print('saved $value4');
    print('saved $value5');
  }
}