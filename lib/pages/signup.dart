// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, avoid_print
// @dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mental_fitness_solution/backend/apis.dart';
import 'package:mental_fitness_solution/main.dart';
import 'package:mental_fitness_solution/pages/login.dart';
import 'package:mental_fitness_solution/pages/welcome.dart';
import 'package:mental_fitness_solution/widgets/bezier_container.dart';
import 'package:mental_fitness_solution/widgets/bottom_navbar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _validateName = false;
  bool _validateEmail = false;
  bool _validatePassword = false;

  var details = {};

  Widget _backButton() {
    return GestureDetector(
      onTap: () {
        // Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomePage(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            // Container(
            //   padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
            //   child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            // ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            // Text('Back',
            //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  // String emailValidation(TextEditingController controller, bool validate) {
  //   if (controller.text.isEmpty) {
  //     return 'Email cannot be empty';
  //   } else if (!controller.text.contains('@')) {
  //     return 'Email should contain "@"';
  //   }
  //   else{
  //     return '';
  //   }

  // }

  // String passwordValidation(TextEditingController controller, bool validate) {
  //   if (controller.text.isEmpty) {
  //     return 'Password cannot be empty';
  //   } else if (controller.text.length < 5) {
  //     return 'Paasword must be atleast 6 characters';
  //   }

  //   else{
  //     return '';
  //   }
  // }

  // String nameValidation(TextEditingController controller, bool validate) {
  //   if (controller.text.isEmpty) {
  //     return 'Name cannot be empty';
  //   }

  //   else{
  //     return '';
  //   }
  // }

  Widget _entryField(
      String title, TextEditingController controller, bool validate,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
              errorText: validate ? 'Error' : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _name.text.isEmpty ? _validateName = true : _validateName = false;

          _email.text.isEmpty ? _validateEmail = true : _validateEmail = false;

          _email.text.contains('@')
              ? _validateEmail = false
              : _validateEmail = true;

          _password.text.isEmpty
              ? _validatePassword = true
              : _validatePassword = false;

          _password.text.length > 5
              ? _validatePassword = false
              : _validatePassword = true;
        });

        if (_validateName == false &&
            _validateEmail == false &&
            _validatePassword == false) {
          // print(details);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => Survey(),
          //   ),
          // );
          await signupUser(_name.text, _email.text, _password.text);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xffa192ff),
              Color(0xffb7acff),
            ],
          ),
        ),
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Min',
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w700,
              color: Color(0xffe46b10)),
          children: [
            TextSpan(
              text: 'dD',
              style: TextStyle(color: Colors.black, fontSize: 50),
            ),
            TextSpan(
              text: 'oc',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 50),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Name", _name, _validateName),
        _entryField("Email id", _email, _validateEmail),
        _entryField("Password", _password, _validatePassword, isPassword: true),
      ],
    );
  }

  Future<void> signupUser(String name, String email, String password) async {
    var details = {};
    details['name'] = _name.text;
    details['email'] = _email.text;
    details['password'] = _password.text;
    print(jsonEncode(details));
    String url = 'https://chatbot-backend-mhcb.herokuapp.com/signup';
    var response = await APIS.getResponse(url, details);
    // print('response: $response');
    if (response != 'Failed' && response != 'error') {
      // print('Called');
      Final.userEmail = email;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavBar(),
        ),
      );
    } else {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(
                color1: Color(0xffa192ff),
                color2: Color(0xffa192ff),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
