import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class fifthscreen extends StatelessWidget{
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
                  Text("D1", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                  Text("Responses to Questions !", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                  SizedBox(height:height*0.04),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Relevance and quality of responses on the scientific plan / "
                    ),
                  ),
                  SizedBox(height:height*0.04),
                ],
              ),
            ),
          )
      ),
      floatingActionButton:
      Padding(
        padding: const EdgeInsets.only(bottom: 40.0),


        child:FloatingActionButton(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>fifthscreen()),);
          },
          backgroundColor: Color(0xFF363f93),
          child: const Icon(Icons.arrow_forward_sharp),
        ),
      ),
    );
  }


}