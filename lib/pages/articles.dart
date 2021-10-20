import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar of the page
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'Articles',
          style: GoogleFonts.scheherazade(
              fontSize: 46.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
