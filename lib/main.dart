import 'package:flutter/material.dart';
import './subject.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      theme: ThemeData(
        fontFamily: 'Comic Sans MS',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            title: Center(
                child: Text(
              'Lecture Bingo',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
            backgroundColor: Colors.blueGrey[900],
          )),
      body: Container(
          padding: EdgeInsets.only(top: 4),
          child: Center(
              child: Column(children: <Widget>[
            Image(
              image: AssetImage('images/hat.png'),
              height: 250,
              width: 250,
            ),
            Subject('Math'),
            SizedBox(height: 30),
            Subject('Physics'),
            SizedBox(height: 30),
            Subject('Chemistry'),
            SizedBox(height: 30),
            Subject('Biology'),
          ]))),
    );
  }
}
