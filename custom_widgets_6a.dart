//create custom widgets for ui elements

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Custom Button Widget
class MyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  MyButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(label, style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}

// Custom Text Widget
class MyText extends StatelessWidget {
  final String text;

  MyText(this.text);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String displayText = "Hello!";

  void _changeText() {
    setState(() {
      displayText = "You clicked the button!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widgets Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Widgets')),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
              MyText(displayText),
          SizedBox(height: 30),
          MyButton(label: "Click Me", onPressed: _changeText),
          ],
        ),
      ),
    ),
    );
  }
}
