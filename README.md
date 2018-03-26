# sliver_fab

A wrapper widget allowing to use FloatingActionButton on the edge of FlexibleSpacebar.

![gif](https://raw.githubusercontent.com/MarcinusX/sliver_fab/master/example/screenshots/example.gif)

## [Example usage](https://github.com/MarcinusX/sliver_fab/tree/master/example)
```
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Builder(
        builder: (context) =>
        new SliverFab(
          floatingActionButton: new FloatingActionButton(
            onPressed: () =>
                Scaffold.of(context).showSnackBar(
                    new SnackBar(content: new Text("You clicked FAB!"))),
            child: new Icon(Icons.add),
          ),
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
```

## Installing

### 1. Depend on it
Add this to your package's `pubspec.yaml` file:

```
dependencies:
  sliver_fab: "^0.1.0"

```


### 2. Install it
You can install packages from the command line:

with Flutter:

```
$ flutter packages get
```

Alternatively, your editor might support `packages get`. Check the docs for your editor to learn more.

### 3. Import it
Now in your Dart code, you can use:

```
import 'package:sliver_fab/sliver_fab.dart';
```
        
