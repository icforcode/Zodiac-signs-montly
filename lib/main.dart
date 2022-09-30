import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burclistesi.dart';
import 'package:flutter_burc_rehberi/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      onGenerateRoute: RouteGenerator.routegenerator,
    );
  }
}
