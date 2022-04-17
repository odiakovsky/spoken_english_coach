import 'package:flutter/material.dart';
import 'choose_language.dart';
import 'package:esc/choose_train.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => SpokenEnglishCoach(),
          '/choose_train': (context) => ChooseTrain(),
        },
      ),
    );
