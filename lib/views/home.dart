import 'dart:convert';
import 'package:http/http.dart' show Client, Response;

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /* 
  ** Substitua pelo IP da maquina rodando o container docker! ***
  */
  static String serverAddress = '000.000.0.00';

  String fullUrl = 'http://$serverAddress:3000/newlocationlog';
  
  Client client = new Client();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: MaterialButton(
        onPressed: () {
          _postLocationLog();
        },
        color: Colors.orange,
        child: Text('Aperte'),
      )),
    );
  }

  void _postLocationLog() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    Map<String, String> body = {"userId": "1", "latitude": "712837123", "longitude": "17216312"};
    var encodedBody = json.encode(body);

    final response = await client.post(
      'http://$serverAddress:3000/newlocationlog',
      headers: headers,
      body: encodedBody,
    );
    print(response.body);
  }
}
