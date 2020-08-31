import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:appbase/views/home.dart';

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
  createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _counter;

  // Future<void> _incrementCounter() async {
  //   final SharedPreferences prefs = await _prefs;
  //   final int counter = (prefs.getInt('counter') ?? 0) + 1;

  //   setState(() {
  //     _counter = prefs.setInt("counter", counter).then((bool success) {
  //       return counter;
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('counter') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<int>(
          future: _counter,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  // return AppPage(_userInfo);
                  return AppPage();
                }
            }
          },
        ),
      ),
    );
  }
}
