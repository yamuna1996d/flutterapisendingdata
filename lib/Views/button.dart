import 'package:courseapp/Views/Retrive.dart';
import 'package:courseapp/Views/main.dart';
import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.green,
          margin: EdgeInsets.only(left: 120.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Course()));
              },
                child: Container(
                  height: 50.0,
                  width: 300.0,
                  margin: EdgeInsets.only(top: 20,left: 50,right: 50,bottom: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.white,Colors.black],begin: Alignment.bottomRight,end: Alignment.bottomLeft),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        )
                      ]
                  ),
                ),
              ),

              GestureDetector(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RetriveData()));
              },
                child: Container(
                  height: 50.0,
                  width: 300.0,
                  margin: EdgeInsets.only(top: 20,left: 50,right: 50,bottom: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.black,Colors.blue],begin: Alignment.bottomRight,end: Alignment.bottomLeft),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Get Data",
                          style: TextStyle(color: Colors.white),
                        )
                      ]
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
