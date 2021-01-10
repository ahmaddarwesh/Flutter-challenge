import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Button extends StatefulWidget {
  final text;
  final onClick;
  final double width;
  final double height;
  final Icon icon;

  Button({this.text, this.onClick, this.width, this.height, this.icon});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  double depth = 5;
  double textSize = 55;
  bool isEnableBorder = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTapCancel: () {
          setState(() {
            depth = 5;
            textSize = 55;
          });
        },
        onTapDown: (e) {
          widget.onClick();
          setState(() {
            depth = -30;
            textSize = 52;
          });
        },
        onTapUp: (e) {
          setState(() {
            depth = 5;
            textSize = 55;
          });
        },
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: depth,
            intensity: 1,
            shape: NeumorphicShape.concave,
            surfaceIntensity: 0.5,
            color: Colors.white,
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(60),
            ),
          ),
          padding: EdgeInsets.all(20),
          duration: Duration(milliseconds: 100),
          child: Container(
            width: widget.width ?? 40,
            height: widget.height ?? 40,
            alignment: Alignment.center,
            child: widget.icon ??
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 100),
                  style: TextStyle(
                    fontSize: textSize,
                    height: 1,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  child: Text(widget.text),
                ),
          ),
        ),
      ),
    );
  }
}
