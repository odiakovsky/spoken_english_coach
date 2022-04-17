
import 'package:flutter/material.dart';

var styleButton = ButtonStyle(
  minimumSize: MaterialStateProperty.all(Size(300, 50)),
  elevation: MaterialStateProperty.all(10),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
  overlayColor: MaterialStateProperty.all(Colors.lightBlueAccent.shade100),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
);
