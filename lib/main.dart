// ignore_for_file: prefer_const_constructors, unused_import, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_fitness_solution/pages/dashboard.dart';
import 'package:mental_fitness_solution/pages/signup.dart';
import 'package:mental_fitness_solution/pages/survey.dart';
import 'package:mental_fitness_solution/pages/welcome.dart';
import 'package:mental_fitness_solution/widgets/bottom_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static void whatsAppOpen() async {
    var whatsappUrl = "whatsapp://send?phone=+917977726430";
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : print(
            "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(title: '',),
    );
  }
}

class Final {
  static var userEmail;
}
