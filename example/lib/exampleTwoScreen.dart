import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';

class ExampleTwoScreen extends StatefulWidget {
  @override
  _ExampleTwoScreenState createState() => _ExampleTwoScreenState();
}

class _ExampleTwoScreenState extends State<ExampleTwoScreen> {
  @override
  Widget build(BuildContext context) {
    double media = ((MediaQuery.of(context).size.width - 100) / 2);

    return Scaffold(
      body: new Builder(
        builder: (context) {
          return new SliverFab(
            floatingWidget: Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(left: 15.0),
              child: ClipOval(
                child: Image.asset(
                  "img.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.7),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromRGBO(255, 255, 255, 0.1),
                  width: 8.0,
                ),
              ),
            ),
            floatingPosition: FloatingPosition(left: media - 10, top: -22),
            expandedHeight: 256.0,
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 256.0,
                pinned: true,
                title: Text("Example 2"),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "img.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(
                    30,
                    (int index) => ListTile(title: Text("Item $index")),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
