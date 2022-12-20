import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'inputValuesProvider.dart';
import 'fordscreen.dart';
import 'finalscreen.dart';

class fifthscreen extends StatelessWidget {
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
  final d1_Controller = TextEditingController();
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
                  "D1",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                Text(
                  "Responses to Questions !",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                SizedBox(height: height * 0.04),
                TextFormField(
                    controller: d1_Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText:
                        "Relevance and quality of responses on the scientific plan / "),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'you must enter a value';
                      } else if (double.parse(value) > 2) {
                        return 'mark must be less than or equal to 2';
                      }
                    }),
                SizedBox(height: height * 0.04),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 45.0, right: 20.0, bottom: 40.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => fordscreen()),
                  );
                },
                backgroundColor: Color(0xFF363f93),
                child: const Icon(Icons.arrow_back),
              ),
              Expanded(child: Container()),
              FloatingActionButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => finalscreen()),
                    );
                    setState(() {
                      Provider.of<InputValues>(context, listen: false)
                          .finalmark(
                        d1_Controller.text,
                      );
                    });
                  }
                },
                backgroundColor: Color(0xFF363f93),
                child: const Icon(Icons.arrow_forward_sharp),
              ),
            ],
          )),
    );
  }
}
