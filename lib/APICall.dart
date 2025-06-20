
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APICall extends StatefulWidget {
  @override
  State<APICall> createState() => _APICallState();
}
class Joke {
  String id;
  String value;

  Joke.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        value = json['value'];
}
class _APICallState extends State<APICall> {
  // Function to fetch a random Chuck Norris joke from an API
  Future<Joke> fetchJoke() async {
    final response =
    await http.get(Uri.parse("https://api.chucknorris.io/jokes/random"));

    if (response.statusCode == 200) {
      return Joke.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch joke');
    }
  }
  void changeJoke() {
    setState(() {
      build(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chuck Norris Jokes'), // Set the app bar title
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: FutureBuilder<Joke>(
              future: fetchJoke(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(child: Text(snapshot.data!.value));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          ElevatedButton(onPressed: changeJoke, child: Text("Next Joke"))
        ],
      ),
    );
  }
}