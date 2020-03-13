import 'package:courseapp/Views/button.dart';
import 'package:flutter/material.dart';

void main() => runApp(Buttons());

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Button()
      ),
    );
  }
}
