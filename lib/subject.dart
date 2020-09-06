import 'package:flutter/material.dart';
import './page_2.dart';
import 'icons.dart';

class Subject extends StatelessWidget {
  final String text;
  Subject(this.text);
  var icon;
  @override
  Widget build(BuildContext context) {
    if (text == "Math") {
      icon = SubjectIcon.shapes;
    } else if (text == "Physics") {
      icon = SubjectIcon.atom;
    } else if (text == "Chemistry") {
      icon = SubjectIcon.flask;
    } else {
      icon = SubjectIcon.microscope;
    }
    return Container(
        child: RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondPage()),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey[600], Colors.blueGrey[100]],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10.0)),
        child: Container(
            constraints: BoxConstraints(maxWidth: 380.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.blueGrey[900],
                  size: 40,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Icon(
                  SubjectIcon.keyboard_arrow_right,
                  color: Colors.white,
                ),
              ],
            )),
      ),
    ));
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
