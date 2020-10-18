import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetSingleItems extends StatefulWidget {
  final String name;

  GetSingleItems(this.name);

  @override
  _GetSingleItemsState createState() => _GetSingleItemsState(name);
}

class _GetSingleItemsState extends State<GetSingleItems> {
  String name;
  var priceSpecific;

  _GetSingleItemsState(this.name);

  Map data;
  List itemsData;
  int value;

  Future _getItems() async {
    http.Response response = await http.get('http://127.0.0.1:5000/items');

    data = json.decode(response.body);
    setState(() {
      itemsData = data['items'];
    });

    // var names = (data)['items'][2]['name'];
    List myNames = [];

    for (int i = 0; i < itemsData.length; i++) {
      var names = (data)['items'][i]['name'];
      myNames.add(names);

      // print(names);
      if (names == name) {
        value = myNames.indexOf(names);
        print(value);
      }
    }
    priceSpecific = (data)['items'][value]['price'];
    print(priceSpecific);
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
          child: ListTile(
        title: Text(name),
        subtitle: Text(priceSpecific.toString()),
      )),
    );
  }
}
