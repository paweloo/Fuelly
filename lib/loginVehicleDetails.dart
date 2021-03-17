import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:my_first_flutter_app/sub-page.dart';
import 'package:my_first_flutter_app/fuel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:page_transition/page_transition.dart';

class LoginVehicleDetailsPage extends StatefulWidget {
  LoginVehicleDetailsPage({Key key}) : super(key: key);
  @override
  _LoginVehicleDetailsPageState createState() => _LoginVehicleDetailsPageState();
}

class _LoginVehicleDetailsPageState extends State<LoginVehicleDetailsPage> with TickerProviderStateMixin {

  AnimationController _scale2Controller;
  Animation<double> _scale2Animation;

  TextEditingController myController = new TextEditingController();
  TextEditingController myController2 = new TextEditingController();
  TextEditingController myController3 = new TextEditingController();
  String control = "";
  String control2 = "";
  String control3 = "";
  String currDate = DateFormat('dd.MM.yyyy').format(DateTime.now());

  bool hideIcon = false;

  @override
  Widget build(BuildContext context) {

    TextEditingController myController2 = new TextEditingController();
    String control2 = "";

    return Scaffold(
        backgroundColor: const Color(0xffffbe2e),
        body: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  child:
                  FadeInLeft(6,Image(image: AssetImage('assets/1084.jpg'),height: 320,)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, top: 100, right: 40, bottom: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeTopBottom(2,
                          RichText(
                            text: TextSpan(
                              text: 'Nice to meet you,\n',
                              style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 37),
                              children: <TextSpan>[
                                TextSpan(text: namesList[0], style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 32))),
                              ],
                            ),
                          ),
                          ),
                          SizedBox(height: 88,),
                          Center(
                              child: Column(
                                children: [
                                  Text("How do you call your vehicle?", style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 21),),
                                  Container(
                                    padding: const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 40),
                                    width: 280,
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                      controller: myController3,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        contentPadding: EdgeInsets.only(left:20.0, right:10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Text("Whats's its mileage?", style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 21),),
                                  Container(
                                    padding: const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 40),
                                    width: 160,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                      controller: myController,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        contentPadding: EdgeInsets.only(left:20.0, right:10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ]
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: AnimatedBuilder(
                    animation: _scale2Controller,
                    builder: (context, child) => Transform.scale(
                    scale: _scale2Animation.value,
                  child: GestureDetector(
                    onTap: () {
                      if (myController.text != "" && myController3.text != "")
                      {
                        setState(() {
                          control = myController.text;
                          control3 = myController3.text;
                          namesList.add(myController3.text);
                          textList.add(myController.text.replaceAll(new RegExp(r"\s+"), "").replaceAll(",", "."));
                          textList2.add("0");
                          textList3.add(currDate);
                          fuelPriceList.add("0");
                        });
                        setFirst(false);
                        _save();
                        hideIcon = true;
                        _scale2Controller.forward();
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
                        child: hideIcon == false ? Container(
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
                          child: Icon(Icons.done, color: Colors.white,size: 38,),
                        ) : Container()
                    ),
                  ))),
                ),
                Positioned(
                  right: 90,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {
                        setState(() {
                          textList.clear();
                          textList2.clear();
                          textList3.clear();
                          fuelPriceList.clear();
                        });
                        setFirst(true);
                        _save();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red
                        ),
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.redAccent,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Icon(Icons.delete, color: Colors.white,size: 32,),
                        )
                    ),
                  ),
                ),
                Positioned(
                  right: 170,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
                    },
                    child: Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.amber
                        ),
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.amberAccent,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Icon(Icons.navigate_next, color: Colors.white,size: 32,),
                        )
                    ),
                  ),
                )
              ],
            )
        ),
    );
  }

  void initState() {
    super.initState();

    _scale2Controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300)
    );

    _scale2Animation = Tween<double>(
        begin: 1.0,
        end: 32.0
    ).animate(_scale2Controller)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SubPage()));
      }
    });
  }

  Future setFirst(bool x) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("firstLaunch", x);
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

class FadeInLeft extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeInLeft(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0))
      ..add(_AniProps.translateX, (-12.0).tweenTo(0.0));

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

class FadeTopBottom extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeTopBottom(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0))
      ..add(_AniProps.translateX, (-20.0).tweenTo(0.0));

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: (50 * delay).round().milliseconds,
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

class FadeHello extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeHello(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0))
      ..add(_AniProps.translateX, (-6.0).tweenTo(0.0));

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: (50 * delay).round().milliseconds,
      duration: 400.milliseconds,
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