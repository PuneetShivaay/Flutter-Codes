import 'package:flutter/material.dart';

void main() => runApp(MakeMyPractice());

class MakeMyPractice extends StatefulWidget {
  @override
  _MakeMyPracticeState createState() => _MakeMyPracticeState();
}

class _MakeMyPracticeState extends State<MakeMyPractice> {
  double _value = 0; //slider value

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Slider(
                min: 0,
                max: 100,
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
