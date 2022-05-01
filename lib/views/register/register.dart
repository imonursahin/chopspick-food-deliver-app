import 'package:chopspick/views/login/login_page.dart';
import 'package:chopspick/views_model/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late Size size = MediaQuery.of(context).size;
  int simpleIntInput = 1;

  final _nameController = TextEditingController();
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
                  SizedBox(height: size.height / 6),
                  //text
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Create an Account",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  //name textfield
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildNameTF(),
                        SizedBox(height: 1),
                        //email textfield
                        buildMailTF(),
                        SizedBox(height: 1),
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
            height: 460,
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

                // sign up button
                buildRegisterBTTN(),
                SizedBox(height: 48),

                Text(
                  "-Or Sign up with-",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 48),
                //social button
                buildSocialButton(),

                // sign in
                SizedBox(height: 48),
                buildLoginTextBTTN(context),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  RichText buildLoginTextBTTN(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Already have an account? ',
          style: TextStyle(color: Colors.black, fontSize: 18),
          children: <WidgetSpan>[
            WidgetSpan(
                child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Sign in',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )),
          ]),
    );
  }

  Row buildSocialButton() {
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

  SizedBox buildRegisterBTTN() {
    return SizedBox(
      height: size.height * 0.06,
      width: size.width * 0.76,
      child: ElevatedButton(
        onPressed: () async {
          var provider = Provider.of<Auth>(context, listen: false);

          if (_formKey.currentState!.validate()) {
            try {
              await provider.register(_nameController.text,
                  _emailController.text, _passwordController.text);

              Fluttertoast.showToast(
                  msg:
                      "Başarıyla kayıt oldunuz. Giriş yaparak hesabınıza ulaşabilirsiniz...");
            } on FirebaseAuthException catch (error) {
              errorMessage = error.message!;
              Fluttertoast.showToast(msg: errorMessage);
            }
          }
        },
        child: const Text(
          'Sign up',
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

  TextFormField buildNameTF() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          labelText: 'Name',
          labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        _nameController.text = value!;
      },
    );
  }
}
