import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'fordscreen.dart';

class thirdscreen extends StatelessWidget{
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name="";
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return  Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body:SingleChildScrollView(
            child:Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Form(
                key: formKey, //key for form
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:height*0.04),
                    Text("A2", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                    Text("Source code & analyse !", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                    SizedBox(height:height*0.04),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "ergonomics/clarity of analysis"
                      ),
                    ),
                    SizedBox(height:height*0.04),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Development effort"
                      ),
                    ),
                    SizedBox(height:height*0.04),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Quality of results"
                      ),
                    ),
                    SizedBox(height:height*0.05),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Mastery of tools"
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ),
        floatingActionButton:
    Padding(
    padding: const EdgeInsets.only(bottom: 40.0),
    child:FloatingActionButton(
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>fordscreen()),);
    },
    backgroundColor: Color(0xFF363f93),
    child: const Icon(Icons.arrow_forward_sharp),
    ),
    ),
    );
  }


}