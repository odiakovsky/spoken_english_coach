import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowPhrase extends StatelessWidget {
  final String phrase;

  const ShowPhrase({
    Key? key,
    required this.phrase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: FittedBox(
        child: Text(
          phrase,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              fontSize: 36, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
    );
  }
}
