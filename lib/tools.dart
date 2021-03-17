import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:my_first_flutter_app/login.dart';
import 'package:my_first_flutter_app/loginVehicleDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class ToolsPage extends StatefulWidget {
  ToolsPage({Key key}) : super(key: key);
  @override
  _ToolsPageState createState() => _ToolsPageState();
}

List<String> titleToolsList = [];
List<String> descriptionToolsList = [];
List<String> dateToolsList = [];
List<String> priceToolsList = [];

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
class _ToolsPageState extends State<ToolsPage> {
  TextEditingController myController = new TextEditingController();
  TextEditingController myController2 = new TextEditingController();
  TextEditingController myController3 = new TextEditingController();
  String control = "";
  String control2 = "";
  String control3 = "";
  String currDate = DateFormat('dd.MM.yyyy').format(DateTime.now());

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
                    FutureBuilder(
                      builder: (context, connection) {
                        return new Flexible(
                          child: new ListView.builder(
                            itemCount: titleToolsList.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return new Padding(
                                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                                child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "   " + dateToolsList[dateToolsList.length - 1 - index],
                                            style: TextStyle(fontWeight: FontWeight.w500, color: const Color(0xffECD71A)),
                                          ),
                                        Stack(
                                          overflow: Overflow.clip,
                                          children: <Widget>[
                                            refreshBg(),
                                            Dismissible(
                                              key: Key(titleToolsList[titleToolsList.length - 1 - index]),
                                              onDismissed: (direction) {
                                                setState(() {
                                                  titleToolsList.removeAt(titleToolsList.length - 1 - index);
                                                  descriptionToolsList.removeAt(descriptionToolsList.length - 1 - index);
                                                  dateToolsList.removeAt(dateToolsList.length - 1 - index);
                                                  priceToolsList.removeAt(priceToolsList.length - 1 - index);
                                                });
                                                _saveTools();
                                              },
                                              child:
                                              Container(
                                                  margin: const EdgeInsets.only(top: 5),
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                                  ),
                                                  child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 20, left: 20, right: 0, bottom: 10),
                                                          child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      titleToolsList[titleToolsList.length - 1 - index],
                                                                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black45),
                                                                    ),

                                                                  ]
                                                                ),
                                                                SizedBox(height: 5),
                                                                Container(
                                                                    width: MediaQuery.of(context).size.width * 0.55,
                                                                    child: Wrap(
                                                                      spacing: 8,
                                                                      runSpacing: 4,
                                                                      children: [
                                                                        Text(
                                                                            descriptionToolsList[descriptionToolsList.length - 1 - index],
                                                                            style: TextStyle(color: const Color(0xffB4B4B4), fontSize: 14, fontWeight: FontWeight.w300)
                                                                        ),
                                                                      ],
                                                                    )
                                                                )
                                                              ]
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(top: 20, right: 20),
                                                            child: Text(
                                                                priceToolsList[priceToolsList.length - 1 - index] + "zł",
                                                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black45)
                                                            )
                                                        )
                                                      ]
                                                  )
                                              ),
                                            )
                                          ],
                                        ),
                                    ]
                                )
                              );
                            }
                          )
                        );
                      }
                    )
                  ]
              )
            )
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
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: TextFormField(
                      controller: myController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'title',
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: myController2,
                      minLines: 4,
                      maxLines: 4,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'description',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        contentPadding: EdgeInsets.only(left:20.0, top: 10),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: myController3,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'price',
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
                  ClipOval(
                    child: Material(
                      color: Colors.greenAccent, // button color
                      child: InkWell(
                          splashColor: Colors.lightGreenAccent, // inkwell color
                          child: SizedBox(width: 60, height: 60, child: Icon(Icons.done, color: Colors.white, size: 32)),
                          onTap: () {
                            if (myController.text != "" && myController3.text != "")
                            {
                              setState(() {
                                control = myController.text;
                                control2 = myController2.text;
                                control3 = myController3.text;
                                titleToolsList.add(myController.text);
                                descriptionToolsList.add(myController2.text);
                                dateToolsList.add(currDate.toString());
                                priceToolsList.add(myController3.text.replaceAll(new RegExp(r"\s+"), "").replaceAll(",", "."));
                              });
                              _saveTools();
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
      height: 100,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  @override
  void initState() {
    _readTools();
    super.initState();
  }

  _saveTools() async {
    final prefs = await SharedPreferences.getInstance();
    final key6 = 'title_tools_key';
    final key7 = 'description_tools_key';
    final key8 = 'date_tools_key';
    final key9 = 'price_tools_key';
    final value6 = titleToolsList;
    final value7 = descriptionToolsList;
    final value8 = dateToolsList;
    final value9 = priceToolsList;
    prefs.setStringList(key6, value6);
    prefs.setStringList(key7, value7);
    prefs.setStringList(key8, value8);
    prefs.setStringList(key9, value9);
    print('saved $value6');
    print('saved $value7');
    print('saved $value8');
    print('saved $value9');
  }
}