import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/splash/MyApp.dart';
import 'inputValuesProvider.dart';
import 'fordscreen.dart';

class thirdscreen extends StatelessWidget {
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
  final b1_Controller = TextEditingController();
  final b2_Controller = TextEditingController();
  final b3_Controller = TextEditingController();
  final b4_Controller = TextEditingController();

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
                  "B1",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                Text(
                  "Source code & analyse !",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                SizedBox(height: height * 0.04),
                TextFormField(
                    controller: b1_Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "ergonomics/clarity of analysis         /1"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'you must enter a value';
                      } else if (double.parse(value) > 1) {
                        return 'mark must be less than or equal to 1';
                      }
                    }),
                SizedBox(height: height * 0.04),
                TextFormField(
                    controller: b2_Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Development effort          /1"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'you must enter a value';
                      } else if (double.parse(value) > 1) {
                        return 'mark must be less than or equal to 1';
                      }
                    }),
                SizedBox(height: height * 0.04),
                TextFormField(
                    controller: b3_Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Quality of results           /1"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'you must enter a value';
                      } else if (double.parse(value) > 1) {
                        return 'mark must be less than or equal to 1';
                      }
                    }),
                SizedBox(height: height * 0.05),
                TextFormField(
                    controller: b4_Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Mastery of tools             /1"),
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
                  MaterialPageRoute(builder: (context) => MyApp()),
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
                    MaterialPageRoute(builder: (context) => fordscreen()),
                  );
                  setState(() {
                    Provider.of<InputValues>(context, listen: false).sommeB(
                        b1_Controller.text,
                        b2_Controller.text,
                        b3_Controller.text,
                        b4_Controller.text);
                  });
                }
              },
              backgroundColor: Color(0xFF363f93),
              child: const Icon(Icons.arrow_forward_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
