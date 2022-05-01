import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esc/models/tense.dart';
import 'package:esc/card_of_verb.dart';

class DictionaryVerbs extends StatefulWidget {
  const DictionaryVerbs({
    Key? key,
  }) : super(key: key);

  @override
  State<DictionaryVerbs> createState() => _DictionaryVerbsState();
}

class _DictionaryVerbsState extends State<DictionaryVerbs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'Выберите глаголы:',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 25,
              ),
              cardOfVerb,
            ],
          ),
        ),
      ),
    );
  }
}
