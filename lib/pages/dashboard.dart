// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// @dart=2.9
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:mental_fitness_solution/pages/survey.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // App bar of the page

      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 15.0, 0, 0),
              child: GradientText(
                '\tSay Hello to your \nHealthcare partner !!',
                style: GoogleFonts.andada(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w600,
                ),
                colors: [
                  Colors.blue,
                  Colors.red,
                  Colors.teal,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 120.0, 0, 0),
              child: Text(
                'It is a free mental health service providing platform.....',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15.0,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  child: Container(
                    height: 50.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Take survey >>',
                          style: GoogleFonts.andada(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Here write the function to go to the template based chat.
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Survey(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
