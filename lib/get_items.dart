import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetItems extends StatefulWidget {
  @override
  _GetItemsState createState() => _GetItemsState();
}

class _GetItemsState extends State<GetItems> {
  Map data;
  List itemsData;

  Future _getItems() async {
    http.Response response = await http.get('http://127.0.0.1:5000/items');

    data = json.decode(response.body);
    setState(() {
      itemsData = data['items'];
    });
  }

  @override
  void initState() {
    super.initState();
    _getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Items'),
      ),
      body: Container(
          child: ListView.builder(
        itemCount: itemsData == null ? 0 : itemsData.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(itemsData[i]["name"]),
            subtitle: Text(itemsData[i]["price"].toString()),
          );
        },
      )),
    );
  }
}
