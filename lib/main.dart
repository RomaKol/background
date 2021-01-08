import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int r = 255;
  int g = 255;
  int b = 255;
  List<int> numberList = [];

  void _changeBackgroundColor() {
    Random random = new Random();
    int number = random.nextInt(16777216);
    if(!numberList.contains(number)) {
      int rNew = (number-1) ~/ 65536;
      int gNew = ((number-1) % 65536) ~/ 256;
      int bNew = ((number-1) % 65536) % 256;
      setState(() {
        numberList.add(number);
        r = rNew;
        g = gNew;
        b = bNew;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(r, g, b, 1),
      body: FlatButton(
        onPressed: _changeBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Hey there',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
