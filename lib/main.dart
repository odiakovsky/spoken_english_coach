import 'package:flutter/material.dart';
import 'choose_language.dart';
import 'package:esc/choose_train.dart';
import 'simple_tenses_practice.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SpokenEnglishCoach(),
        '/choose_train': (context) => ChooseTrain(),
        '/simple_tenses_practice': (context) => SimpleTensesPractice(),
      },
    ));
