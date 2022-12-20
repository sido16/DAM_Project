import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'inputValuesProvider.dart';
import 'thirdscreen.dart';

class MyApp extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final a1_Controller = TextEditingController();
  final a2_Controller = TextEditingController();
  final a3_Controller = TextEditingController();
  final a4_Controller = TextEditingController();
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFffffff),
      body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: formKey, //key for form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  Text(
                    "A1",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  Text(
                    "memoire !",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  SizedBox(height: height * 0.04),
                  TextFormField(
                      controller: a1_Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Memory organization               /0.5"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'you must enter a value';
                        } else if (double.parse(value) > 0.5) {
                          return 'mark must be less than or equal to 0.5';
                        }
                      }),
                  SizedBox(height: height * 0.04),
                  TextFormField(
                      controller: a2_Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Editorial quality                    / 1",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'you must enter a value';
                        } else if (double.parse(value) > 1) {
                          return 'mark must be less than or equal to 1';
                        }
                      }),
                  SizedBox(height: height * 0.04),
                  TextFormField(
                      controller: a3_Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText:
                          "Quality of the bibliography                     /0.5"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'you must enter a value';
                        } else if (double.parse(value) > 0.5) {
                          return 'mark must be less than or equal to 0.5';
                        }
                      }),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                      controller: a4_Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Scientific content                    / 1"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'you must enter a value';
                        } else if (double.parse(value) > 1) {
                          return 'mark must be less than or equal to 1';
                        }
                      }),
                ],
              ),
            ),
          )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: FloatingActionButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => thirdscreen()),
              );
              setState(() {
                Provider.of<InputValues>(context, listen: false).sommeA(
                    a1_Controller.text,
                    a2_Controller.text,
                    a3_Controller.text,
                    a4_Controller.text);
              });
            }
          },
          backgroundColor: Color(0xFF363f93),
          child: const Icon(Icons.arrow_forward_sharp),
        ),
      ),
    );
  }
}
