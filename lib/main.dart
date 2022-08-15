import 'package:esc/choose_language.dart';
import 'package:esc/choose_train.dart';
import 'package:esc/theory_of_simple_tenses.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SpokenEnglishCoach(),
          '/choose_train': (context) => ChooseTrain(),
          '/theory_of_simple_tenses': (context) => TheoryOfSimpleTenses(),
        },
      ),
    );
