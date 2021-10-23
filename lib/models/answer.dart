
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answer extends StatefulWidget {
  final VoidCallback handler;
  final String answer;
  const Answer({Key? key, required this.handler, required this.answer})
      : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          // onTap: () {
          //   widget.handler;
          //   setState(() {
          //     widget.color = Colors.black;
          //   });
          // },
          onTap: widget.handler,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[300],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.answer,
                  style: GoogleFonts.portLligatSans(
                    textStyle: Theme.of(context).textTheme.headline1,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
