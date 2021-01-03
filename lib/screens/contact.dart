import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petsApp/configuration.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  //method for launching a webview for the app
  _lauchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //method for launching an email from the app
  _mailURL() async {
    const mail = 'mailto:messelemy@gmail.com?subject=Enquiry about a product';
    if (await canLaunch(mail)) {
      await launch(mail);
    } else {
      throw 'Could not launch $mail';
    }
  }

  //method for launching a phone call from the app

  _launchCall() async {
    const call = 'tel:+971528412896';
    if (await canLaunch(call)) {
      await launch(call);
    } else {
      throw 'Could not make $call';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      //width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      //width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Contact Us",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.fjallaOne(
                          textStyle:
                              TextStyle(color: itemBackground, fontSize: 50.0),
                        ),
                      ),
                    )
                  ],
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
                    )),
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
                          ]),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          _mailURL();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
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
                                      fontSize: 20, color: Colors.grey),
                                ),
                                Text(
                                  "messelemy@gmail.com",
                                  style: GoogleFonts.fjallaOne(
                                      fontSize: 15, color: itemBackground),
                                ),
                              ]),
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
                          ]),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          _launchCall();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
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
                                      fontSize: 20, color: Colors.grey),
                                ),
                                Text(
                                  "+971 52 841 2896",
                                  style: GoogleFonts.fjallaOne(
                                      fontSize: 15, color: itemBackground),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
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
                      ]),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _lauchURL();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
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
                                  fontSize: 15, color: Colors.grey),
                            ),
                            Text(
                              "Questions",
                              style: GoogleFonts.fjallaOne(
                                  fontSize: 20, color: Colors.grey),
                            )
                          ]),
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
