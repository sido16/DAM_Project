import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'inputValuesProvider.dart';
import 'fordscreen.dart';

class finalscreen extends StatelessWidget {
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
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

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
                  "memoire: " +
                      Provider.of<InputValues>(context, listen: true)
                          .a1
                          .toString()
                          .replaceAll(regex, ''),
                  style: TextStyle(fontSize: 28, color: Color(0xFF01579B)),
                ),
                SizedBox(height: height * 0.04),
                Text(
                  "Source code & analyse: " +
                      Provider.of<InputValues>(context, listen: true)
                          .b1
                          .toString()
                          .replaceAll(regex, ''),
                  style: TextStyle(fontSize: 28, color: Color(0xFF01579B)),
                ),
                SizedBox(height: height * 0.05),
                Text(
                  "Presentation:  " +
                      Provider.of<InputValues>(context, listen: true)
                          .c1
                          .toString()
                          .replaceAll(regex, ''),
                  style: TextStyle(fontSize: 28, color: Color(0xFF01579B)),
                ),
                SizedBox(height: height * 0.05),
                Text(
                  "Responses to Questions: " +
                      Provider.of<InputValues>(context, listen: true)
                          .d1
                          .toString()
                          .replaceAll(regex, ''),
                  style: TextStyle(fontSize: 27, color: Color(0xFF01579B)),
                ),
                SizedBox(height: height * 0.13),
                Center(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          "Final mark",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          Provider.of<InputValues>(context, listen: true)
                              .sum
                              .toString()
                              .replaceAll(regex, '') +
                              "/12",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Color(0xFF01579B), spreadRadius: 22),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
