// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_fitness_solution/backend/apis.dart';
import 'package:mental_fitness_solution/main.dart';
import 'package:mental_fitness_solution/pages/signup.dart';
import 'package:mental_fitness_solution/pages/welcome.dart';
import 'package:mental_fitness_solution/widgets/bezier_container.dart';
import 'package:mental_fitness_solution/widgets/bottom_navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _validateEmail = false;
  bool _validatePassword = false;

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
            //   decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.black,
            //       width: 1.5,
            //       style: BorderStyle.solid,
            //     ),
            //     borderRadius: BorderRadius.circular(50),
            //   ),
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
                  color: Colors.transparent,
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
            // Text(
            //   'Back',
            //   style: TextStyle(
            //     fontSize: 12,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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

        if (_validateEmail == false && _validatePassword == false) {
          // Final.userEmail = _email.text;
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => Survey(),
          //   ),
          // );
          await loginUser(_email.text, _password.text);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
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
            colors: const [
              Color(0xffff9292),
              Color(0xffffacac),
            ],
          ),
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
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
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'dD',
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
              ),
            ),
            TextSpan(
              text: 'oc',
              style: TextStyle(
                color: Color(0xffe46b10),
                fontSize: 50,
              ),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email id", _email, _validateEmail),
        _entryField("Password", _password, _validatePassword, isPassword: true),
      ],
    );
  }

  Future<void> loginUser(String email, String password) async {
    var details = {};
    details['email'] = _email.text;
    details['password'] = _password.text;
    print(details);
    String url = 'https://chatbot-backend-mhcb.herokuapp.com/signin';
    var response = await APIS.getResponse(url, details);
    print(response);
    if (response != 'Failed') {
      Final.userEmail = email;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavBar(),
        ),
      );
      // showDialog(context: context, builder: (BuildContext context) => PopUp());
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
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(
                color1: Color(0xffff9292),
                color2: Color(0xffff9292),
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
                    SizedBox(height: 50),
                    // Column(
                    //   children: [
                    //     Container(
                    //       margin: EdgeInsets.symmetric(vertical: 10),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: <Widget>[
                    //           Text(
                    //             'Email Id',
                    //             style: TextStyle(
                    //                 fontWeight: FontWeight.bold, fontSize: 20),
                    //           ),
                    //           SizedBox(
                    //             height: 10,
                    //           ),
                    //           TextField(
                    //             obscureText: false,
                    //             decoration: InputDecoration(
                    //               border: InputBorder.none,
                    //               fillColor: Color(0xfff3f3f4),
                    //               filled: true,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: 10,
                    //     ),
                    //     Container(
                    //       margin: EdgeInsets.symmetric(vertical: 10),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: <Widget>[
                    //           Text(
                    //             'Password',
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 20,
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 10,
                    //           ),
                    //           TextField(
                    //             obscureText: true,
                    //             decoration: InputDecoration(
                    //               border: InputBorder.none,
                    //               fillColor: Color(0xfff3f3f4),
                    //               filled: true,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    _emailPasswordWidget(),
                    SizedBox(height: 20),
                    _submitButton(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password ?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: height * .055),
                    _createAccountLabel(),
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
