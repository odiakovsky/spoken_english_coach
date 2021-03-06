import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowTranslation extends StatelessWidget {
  final String translation;
  final bool isTranslationHidden;
  final Function(bool) onPressed;

  const ShowTranslation({
    Key? key,
    required this.translation,
    required this.isTranslationHidden,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.fromLTRB(50, 30, 50, 30)),
        fixedSize: MaterialStateProperty.all(const Size(350, 100)),
        backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
        foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
        overlayColor:
            MaterialStateProperty.all(Colors.lightBlueAccent.shade100),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
      onPressed: () => onPressed(!isTranslationHidden),
      child: FittedBox(
        child: Text(
          isTranslationHidden ? 'Показать перевод' : translation,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
    );
  }
}
