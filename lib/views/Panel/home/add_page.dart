import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late Size size = MediaQuery.of(context).size;
  int simpleIntInput = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffd11771), Color(0xffa73792)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            spreadRadius: -10,
                            blurRadius: 7,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Image.asset("assets/img/biskon.png")),
                ],
              ),
            ),
          ),
        ),
        Container(
            height: 470,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(90),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xffCC1A74),
                        borderRadius: BorderRadius.all(
                          Radius.circular(28),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star,
                            size: 22,
                            color: Color(0xffDBD202),
                          ),
                          Text("4,6",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    Text("\$30",
                        style: TextStyle(
                            color: Color(0xffB4AC03),
                            fontWeight: FontWeight.bold,
                            fontSize: 26)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Bison Burgers",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_circle_down_rounded,
                            size: 25,
                          ),
                          color: Color(0xffCC1A74),
                          onPressed: () {},
                        ),
                        Text(
                          "1",
                          style: TextStyle(color: Colors.black),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_circle_up_rounded,
                            size: 25,
                          ),
                          color: Color(0xffCC1A74),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                Text(
                  "Big juicy beef burger with beef, lettuce, tomato, onions and special sauce! ",
                  style: TextStyle(fontSize: 16, color: Color(0xff787878)),
                ),
                Padding(padding: EdgeInsets.only(top: 18)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Adds Ons",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: [Color(0xffded0d0), Color(0xffedecec)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: [Color(0xffded0d0), Color(0xffedecec)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: [Color(0xffded0d0), Color(0xffedecec)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                SizedBox(
                  height: 50,
                  width: size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      /* 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                     */
                    },
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffCC1A74),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))),
                  ),
                ),
              ]),
            ))
      ]),
    );
  }
}
