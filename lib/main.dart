import 'package:flutter/material.dart';
import 'package:stem_project/bar_charts.dart';
import 'package:stem_project/network/dio_helper.dart';
import 'package:stem_project/screens/home_screen.dart';


void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garduino',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:BarChart(),
    );
  }
}
