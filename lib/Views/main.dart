import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/course_model.dart';
import 'dart:async';
import 'dart:convert';




Future<CourseModel> sendData(String url,{Map body}) async{
  return http.post(url,body:body).then( (http.Response response) {
    print(response.body);
    return ( json.decode(response.body)) ;
  });
}

class Course extends StatelessWidget {
  TextEditingController Title=TextEditingController();
  TextEditingController discription=TextEditingController();
  TextEditingController duration=TextEditingController();
  TextEditingController venue=TextEditingController();
  TextEditingController date=TextEditingController();
  String Apiurl="https://dummyapilist.herokuapp.com/addcourse";
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
                      controller:Title,
                      decoration: InputDecoration(
                        hintText: "Enter Course Title",
                        prefixIcon: Icon(Icons.filter_frames),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: discription,
                      decoration: InputDecoration(
                        hintText: "Enter Course Discription",
                        prefixIcon: Icon(Icons.book),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: duration,
                      decoration: InputDecoration(
                        hintText: "Enter Course Duration",
                        prefixIcon: Icon(Icons.timelapse),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: venue,
                      decoration: InputDecoration(
                        hintText: "Enter Course Venue",
                        prefixIcon: Icon(Icons.place),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: date,
                      decoration: InputDecoration(
                        hintText: "Enter Course Date",
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              GestureDetector(onTap: () async {
                String  a = Title.text.toString();
                String b = discription.text.toString();
                var c=duration.text.toString();
                String d = venue.text.toString();
                var e=date.text.toString();
                CourseModel coursemodel=CourseModel(CourseTitle: a,
                CourseDiscription: b,
                CourseDuration: c,
                CourseVenue: d,
                CourseDate: e);

              await sendData(Apiurl,body: coursemodel.toMap());

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
                    "Login",
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
