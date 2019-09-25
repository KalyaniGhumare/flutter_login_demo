import 'package:flutter/material.dart';
import 'package:login_demo/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange[500],
        primaryColorDark: Colors.orange[700],
        accentColor: Colors.grey
      ),
      home: LoginScreen(),
    );
  }
}
