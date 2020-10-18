import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'get_items.dart';

class DeleteDataFromServer extends StatefulWidget {
  final String name;

  DeleteDataFromServer(this.name);

  @override
  _DeleteDataFromServerState createState() => _DeleteDataFromServerState(name);
}

class _DeleteDataFromServerState extends State<DeleteDataFromServer> {
  String name;

  _DeleteDataFromServerState(this.name);

  Future<http.Response> _deleteItem(String name) async {
    final http.Response response = await http.delete(
      'http://127.0.0.1:5000/item/$name',
    );
    print(response.body);

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Request'),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.blue,
          onPressed: () {
            _deleteItem(name);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GetItems();
            }));
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(name),
                Text('Press to confirm'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
