import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF4e5ae8) ,
        shadowColor: Color(0xCFFF8746) ,
        splashColor:Color(0xFFff4667) ,
        brightness: Brightness.dark,


      ),
      home:const HomePage(),
    );
  }
}

