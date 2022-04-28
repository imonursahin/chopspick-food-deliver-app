import 'package:chopspick/views/login/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Column(
              children: [
                SizedBox(height: size.height / 5),
                //text
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create an Account",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                //name textfield
                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                SizedBox(height: 18),
                //email textfield
                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                SizedBox(height: 18),

                //pass textfield
                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),

                SizedBox(height: 24),
                // sign up button
                SizedBox(
                  height: size.height * 0.06,
                  width: size.width * 0.76,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff927583),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                SizedBox(height: 48),

                Text(
                  "-Or Sign up with-",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 48),
//button
                Row(
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
                ),

                // sign up
                SizedBox(height: 48),

                RichText(
                  text: TextSpan(
                      text: 'Already have an account ',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      children: <WidgetSpan>[
                        WidgetSpan(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text('Sign in',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )),
                      ]),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
