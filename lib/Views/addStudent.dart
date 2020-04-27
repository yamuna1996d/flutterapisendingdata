import 'package:courseapp/model/Student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';




Future<StudentModel> sendData(String url,{Map body}) async{
  return http.post(url,body:body).then( (http.Response response) {
    print(response.body);
    return ( json.decode(response.body)) ;
  });
}

class Student extends StatelessWidget {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController place=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController parent=TextEditingController();
  TextEditingController phonep=TextEditingController();
  String Apiurl="https://assignmentcours.herokuapp.com/add/studreg";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                height: 300.0,
                width: 400.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.orange, Colors.deepOrange]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(100.0),
                    bottomRight: const Radius.circular(100.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/student.png',
                      height: 300.0,
                      width: 150.0,
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, -30),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 65.0),
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(30.0),
                          bottomRight: const Radius.circular(30.0),
                          bottomLeft: const Radius.circular(30.0),
                          topRight: const Radius.circular(30.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Courses",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Container(

                margin: EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller:name,
                      decoration: InputDecoration(
                        hintText: "Name",
                        prefixIcon: Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Email id",
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: place,
                      decoration: InputDecoration(
                        hintText: "Place",
                        prefixIcon: Icon(Icons.location_on),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: phone,
                      decoration: InputDecoration(
                        hintText: "Phone",
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: parent,
                      decoration: InputDecoration(
                        hintText: "Parent Name",
                        prefixIcon: Icon(Icons.place),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: phonep,
                      decoration: InputDecoration(
                        hintText: "Parent Phone",
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              GestureDetector(onTap: () async {
                String  a = name.text.toString();
                String b = email.text.toString();
                var c=place.text.toString();
                String d = phone.text.toString();
                var e=parent.text.toString();
                var f =phonep.text.toString();
                StudentModel model=StudentModel(Name: a,
                    Email: b,
                    place: c,
                    phone: d,
                    parent: e,
                parentphone: f);

                await sendData(Apiurl,body: model.toMap());

              },

                child: Container(
                  height: 50.0,
                  width: 300.0,
                  margin: EdgeInsets.only(top: 20,left: 50,right: 50,bottom: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.deepOrange,Colors.orangeAccent],begin: Alignment.center,end: Alignment.bottomLeft),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        )
                      ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


