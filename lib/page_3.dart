import 'package:flutter/material.dart';
//import 'dart:async';
// ignore: unused_import
//import 'package:flutter/services.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:imagebutton/imagebutton.dart';

class ThirdPage extends StatelessWidget {
  final int breakTime;

  const ThirdPage({Key key, this.breakTime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MyTimer(
        title: 'Break Time',
        breakTime: breakTime,
      ),
    );
  }
}

class MyTimer extends StatefulWidget {
  final String title;
  final int breakTime;
  MyTimer({Key key, this.title, this.breakTime}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyTimerState();
  }
}

class MyTimerState extends State<MyTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('${widget.title}',
                  style: TextStyle(fontSize: 20, color: Colors.white))),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularCountDownTimer(
                // Countdown duration in Seconds
                duration: widget.breakTime,

                // Width of the Countdown Widget
                width: MediaQuery.of(context).size.width / 2,

                // Height of the Countdown Widget
                height: MediaQuery.of(context).size.height / 2,

                // Default Color for Countdown Timer
                color: Colors.white,

                // Filling Color for Countdown Timer
                fillColor: Colors.green[400],

                // Border Thickness of the Countdown Circle
                strokeWidth: 5.0,

                // Text Style for Countdown Text
                textStyle: TextStyle(
                    fontSize: 23.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),

                // true for reverse countdown (max to 0), false for forward countdown (0 to max)
                isReverse: true,

                // Optional [bool] to hide the [Text] in this widget.
                isTimerTextShown: true,

                // Function which will execute when the Countdown Ends
                onComplete: () {
                  // Here, do whatever you want
                  print('Countdown Ended');
                  Navigator.pop(context);
                },
              ),
              Center(
                  child: Row(
                children: <Widget>[
                  ImageButton(
                    children: <Widget>[],
                    width: 100,
                    height: 100,
                    paddingTop: 5,
                    pressedImage: Image.asset("images/eye2.png"),
                    unpressedImage: Image.asset("images/eye.png"),
                    onTap: () {
                      print('test');
                    },
                  ),
                  ImageButton(
                    children: <Widget>[],
                    width: 100,
                    height: 100,
                    paddingTop: 5,
                    pressedImage: Image.asset("images/cup2.png"),
                    unpressedImage: Image.asset("images/cup.png"),
                    onTap: () {
                      print('test');
                    },
                  )
                ],
              )),
              Center(
                  child: Row(
                children: <Widget>[
                  ImageButton(
                    children: <Widget>[],
                    width: 100,
                    height: 100,
                    paddingTop: 5,
                    pressedImage: Image.asset("images/chat2.png"),
                    unpressedImage: Image.asset("images/chat.png"),
                    onTap: () {
                      print('test');
                    },
                  ),
                  ImageButton(
                    children: <Widget>[],
                    width: 100,
                    height: 100,
                    paddingTop: 5,
                    pressedImage: Image.asset("images/fruit2.png"),
                    unpressedImage: Image.asset("images/fruit.png"),
                    onTap: () {
                      print('test');
                    },
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
