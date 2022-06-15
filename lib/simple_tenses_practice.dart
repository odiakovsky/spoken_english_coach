import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:esc/dictionary_verbs.dart';
import 'package:esc/models/tense.dart';
import 'package:esc/show_phrase.dart';
import 'package:esc/show_translation.dart';
import 'package:esc/show_verb.dart';
import 'package:esc/style_button.dart';
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
  late AudioCache voicing;
  final AudioPlayer voicingPlayer = AudioPlayer();
  PlayerState voicingState = PlayerState.COMPLETED;
  late Tense tense;
  late List<Tense> tenses;
  double _currentSliderValue = 10;
  bool isVerbHidden = true;
  bool isTranslationHidden = true;

  Tense _getRandomTense() => tenses[Random().nextInt(tenses.length)];

  @override
  void initState() {
    super.initState();
    tenses = widget.tenses;
    tense = _getRandomTense();
    this.voicingPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        voicingState = event;
      });
    });
    voicing = AudioCache(prefix: "", fixedPlayer: voicingPlayer);
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
              style: styleButtonTheoryAndPractice,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/theory_of_simple_tenses', (route) => true);
              },
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
              style: styleButtonTheoryAndPractice,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DictionaryVerbs(
                      tenses: widget.tenses,
                      previouslySelectedTenses: this.tenses,
                      onSelected: (tenses) => setState(() {
                        this.tenses = tenses;
                        tense = _getRandomTense();
                      }),
                    ),
                  ),
                  (route) => true,
                );
              },
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
          onPressed: () {
            voicing.play(tense.ruVoicing);
          },
          icon: voicingState == PlayerState.PLAYING
              ? Icon(Icons.volume_up)
              : Icon(Icons.volume_off),
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
            onPressed: () {
              voicing.play(tense.enVoicing);
            },
            icon: voicingState == PlayerState.PLAYING
                ? Icon(Icons.volume_up)
                : Icon(Icons.volume_off),
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
