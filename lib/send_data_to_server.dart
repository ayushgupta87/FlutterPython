import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'get_items.dart';

class SendDataToServer extends StatefulWidget {
  final String name;
  final String price;

  SendDataToServer(this.name, this.price);

  @override
  _SendDataToServerState createState() => _SendDataToServerState(name, price);
}

class _SendDataToServerState extends State<SendDataToServer> {
  String name;
  String price;

  _SendDataToServerState(this.name, this.price);

  Future<http.Response> _createItem(String name, String price) {
    return http.post(
      'http://127.0.0.1:5000/item/$name',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'price': price,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post request'),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.blue,
          onPressed: () {
            _createItem(name, price);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GetItems();
            }));
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(name),
                Text(price),
                Text('Press to confirm'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
