// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_fitness_solution/pages/login.dart';
// import 'package:mental_fitness_solution/pages/signup.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Widget _getStartedButton() {
  //   return InkWell(
  //     onTap: () {},
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       height: 70,
  //       padding: EdgeInsets.symmetric(vertical: 13),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.all(
  //           Radius.circular(30),
  //         ),
  //         boxShadow: <BoxShadow>[
  //           BoxShadow(
  //               color: Color(0xffdf8e33).withAlpha(100),
  //               offset: Offset(2, 4),
  //               blurRadius: 8,
  //               spreadRadius: 2)
  //         ],
  //         color: Colors.black,
  //       ),
  //       child: Text(
  //         'Get Started',
  //         style: TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.w600,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _submitButton() {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const LoginPage()));
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       padding: EdgeInsets.symmetric(vertical: 13),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(5)),
  //           boxShadow: <BoxShadow>[
  //             BoxShadow(
  //                 color: Color(0xffdf8e33).withAlpha(100),
  //                 offset: Offset(2, 4),
  //                 blurRadius: 8,
  //                 spreadRadius: 2)
  //           ],
  //           color: Colors.white),
  //       child: Text(
  //         'Login',
  //         style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
  //       ),
  //     ),
  //   );
  // }

  // Widget _signUpButton() {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => SignUpPage()));
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       padding: EdgeInsets.symmetric(vertical: 13),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.all(Radius.circular(5)),
  //         border: Border.all(color: Colors.white, width: 2),
  //       ),
  //       child: Text(
  //         'Register now',
  //         style: TextStyle(fontSize: 20, color: Colors.white),
  //       ),
  //     ),
  //   );
  // }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Min',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'dD',
              style: TextStyle(color: Colors.black, fontSize: 50),
            ),
            TextSpan(
              text: 'oc',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xfff0b021),
                Color(0xfff0b021),
              ],
            ),
          ),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     _title(),
          //     SizedBox(
          //       height: 80,
          //     ),
          //     _submitButton(),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     _signUpButton(),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     _getStartedButton(),
          //   ],
          // ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.20,
                child: _title(),
              ),
              Positioned(
                bottom: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(title: '',),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 70,
                    padding: EdgeInsets.symmetric(vertical: 13),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color(0xffdf8e33).withAlpha(100),
                            offset: Offset(2, 4),
                            blurRadius: 8,
                            spreadRadius: 2)
                      ],
                      color: Colors.black,
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
