import 'package:flutter/material.dart';

import '../login/LoginPage.dart';

class GetStartedPage extends StatefulWidget {
  GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  late Size size = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffd11771), Color(0xff7861be)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  // top img
                  buildTopIMG(),
                  SizedBox(height: 100),
                  // Text
                  buildHomeText(),

                  // Button
                  SizedBox(height: 100),

                  buildBTTN(context),
                ],
              ),
            )),
      ),
    );
  }

  SizedBox buildBTTN(BuildContext context) {
    return SizedBox(
      height: size.height * 0.06,
      width: size.width * 0.5,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: const Text(
          'Get Started',
          style: TextStyle(fontSize: 26, color: Color(0xff7861be)),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
      ),
    );
  }

  Container buildHomeText() {
    return Container(
      alignment: Alignment.bottomLeft,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(text: 'Your everyday ', style: TextStyle(fontSize: 25)),
        TextSpan(
            text: 'meal \n',
            style: TextStyle(
                fontSize: 25,
                color: Color(0xff761616),
                fontWeight: FontWeight.bold)),
        TextSpan(text: 'delivered ', style: TextStyle(fontSize: 25)),
        TextSpan(
            text: 'to you',
            style: TextStyle(
                fontSize: 25,
                color: Color(0xff761616),
                fontWeight: FontWeight.bold)),
      ])),
    );
  }

  Stack buildTopIMG() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/img/ellipse.png", width: size.width * 0.83),
        Image.asset("assets/img/purepng.png", width: size.width * 0.78),
      ],
    );
  }
}
