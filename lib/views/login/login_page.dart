import 'package:chopspick/views/Panel/panel.dart';
  import 'package:flutter/material.dart';
 
 
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xfffe8686), Color(0xffe5e5e5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 24,
                   right: 24,
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height / 6),
                    //text
                    Container(
                      alignment: Alignment.centerLeft,
                      child: buildTopText(),
                    ),
                    //email textfield
                    buildMailTF(),
                    SizedBox(height: 18),
                    //pass textfield
                    buildPassTF(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Stack(
                children: [
                  buildAboveLinear(),
                  Column(
                    children: [
                      SizedBox(height: 10),

                      // sign in button
                      buildSigninBTTN(),
                      SizedBox(height: 48),

                      buildWithText(),
                      SizedBox(height: 48),
                      //social button
                      buildSocialBTTN(),

                      // sign up
                      SizedBox(height: 48),
                      buildBottomText(context),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  Text buildWithText() {
    return Text(
      "-Or Sign in with-",
      style: TextStyle(fontSize: 15),
    );
  }

  Container buildAboveLinear() {
    return Container(
      height: size.height / 1.75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Color(0xffa46ca3).withOpacity(0.8),
              Color(0xffbf99c9).withOpacity(0.2),
            ],
          )),
    );
  }

  RichText buildBottomText(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyle(color: Colors.black, fontSize: 18),
          children: <WidgetSpan>[
            WidgetSpan(
                child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Panel()),
                );
              },
              child: Text('Sign up',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )),
          ]),
    );
  }

  Row buildSocialBTTN() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.04,
          width: size.width * 0.2,
          child: ElevatedButton(
            onPressed: () {},
            child: Image.asset("assets/img/go.png"),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 8)),
        SizedBox(
          height: size.height * 0.04,
          width: size.width * 0.2,
          child: ElevatedButton(
            onPressed: () {},
            child: Image.asset("assets/img/fb.png"),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 8)),
        SizedBox(
          height: size.height * 0.04,
          width: size.width * 0.2,
          child: ElevatedButton(
            onPressed: () {},
            child: Image.asset("assets/img/tw.png"),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        ),
      ],
    );
  }

  SizedBox buildSigninBTTN() {
    return SizedBox(
      height: size.height * 0.06,
      width: size.width * 0.76,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          'Sign in',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            primary: Color(0xff927583),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }

  Text buildTopText() {
    return Text(
      "Login to your Account",
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
  }

  TextFormField buildPassTF() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }

  TextFormField buildMailTF() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
