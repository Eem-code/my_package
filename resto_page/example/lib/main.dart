import 'package:flutter/material.dart';
import 'package:resto_page/resto_page.dart';

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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Adaptive.scaffold(
      title: 'My package',
      body: Column(
        children: [
          Adaptive.text(string: 'body', color: Colors.purple),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple)),
              onPressed: () {
                Adaptive.alert(context: context);
              },
              child: Adaptive.text(string: 'press me'))
        ],
      ),
    );
  }
}
