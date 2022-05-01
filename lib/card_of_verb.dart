import 'dart:math';

import 'package:esc/style_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esc/dictionary_verbs.dart';

class CardOfVerb extends StatelessWidget {
  const CardOfVerb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardOfVerb;
  }
}

var cardOfVerb = Container(
  constraints: BoxConstraints(
      maxWidth: double.maxFinite,
      minWidth: double.minPositive,
      maxHeight: double.infinity,
      minHeight: double.minPositive),
  child: Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    color: Colors.yellow.shade50,
    elevation: 10,
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              Text(
                'Глагол to be',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade900),
              ),
              Text(
                '(быть, находиться)',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade900),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
