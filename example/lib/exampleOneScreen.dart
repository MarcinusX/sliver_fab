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
        builder: (context) =>
        new SliverFab(
          floatingWidget: FloatingActionButton(
            onPressed: () =>
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("You clicked FAB!"))),
            child: Icon(Icons.add),
          ),
          floatingPosition: FloatingPosition(right: 16),
          expandedHeight: 256.0,
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: 256.0,
              pinned: true,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
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
        ),
      ),
    );
  }
}


/*
class ExampleOneScreen extends StatefulWidget {
  @override
  _ExampleOneScreenState createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Builder(
        builder: (context) =>
        new SliverFab(

          floatingWidget: new FloatingActionButton(
            onPressed: () =>
                Scaffold.of(context).showSnackBar(
                    new SnackBar(content: new Text("You clicked FAB!"))),
            child: new Icon(Icons.add),
          ),
          floatingPosition: FloatingPosition(top: 10.0, right: 16),
          expandedHeight: 256.0,
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: 256.0,
              pinned: true,
              flexibleSpace: new FlexibleSpaceBar(
                title: new Text("SliverFab Example"),
                background: new Image.asset(
                  "img.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(
                new List.generate(
                  30,
                      (int index) =>
                  new ListTile(title: new Text("Item $index")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/
