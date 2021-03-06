import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/tense.dart';

class ShowVerb extends StatelessWidget {
  final Tense tense;
  final bool isVerbHidden;
  final Function(bool) onPressed;

  const ShowVerb({
    Key? key,
    required this.tense,
    required this.isVerbHidden,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.fromLTRB(50, 30, 50, 35)),
        minimumSize: MaterialStateProperty.all(const Size(180, 50)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
        overlayColor:
            MaterialStateProperty.all(Colors.lightBlueAccent.shade100),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
      onPressed: () => onPressed(!isVerbHidden),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icons/clue.png',
          ),
          const SizedBox(
            width: 20,
          ),
          FittedBox(
            child: Text(
              isVerbHidden
                  ? 'Показать глагол '
                  : '${tense.verb}\n${tense.verbTranslation}',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Image.asset(
            'assets/icons/forward.png',
          ),
        ],
      ),
    );
  }
}
