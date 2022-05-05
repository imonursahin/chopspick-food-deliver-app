import 'package:chopspick/views/register/RegisterPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../views_model/auth/AuthService.dart';
import '../Panel/Panel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size size = MediaQuery.of(context).size;
  int simpleIntInput = 1;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xfffe8686), Color(0xffe5e5e5)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Padding(
              padding: EdgeInsets.only(
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
                      "Login to your Account",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  //email textfield
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildMailTF(),
                        SizedBox(height: 18),
                        //pass textfield
                        buildPassTF(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 470,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Color(0xffa46ca3).withOpacity(0.8),
                    Color(0xffbf99c9).withOpacity(0.2),
                  ],
                )),
            child: Column(
              children: [
                SizedBox(height: 10),

                // sign in button
                buildLoginButton(context),
                SizedBox(height: 48),

                Text(
                  "-Or Sign in with-",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 48),
                //social button
                BuildSocialBTTN(),

                // sign up
                SizedBox(height: 48),
                buildRegisterTextBTTN(context),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  RichText buildRegisterTextBTTN(BuildContext context) {
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
                  MaterialPageRoute(builder: (context) => RegisterPage()),
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

  Row BuildSocialBTTN() {
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

  SizedBox buildLoginButton(BuildContext context) {
    return SizedBox(
      height: size.height * 0.06,
      width: size.width * 0.76,
      child: ElevatedButton(
        onPressed: () async {
          var provider = Provider.of<AuthService>(context, listen: false);

          if (_formKey.currentState!.validate()) {
            try {
              await provider
                  .login(_emailController.text, _passwordController.text)
                  .then((value) {
                Fluttertoast.showToast(
                    msg: "Bilgileriniz doğru, giriş yapılıyor...");
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Panel()),
                    (Route<dynamic> route) => false);
              });
            } on FirebaseAuthException catch (error) {
              errorMessage = error.message!;
              Fluttertoast.showToast(msg: errorMessage);
            }
          }
        },
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

  TextFormField buildPassTF() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        _passwordController.text = value!;
      },
    );
  }

  TextFormField buildMailTF() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        _emailController.text = value!;
      },
    );
  }
}
