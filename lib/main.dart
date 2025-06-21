
import 'dart:convert';
import 'package:api_learning/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'APICalls.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
//      home: APICall(),
//      home: HomePage(),
        home: APICalls(),
    );
  }
}


