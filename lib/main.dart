import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "BitCoin",
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return bitcoin();
  }
}

class bitcoin extends State<homepage> {
  String msg1 = "";
  
  Future<void> getRecord() async {
    final response = await http
        .get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
    setState(() {
      msg1 = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("BITCOIN"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed:getRecord,
            child: Text("Get Api "),

          ),
          Text(msg1)
        ],
      ),
    );
  }
}
