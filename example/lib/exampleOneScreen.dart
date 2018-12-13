import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';

class ExampleOneScreen extends StatefulWidget {
  @override
  _ExampleOneScreenState createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Builder(
        builder: (context) {
          return new SliverFab(
            floatingWidget: FloatingActionButton(
              onPressed: () => Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("You clicked FAB!"))),
              child: Icon(Icons.add),
            ),
            expandedHeight: 256.0,
            slivers: <Widget>[
              new SliverAppBar(
                expandedHeight: 256.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("SliverFab Example"),
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
