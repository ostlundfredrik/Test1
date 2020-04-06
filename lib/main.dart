import 'package:flutter/material.dart';
import "workerData.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PVT Stalker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Where is everyone?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  StalkerModel stalkerModel = new StalkerModel();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings_applications),
            tooltip: "Settings",
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: stalkerModel.coWorkers.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 65,
                color: Colors.amber[200],
                child: ListTile(
                  leading: stalkerModel.coWorkers[index].location ==
                          WorkerLocation.home
                      ? new Icon(Icons.home)
                      : stalkerModel.coWorkers[index].location ==
                              WorkerLocation.office
                          ? new Icon(Icons.business)
                          : new Icon(Icons.not_listed_location),
                  title: Text("${stalkerModel.coWorkers[index].username}"),
                  subtitle: Text(
                      "Age: ${DateTime.now().difference(stalkerModel.coWorkers[index].lastUpdated).inHours}"),
                ));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add_to_home_screen),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.location_city),
              onPressed: () {},
            ),
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() { //oftast glömt denna om inget händer
                    stalkerModel.coWorkers.shuffle();
                  });
                }),
          ],
        ),
      ),
    );
  }

//SETTINGS PAGE
  void openPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Settings Page"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Set Username',
                ),
              ],
            ),
          )
      );
    }));
  }
}
