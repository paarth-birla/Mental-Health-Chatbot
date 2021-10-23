// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_fitness_solution/widgets/bottom_navbar.dart';
import 'package:flutter_launch/flutter_launch.dart';

class PopUp extends StatelessWidget {
  const PopUp({Key? key}) : super(key: key);

  void openWhatsapp() async {
    await FlutterLaunch.launchWhatsapp(
        phone: "+917977726430", message: "Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Would you like to chat with our Associate?',
                      style: GoogleFonts.portLligatSans(
                        textStyle: Theme.of(context).textTheme.headline1,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => openWhatsapp(),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sure',
                              style: GoogleFonts.portLligatSans(
                                textStyle:
                                    Theme.of(context).textTheme.headline1,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavBar(),
                          ),
                        ),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            // color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'No',
                              style: GoogleFonts.portLligatSans(
                                textStyle:
                                    Theme.of(context).textTheme.headline1,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -60,
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: 60,
              child: Icon(
                Icons.assistant_photo,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
