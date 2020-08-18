import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Step 1
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  // Step 2
  int value;

  void _incrementCounter() async {
    setState(() {
      _counter = _counter + 1;
    });
    // Step 3
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('number', _counter);
  }

  void getInt() async {
    //Step 7
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getInt('number');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              //Step 4
              child: Text("Show Data in Shared Preferences"),
              splashColor: Colors.grey,
              textColor: Colors.black,
              elevation: 7,
              onPressed: () {
                getInt(); //Step 6
              },
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              //Step 5
              '$value',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
