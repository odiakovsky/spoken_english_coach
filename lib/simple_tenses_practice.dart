import 'package:esc/models/tense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleTensesPractice extends StatefulWidget {
  final List<Tense> tenses;

  const SimpleTensesPractice({Key? key, required this.tenses})
      : super(key: key);

  @override
  State<SimpleTensesPractice> createState() => _SimpleTensesPracticeState();
}

class _SimpleTensesPracticeState extends State<SimpleTensesPractice> {
  late Tense tense;
  double _currentSliderValue = 10;
  bool isVerbHidden = true;
  bool isTranslationHidden = true;

  Tense _getRandomTense() => (widget.tenses..shuffle()).first;

  @override
  void initState() {
    super.initState();
    tense = _getRandomTense();
  }

  @override
  Widget build(BuildContext context) {
    var children2 = [
      const SizedBox(
        height: 50,
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(180, 50)),
                elevation: MaterialStateProperty.all(10),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor:
                    MaterialStateProperty.all(Colors.grey.shade700),
                overlayColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent.shade100),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              onPressed: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/theory.png',
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Теория',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/icons/forward.png',
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(180, 50)),
                elevation: MaterialStateProperty.all(10),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor:
                    MaterialStateProperty.all(Colors.grey.shade700),
                overlayColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent.shade100),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              onPressed: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/textbook.png',
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Словарь',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/icons/forward.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      ShowVerb(
        tense: tense,
        isVerbHidden: isVerbHidden,
        onPressed: (isHidden) {
          setState(() {
            isVerbHidden = isHidden;
          });
        },
      ),
      const SizedBox(
        height: 40,
      ),
      Text(
        'Фраза:',
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
      ),
      const SizedBox(
        height: 10,
      ),
      ShowPhrase(phrase: tense.phrase),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
        alignment: Alignment.bottomRight,
        child: IconButton(
          iconSize: 30,
          color: Colors.black,
          onPressed: () {},
          icon: const Icon(Icons.volume_off),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        'Перевод:',
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
      ),
      const SizedBox(
        height: 10,
      ),
      ShowTranslation(
        translation: tense.translation,
        isTranslationHidden: isTranslationHidden,
        onPressed: (isHidden) {
          setState(() {
            isTranslationHidden = isHidden;
          });
        },
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
            value: false,
            onChanged: (bool value) {},
          ),
          Text(
            'Автоматический режим',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
          ),
          const SizedBox(
            width: 60,
          ),
          IconButton(
            iconSize: 30,
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(Icons.volume_off),
          ),
        ],
      ),
      Slider(
        value: _currentSliderValue,
        min: 0,
        max: 30,
        divisions: 6,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.blue.shade50,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue.shade50)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/back.png',
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Домой',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue.shade50)),
                onPressed: () => setState(() {
                  isVerbHidden = true;
                  isTranslationHidden = true;
                  tense = _getRandomTense();
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Вперед',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      'assets/icons/forward.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
            children: children2,
          ),
        ),
      ),
    );
  }
}

class ShowPhrase extends StatelessWidget {
  final String phrase;

  const ShowPhrase({
    Key? key,
    required this.phrase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: FittedBox(
        child: Text(
          phrase,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              fontSize: 36, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
    );
  }
}

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
          Text(
            isVerbHidden
                ? 'Показать глагол '
                : '${tense.verb}\n${tense.verbTranslation}',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),
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
      child: Text(
        isTranslationHidden ? 'Показать превод' : translation,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black),
      ),
    );
  }
}
