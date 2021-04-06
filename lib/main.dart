import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Modal/Videos.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DiscorT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'DiscorT',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key , this.title}) : super(key : key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF1f1f27),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height * 0.1,
                      child: Placeholder()
                    ),
                    Container(
                      height: size.height * 0.8,
                      width: double.infinity,
                      child: Expanded(child: VideoScreen()),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: size.height * 0.1,
                      child: Placeholder(),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}