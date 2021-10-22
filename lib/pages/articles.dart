import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [
    "Apple",
    "Google",
    "Facebook",
    "Instagram",
  ];

  static Map links = {
    "Apple": "https://www.apple.com/in/",
    "Google": "https://www.google.co.in/",
    "Facebook": "https://www.facebook.com/",
    "Instagram": "https://www.instagram.com/",
  };

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  openUrl(String data) async {
    if (await canLaunch(links[data])) {
      await launch(links[data]);
    } else {
      throw 'Could not launch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // App bar of the page
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'Articles',
          style: GoogleFonts.andada(
            fontSize: 34.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
                hintStyle: GoogleFonts.andada(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: newDataList.map((data) {
                return ListTile(
                  title: Text(
                    data,
                    style: GoogleFonts.andada(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () => openUrl(data),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// CheckPoint