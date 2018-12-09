import 'package:example/exampleOneScreen.dart';
import 'package:example/exampleTwoScreen.dart';
import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sliver Fab Example',
      theme: new ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Examples"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: RaisedButton(
                  child: Text("Example 1"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExampleOneScreen()));
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: RaisedButton(
                  child: Text("Example 2"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExampleTwoScreen()));
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
