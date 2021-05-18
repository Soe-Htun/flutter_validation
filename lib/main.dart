import 'package:flutter/material.dart';
import 'package:flutter_validation/components/form_screen.dart';
import 'package:flutter_validation/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor
      ),
      home: FormScreen(),
    );
  }
}