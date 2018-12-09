import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';


class ExampleTwoScreen extends StatefulWidget {
  @override
  _ExampleTwoScreenState createState() => _ExampleTwoScreenState();
}

class _ExampleTwoScreenState extends State<ExampleTwoScreen> {


  @override
  Widget build(BuildContext context) {
    double media = ((MediaQuery.of(context).size.width-100)/2);


    return Scaffold(
      body: new Builder(
        builder: (context) =>
        new SliverFab(
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
                    color: Color.fromRGBO(255, 255, 255, 0.1), width: 8.0)),
          ),
          floatingPosition: FloatingPosition(left: media-10, top: 25),
          expandedHeight: 256.0,
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: 256.0,
              pinned: true,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              title: Text("Example 2", style: TextStyle(color: Colors.black),),
              centerTitle: true,
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
