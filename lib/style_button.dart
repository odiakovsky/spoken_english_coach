import 'package:flutter/material.dart';

var styleButtonChooseLanguage = ButtonStyle(
  minimumSize: MaterialStateProperty.all(Size(300, 60)),
  elevation: MaterialStateProperty.all(10),
  backgroundColor: MaterialStateProperty.all(Color(0xFF5A88A3)),
  foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
  overlayColor: MaterialStateProperty.all(Colors.lightBlueAccent.shade100),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
  ),
);

var styleButtonTheoryAndPractice = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
  minimumSize: MaterialStateProperty.all(const Size(180, 30)),
  elevation: MaterialStateProperty.all(10),
  backgroundColor: MaterialStateProperty.all(Color(0xFF5A88A3)),
  foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
  overlayColor: MaterialStateProperty.all(Colors.lightBlue.shade50),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
);
