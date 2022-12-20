import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shop_app/screens/splash/thirdscreen.dart';
import 'inputValuesProvider.dart';
import 'package:provider/provider.dart';
import 'fifthscreen.dart';

class fordscreen extends StatelessWidget {
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
  final formKey = GlobalKey<FormState>();
  final c1_Controller = TextEditingController();
  final c2_Controller = TextEditingController();
  final c3_Controller = TextEditingController();

  //key for form
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
                      "C1",
                      style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                    ),
                    Text(
                      "Présentation !",
                      style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                    ),

                    SizedBox(height: height * 0.04),
                    TextFormField(
                        controller: c1_Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Presentation quality                     / 1",
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
                        controller: c2_Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                            "Expression orale aisée                    / 1"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'you must enter a value';
                          } else if (double.parse(value) > 1) {
                            return 'mark must be less than or equal to 1';
                          }
                        }),
                    SizedBox(height: height * 0.05),
                    TextFormField(
                        controller: c3_Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                            "Well-posed problem                     / 1"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'you must enter a value';
                          } else if (double.parse(value) > 1) {
                            return 'mark must be less than or equal to 1';
                          }
                        }),

                    //Text(some(c2_Controller,c1_Controller,c3_Controller));
                  ],
                ),
              ),
            )),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 45.0, right: 20.0, bottom: 40.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => thirdscreen()),
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
                      MaterialPageRoute(builder: (context) => fifthscreen()),
                    );
                    setState(() {
                      Provider.of<InputValues>(context, listen: false).sommeC(
                          c1_Controller.text,
                          c2_Controller.text,
                          c3_Controller.text);
                    });
                  }
                },
                backgroundColor: Color(0xFF363f93),
                child: const Icon(Icons.arrow_forward_sharp),
              ),
            ],
          ),
        ));
  }
}
