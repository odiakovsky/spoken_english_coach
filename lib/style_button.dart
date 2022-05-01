import 'package:flutter/material.dart';

var styleButtonChooseLanguage = ButtonStyle(
  minimumSize: MaterialStateProperty.all(Size(300, 50)),
  elevation: MaterialStateProperty.all(10),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
  overlayColor: MaterialStateProperty.all(Colors.lightBlueAccent.shade100),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
);

var styleButtonTheoryAndPractice = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
  minimumSize: MaterialStateProperty.all(const Size(180, 30)),
  elevation: MaterialStateProperty.all(10),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
  overlayColor: MaterialStateProperty.all(Colors.lightBlue.shade50),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
);
