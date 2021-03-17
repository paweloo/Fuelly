import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_first_flutter_app/sub-page.dart';
import 'package:my_first_flutter_app/fuel.dart';
import 'package:my_first_flutter_app/loginVehicleDetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future navigateToLoginDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginVehicleDetailsPage()));
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController myController2 = new TextEditingController();
    String control2 = "";

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: const Color(0xff39A2FE),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 100, right: 40, bottom: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeTopBottom(2,
                      Text("Hey there!", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 37),)),
                      FadeTopBottom(2,
                      RichText(
                        text: TextSpan(
                          text: 'Welcome to ',
                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 21),
                          children: <TextSpan>[
                            TextSpan(text: 'Fuelly', style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 21))),
                          ],
                        ),
                      )),
                      SizedBox(height: 88,),
                      Center(
                        child: Column(
                          children: [
                            Text("What's your name?", style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 21),),
                            Container(
                              padding: const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 40),
                              width: 280,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                                controller: myController2,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  contentPadding: EdgeInsets.only(left:20.0, right:10.0),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (myController2.text != "")
                                {
                                  setState(() {
                                    control2 = myController2.text;
                                    if(namesList.length != 0) {
                                      namesList.clear();
                                    }
                                    namesList.add(myController2.text.replaceAll(new RegExp(r"\s+"), ""));
                                  });
                                  _save();
                                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: LoginVehicleDetailsPage()));
                                }
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff0cd973)
                                ),
                                child: Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: const Color(0xff11f885),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                child: Icon(Icons.navigate_next, color: Colors.white,size: 42,),
                                )
                              ),
                            )
                          ],
                        )
                      ),
                    ]
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FadeIn(4, Image(image: AssetImage('assets/3304.jpg'),height: 350,)),
              ],),
            ],
          )
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: LoginVehicleDetailsPage()));
            _read();
          },
          tooltip: 'Increment',
          child: Icon(Icons.navigate_next, color: Colors.white,),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
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

enum _AniProps { opacity, translateX }

class FadeIn extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeIn(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0))
      ..add(_AniProps.translateX, 12.0.tweenTo(0.0));

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: (100 * delay).round().milliseconds,
      duration: 800.milliseconds,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
          offset: Offset(value.get(_AniProps.translateX), 0),
          child: child,
        ),
      ),
    );
  }
}
