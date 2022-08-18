import 'package:esc/theme/config.dart';
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
            const EdgeInsets.fromLTRB(50, 30, 50, 30)),
        fixedSize: MaterialStateProperty.all(const Size(410, 120)),
        backgroundColor: MaterialStateProperty.all(
          currentTheme.currentTheme == ThemeMode.light
              ? Color(0xFFCDDDE7)
              : Color(0xFF05324D),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
        overlayColor:
            MaterialStateProperty.all(Colors.lightBlueAccent.shade100),
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
          Expanded(
            child: Text(
              isVerbHidden
                  ? 'Показать глагол '
                  : '${tense.verb}\n${tense.verbTranslation}',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color:  currentTheme.currentTheme ==
              ThemeMode.light
              ? Colors.black
                : Colors.white,),
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
