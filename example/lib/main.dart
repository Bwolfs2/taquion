import 'package:flutter/material.dart';
import 'package:taquion/taquion.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class Controller {
  String data = math.Random().nextInt(1000).toString();
  List<String> minhasStrings = [];

  Controller() {
    minhasStrings = List.generate(100,
        (index) => 'Minhas String e a melhor String do mundo $index $data');
    print(data);
    print(minhasStrings[0]);
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    var controller = Taquion.take<Controller>(() => Controller());
    print(controller.data);

    for (var i = 0; i < 10; i++) {
      controller = Taquion.take(() => Controller());
      // controller = Controller().take(); BAD CHOOICE
      print("OFICIAL: ${controller.data}");
      print("OFICIAL: ${controller.minhasStrings[0]}");
    }

    "dasd".dispose();

    //controller.dispose();
    Taquion.dispose<Controller>();
    controller = Taquion.take(() => Controller());
    print("DISPOSED: ${controller.data}");
    print("DISPOSED: ${controller.minhasStrings[0]}");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
