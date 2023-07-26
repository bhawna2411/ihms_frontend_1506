import 'package:flutter/material.dart';

class SeatsBookedScreen extends StatefulWidget {
  final String name;

  const SeatsBookedScreen(this.name);

  @override
  _SeatsBookedScreenState createState() => _SeatsBookedScreenState();
}

class _SeatsBookedScreenState extends State<SeatsBookedScreen> {
  FocusNode myFocusNode = new FocusNode();
  //Future navigateToParticipate_Screen(context) async {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => Participate_Screen()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dashboard_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.height * 0.00,
              MediaQuery.of(context).size.height * 0.24,
              MediaQuery.of(context).size.height * 0.00,
              MediaQuery.of(context).size.height * 0.00,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/images/bg_color.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.height * 0.00,
                MediaQuery.of(context).size.height * 0.20,
                MediaQuery.of(context).size.height * 0.00,
                MediaQuery.of(context).size.height * 0.00,
              ),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 10,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Container(
                          //   height: MediaQuery.of(context).size.height * 0.20,
                          //   width: MediaQuery.of(context).size.width * 0.35,
                          //   margin: EdgeInsets.fromLTRB(
                          //     MediaQuery.of(context).size.height * 0.00,
                          //     MediaQuery.of(context).size.height * 0.10,
                          //     MediaQuery.of(context).size.height * 0.00,
                          //     MediaQuery.of(context).size.height * 0.00,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //       image:
                          //           AssetImage("assets/images/thumbs-up.png"),
                          //       fit: BoxFit.fill,
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              //Navigator.pop(context);
                            },
                            child: Text(
                              "All Slots Booked !",
                              // "All Seats Booked !",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color(0xFF96700f))),
                          ),
                          SizedBox(
                            height: 55,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(widget.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width * .2,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.22,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xFFb48919),
                    const Color(0xFF9a7210),
                  ],
                ),
                border: Border.all(color: Colors.white, width: 7),
                shape: BoxShape.circle,
                color: Colors.brown,
              ),
              child: InkWell(
                child: new IconButton(
                  icon: new Icon(
                    Icons.arrow_right_alt_outlined,
                    size: 40,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, "tabbar");
                    // Navigator.of(context, rootNavigator: true).push(
                    //     MaterialPageRoute(builder: (context) => DashboardScreen()));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
