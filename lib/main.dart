import 'package:flutter/material.dart';
import 'package:learn_arabic/helpers/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                var result = await DatabaseHelper.instance.getTable("progress");
                print(result);
              },
            ),
          ],
        ),
      ),
    );
  }
}
