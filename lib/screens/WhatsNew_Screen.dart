import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ihms/apiconfig/apiConnections.dart';
import 'package:ihms/models/WhatsNewResponseModel.dart';
import 'package:ihms/screens/dashboard_screen.dart';
import 'package:link_text/link_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WhatsNewScreen extends StatefulWidget {
  @override
  _WhatsNewScreenState createState() => _WhatsNewScreenState();
}

class _WhatsNewScreenState extends State<WhatsNewScreen> {
  WhatsNewResponseModel whatsNewResponseModel = new WhatsNewResponseModel();
  List<Datumwhatsnew> whatsnewList = [];
  List<Datumwhatsnew> filteredwhatsnew = [];
  // ignore: non_constant_identifier_names
  String user_society = '';
  Future _loadwhatsnew;
  loadwhatsnew() {
    _loadwhatsnew = whatspdf();
  }

  loadsociety() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_society = prefs.getString('society');
    });
  }

  @override
  void initState() {
    super.initState();
    loadwhatsnew();
    loadsociety();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dashboard_bg.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.height * 0.00,
              MediaQuery.of(context).size.height * 0.32,
              MediaQuery.of(context).size.height * 0.00,
              MediaQuery.of(context).size.height * 0.00,
            ),
            height: MediaQuery.of(context).size.height * 0.76,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_color.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.height * 0.01,
                MediaQuery.of(context).size.height * 0.02,
                MediaQuery.of(context).size.height * 0.00,
                MediaQuery.of(context).size.height * 0.00,
              ),
              child: InkWell(
                child: new IconButton(
                  icon: new Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                  color: Color(0xFF203040),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen()),
                    );
                  },
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DIGITAL NOTICE BOARD",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF203040),
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
            child: FutureBuilder(
                future: _loadwhatsnew,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    whatsNewResponseModel = snapshot.data;
                    whatsnewList = whatsNewResponseModel.data;
                    for (int i = 0; i < whatsnewList.length; i++) {
                      if (whatsnewList[i].society == user_society) {
                        filteredwhatsnew.add(whatsnewList[i]);
                      }
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: filteredwhatsnew.length,
                        itemBuilder: (context, index) {
                          String _text = filteredwhatsnew[index].url;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  // height: 100,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Text(
                                              "Title :-",
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF96700f),
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ]),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            Text(
                                              "Society :-",
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF96700f),
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ]),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            Text("Description :-",
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF96700f),
                                                    fontSize: 16,
                                                  ),
                                                )),
                                          ]),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            Text("Link :-",
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF96700f),
                                                    fontSize: 16,
                                                  ),
                                                )),
                                          ]),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .26,
                                            child: Row(children: [
                                              Expanded(
                                                child: Text(
                                                  filteredwhatsnew[index]
                                                      ?.title,
                                                  maxLines: 2,
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                    textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xFF203040),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .26,
                                            child: Row(children: [
                                              Expanded(
                                                child: Text(
                                                  filteredwhatsnew[index]
                                                      ?.society
                                                      .toString(),
                                                  maxLines: 2,
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                    textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xFF203040),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .26,
                                            child: Row(children: [
                                              Expanded(
                                                child: Text(
                                                    filteredwhatsnew[index]
                                                        .description,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xFF203040),
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                              ),
                                            ]),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .26,
                                            child: FittedBox(
                                              child: Row(children: [
                                                LinkText(
                                                  _text,
                                                  textStyle: TextStyle(
                                                    fontSize: 5,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        });
                  }
                }
                ),
          ),
        ],
      ),
    ));
  }
}
