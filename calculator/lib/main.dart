import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:calculator/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:soundpool/soundpool.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  final TextEditingController _textFController = TextEditingController();
  var text = "".obs;
  Soundpool pool = Soundpool(streamType: StreamType.notification);
  int soundId;

  @override
  void initState() {
    super.initState();
    _loadSound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                height: 200,
                child: Column(
                  children: [
                    AutoSizeTextField(
                      readOnly: true,
                      cursorColor: Colors.white,
                      textAlign: TextAlign.end,
                      controller: _textFController,
                      maxLines: 1,
                      autofocus: true,
                      presetFontSizes: [
                        100,
                        95,
                        90,
                        85,
                        80,
                        75,
                        70,
                        60,
                        50,
                        40,
                      ],
                      maxFontSize: 100,
                      minFontSize: 40,
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        text(value);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 1),
                        border: InputBorder.none,
                      ),
                    ),
                    Container(
                      child: Obx(
                        () => AutoSizeText(
                          text.value,
                          maxLines: 1,
                          minFontSize: 20,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding:
                    EdgeInsets.only(top: 20, right: 5, left: 5, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(
                          text: "C",
                          onClick: () {
                            playSound();
                            type('', clear: true);
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "%",
                          onClick: () {
                            type("");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "3",
                          onClick: () {
                            type("3");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "",
                          icon: Icon(
                            Icons.backspace_outlined,
                            size: 35,
                          ),
                          onClick: () {
                            type("", clear: true);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(
                          text: "1",
                          onClick: () {
                            playSound();
                            type("1");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "2",
                          onClick: () {
                            type("2");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "3",
                          onClick: () {
                            type("3");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "+",
                          icon: Icon(
                            MaterialCommunityIcons.plus,
                            size: 34,
                          ),
                          onClick: () {
                            type("+");
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(
                          text: "4",
                          onClick: () {
                            type("4");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "5",
                          onClick: () {
                            type("5");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "6",
                          onClick: () {
                            type("6");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "-",
                          icon: Icon(
                            MaterialCommunityIcons.minus,
                            size: 34,
                          ),
                          onClick: () {
                            type("-");
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(
                          text: "7",
                          onClick: () {
                            type("7");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "8",
                          onClick: () {
                            type("8");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "9",
                          onClick: () {
                            type("9");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "x",
                          icon: Icon(
                            MaterialCommunityIcons.close,
                            size: 34,
                          ),
                          onClick: () {
                            type("x");
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(
                          text: "0",
                          width: 128,
                          onClick: () {
                            type("");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "=",
                          icon: Icon(
                            MaterialCommunityIcons.equal,
                            size: 34,
                          ),
                          onClick: () {
                            type("=");
                          },
                        ),
                        SizedBox(width: 3),
                        Button(
                          text: "/",
                          icon: Icon(
                            MaterialCommunityIcons.division,
                            size: 34,
                          ),
                          onClick: () {
                            type("/");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void type(String txt, {clear = false}) {
    if (clear) {
      _textFController.text = "";
    } else {
      _textFController.text = _textFController.text + txt.toString();
    }
  }

  void playSound() async {
    await pool.play(soundId);
  }

  _loadSound() async {
    soundId = await rootBundle
        .load("assets/sounds/Click-Warm.wav")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
  }
}
