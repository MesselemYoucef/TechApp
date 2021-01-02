import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petsApp/configuration.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerLeft,
                    child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                    ), 
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Contact Us",
                textAlign: TextAlign.center,
                style: GoogleFonts.fjallaOne(
                  textStyle: TextStyle(color: itemBackground, fontSize: 50.0),
                ),
              ),
            ),

            Container(
              color: Colors.teal,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Image.asset("images/contact-us.png"),
            ),
            
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Have an issue or a query? \n Feel free to contact us!",
                textAlign: TextAlign.center,
                style: GoogleFonts.fjallaOne(
                  textStyle: TextStyle(
                    color: itemBackground,
                    fontSize: 25.0,
                  )
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(  
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: itemBackground.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ]
                      ),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: (){
                      print("Sent an email");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.mail_outline,
                            color: itemBackground,
                            size: 30,
                            ),
                          Text(
                            "Write to us:",
                            style: GoogleFonts.fjallaOne(
                              fontSize: 20,
                              color: Colors.grey
                            ),
                          ),
                          Text(
                            "messelemy@gmail.com",
                            style: GoogleFonts.fjallaOne(
                              fontSize: 15,
                              color: itemBackground
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
                Container(  
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: itemBackground.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ]
                      ),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: (){
                      print("Called Someone");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            color: itemBackground,
                            size: 30,
                            ),
                          Text(
                            "Call us:",
                            style: GoogleFonts.fjallaOne(
                              fontSize: 20,
                              color: Colors.grey
                            ),
                          ),
                          Text(
                            "+971 52 841 2896",
                            style: GoogleFonts.fjallaOne(
                              fontSize: 15,
                              color: itemBackground
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
              ] ,
            ),
            Container(  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: itemBackground.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]
                  ),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: (){
                  print("Sent an email");
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.question_answer,
                        color: itemBackground,
                        size: 30,
                        ),
                      Text(
                        "Frequently Asked",
                        style: GoogleFonts.fjallaOne(
                          fontSize: 15,
                          color: Colors.grey
                        ),
                      ),
                      Text(
                        "Questions",
                        style: GoogleFonts.fjallaOne(
                          fontSize: 20,
                          color: Colors.grey
                        ),
                      )
                    ]
                  ),
                ),
              ),
            ),
            Center(
              child: Text("All Rights Reserved: Youcef"),
            )
          ]),
        ),
      ),
    );
  }
}
