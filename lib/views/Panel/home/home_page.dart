import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          titleSpacing: 0.0,
          leading: IconButton(
              icon: new Image.asset('assets/img/pp.png'), onPressed: () {}),
          title: Text("HI, Kayla",
              style: TextStyle(color: Color(0xff463A3A), fontSize: 22)),
          actions: [
            Icon(
              Icons.notifications_none_outlined,
              size: 35,
              color: Colors.black,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //top bar
              Padding(
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //top text
                        Text("What do you want to order today?",
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        Padding(padding: EdgeInsets.only(top: 12)),
                        //search input
                        Center(
                          child: TextField(
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black45,
                              ),
                              hintText: "Search",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide.none),
                              fillColor: Color.fromARGB(255, 235, 235, 240),
                              filled: true,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 24)),

                        // category
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Stack(alignment: Alignment.center, children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color(0xffD21670),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  Image.asset("assets/img/all.png"),
                                ]),
                                Padding(padding: EdgeInsets.only(top: 12)),
                                Text(
                                  "All",
                                  style: TextStyle(
                                      color: Color(0xff969696),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Stack(alignment: Alignment.center, children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 235, 235, 240),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  Image.asset("assets/img/brgr.png"),
                                ]),
                                Padding(padding: EdgeInsets.only(top: 12)),
                                Text(
                                  "Burger",
                                  style: TextStyle(
                                      color: Color(0xff969696),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Stack(alignment: Alignment.center, children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 235, 235, 240),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  Image.asset("assets/img/pizza.png"),
                                ]),
                                Padding(padding: EdgeInsets.only(top: 12)),
                                Text(
                                  "Pizza",
                                  style: TextStyle(
                                      color: Color(0xff969696),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Stack(alignment: Alignment.center, children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 235, 235, 240),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  Image.asset("assets/img/desert.png"),
                                ]),
                                Padding(padding: EdgeInsets.only(top: 12)),
                                Text(
                                  "Dessert",
                                  style: TextStyle(
                                      color: Color(0xff969696),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 12)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //promotions
                            Container(
                              height: 210,
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Promotions",
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 12),
                                      height: 175,
                                      width: size.height,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xffd83483),
                                            Color(0xff8660b7)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 14.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("Today’s Offer",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 22,
                                                    color: Color(0xffD4D4D4))),
                                            Text("Free Box of Fries",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 28,
                                                    color: Color(0xffD4D4D4))),
                                            Text("On all others above  200",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Color(0xffD4D4D4))),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        right: 0,
                                        top: 0,
                                        child: Image.asset(
                                            'assets/img/patato.png')),
                                  ]),
                            ),

                            Padding(padding: EdgeInsets.only(top: 12)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Most Popular",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 12),
                                      height: 190,
                                      width: size.width / 2.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xffded0d0),
                                            Color(0xffedecec)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                child: Image.asset(
                                                    "assets/img/bison.png")),
                                            Text("Bison Burgers",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18)),
                                            Container(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("\$30",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffB4AC03),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.add_circle_sharp,
                                                        size: 30,
                                                      ),
                                                      color: Color(0xff0F8D04),
                                                      onPressed: () {},
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 12),
                                      height: 190,
                                      width: size.width / 2.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xffded0d0),
                                            Color(0xffedecec)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 24),
                                              child: Image.asset(
                                                  "assets/img/gelato.png"),
                                            ),
                                            Text("Gelato",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18)),
                                            Container(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("\$30",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffB4AC03),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.add_circle_sharp,
                                                        size: 30,
                                                      ),
                                                      color: Color(0xff0F8D04),
                                                      onPressed: () {},
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
