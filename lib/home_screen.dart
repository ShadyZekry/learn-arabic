import 'package:flutter/material.dart';
import 'package:learn_arabic/helpers/database_helper.dart';
import 'package:learn_arabic/helpers/database_manager.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              child: Text("insert"),
              onPressed: () {
                DatabaseHelper.instance.insert(
                  "progress",
                  {"letter": "أ", "pass": false},
                );
              },
            ),
            RaisedButton(
              child: Text("update"),
              onPressed: () {
                DatabaseHelper.instance.update(
                  "progress",
                  "letter",
                  "أ",
                  {"pass": true},
                );
              },
            ),
            RaisedButton(
              child: Text("delete"),
              onPressed: () {
                DatabaseHelper.instance.delete(
                  "progress",
                  "pass",
                  false,
                );
              },
            ),
            RaisedButton(
              child: Text("query all"),
              onPressed: () async {
                print(await DatabaseManager.getProgress());
              },
            ),
          ],
        ),
      ),
    );
  }
}
