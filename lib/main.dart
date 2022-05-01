import 'package:esc/theory_of_simple_tenses.dart';
import 'package:flutter/material.dart';
import 'choose_language.dart';
import 'package:esc/choose_train.dart';
import 'dictionary_verbs.dart';
import 'models/tense.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => SpokenEnglishCoach(),
          '/choose_train': (context) => ChooseTrain(),
          '/theory_of_simple_tenses': (context) => TheoryOfSimpleTenses(),
          '/dictionary_verbs': (context) => DictionaryVerbs(),
        },
      ),
    );
