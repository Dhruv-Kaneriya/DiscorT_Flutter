import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      home: MyHomePage(title: 'DiscorT'),
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
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime date2;
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.red,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DateField(),
            BasicDateTimeField(),
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(hintText: "Enter Number"),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: myController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some Number';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        // child: TextField(
        //   controller: myController,
        //   decoration: InputDecoration(
        //     hintText: "Write any thing"
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          if(_formKey.currentState.validate()){
            return ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    duration: Duration(milliseconds: 600),
                    elevation: 10,
                    backgroundColor: Colors.deepOrange,
                    content: Text(myController.text,style: TextStyle(fontSize: 20.0),)
                )
            );
          }
          // return showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       // Retrieve the text the that user has entered by using the
          //       // TextEditingController.
          //       content: Text(myController.text),
          //     );
          //   },
          // );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}

class DateField extends StatelessWidget {
  final format = DateFormat("dd-MM-yyyy");
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      format: format,
      decoration: InputDecoration(hintText: "Enter Date"),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }
}

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      format: format,
      decoration: InputDecoration(hintText: "Enter Date & Time"),
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
        if (date != null) {
          final time = await showTimePicker(
            context: context,
            initialTime:
            TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.combine(date, time);
        } else {
          return currentValue;
        }
      },
    );
  }
}
