import 'package:courseapp/model/retriveapl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:courseapp/model/retriveapl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
Future<RetriveModel> retriveData(String url,{Map body}) async{

  return http.post(url,body:body).then( (http.Response response) {
    print(response.body);
    return ( json.decode(response.body)) ;
  });
}
class RetriveData extends StatelessWidget {
  TextEditingController name=TextEditingController();
  TextEditingController disc=TextEditingController();
  TextEditingController duration=TextEditingController();
  TextEditingController venue=TextEditingController();
  TextEditingController date=TextEditingController();
  String urls="https://dummyapilist.herokuapp.com/getcourses";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller:name,
                    decoration: InputDecoration(
                      hintText:"Name",
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: disc,
                    decoration: InputDecoration(
                      hintText: "Discription",
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: duration,
                    decoration: InputDecoration(
                      hintText: "Duration",
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: venue,
                    decoration: InputDecoration(
                      hintText: " Venue",
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: date,
                    decoration: InputDecoration(
                      hintText: "Date",
                    ),
                  ),
                  SizedBox(height: 10,),
                  RaisedButton(onPressed: () async{
                    String  a = name.text.toString();
                    String b = disc.text.toString();
                    var c=duration.text.toString();
                    String d = venue.text.toString();
                    var e=date.text.toString();
                    RetriveModel model=RetriveModel(Name: a,
                        Discription: b,
                        Duration: c,
                        Venue: d,
                        Date: e);

                    await retriveData(urls,body: model.toMap());

                  },
                    color: Colors.green,
                    child: Text("Retrive",style: TextStyle(fontSize: 15),),)
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
