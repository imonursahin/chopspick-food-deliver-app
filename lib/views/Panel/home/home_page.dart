import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        body: Column(
          children: [
            //top bar
            Padding(
                padding: const EdgeInsets.all(12.0),
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
                      Padding(padding: EdgeInsets.only(top: 24)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Promotions",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),

                          //promotions
                          Stack(
                              alignment: Alignment.topRight,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 12),
                                  height: 175,
                                  width: size.width / 1,
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
                                    padding: const EdgeInsets.only(left: 14.0),
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
                                Image.asset('assets/img/patato.png'),
                              ]),

                          Padding(padding: EdgeInsets.only(top: 24)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Most Popular",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ])),
          ],
        ),
      ),
    );
  }
}
