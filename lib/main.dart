import 'package:flutter/material.dart';
import 'package:http_practice/put_data.dart';
import 'package:http_practice/send_data_to_server.dart';
import 'delete_item.dart';
import 'get_items.dart';
import 'get_single_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name;
  String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Test'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: TextFormField(
              onChanged: (valueName) {
                name = valueName;
              },
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: TextFormField(
              onChanged: (valuePrice) {
                price = valuePrice;
              },
              decoration: InputDecoration(
                labelText: 'Price',
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GetItems();
              }));
            },
            child: Text('Get All List, Items'),
            color: Colors.blue,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GetSingleItems(name);
              }));
            },
            child: Text('Get a Item'),
            color: Colors.blue,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SendDataToServer(name, price);
              }));
            },
            child: Text('Post Data'),
            color: Colors.blue,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DeleteDataFromServer(name);
              }));
            },
            child: Text('Delete Data'),
            color: Colors.blue,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PutDataToServer(name, price);
              }));
            },
            child: Text('Put Data'),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
