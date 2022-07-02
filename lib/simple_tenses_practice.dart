import 'dart:async';
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
  final AudioPlayer _phraseAudioPlayer = AudioPlayer();
  final AudioPlayer _translationAudioPlayer = AudioPlayer();
  late AudioCache phraseVoicing;
  late AudioCache translationVoicing;
  bool _isTranslationVoicingEnabled = false;
  bool _isPhraseVoicingEnabled = false;

  late Tense tense;
  late List<Tense> tenses;
  double _currentSliderValue = 10;
  bool isVerbHidden = true;
  bool isTranslationHidden = true;

  bool isAutoModeEnabled = false;
  Timer? timer = null;

  Tense _getNextTense() {
    final next = Random().nextInt(tenses.length);
    tense = tenses[next];
    if (tenses.length > 1) {
      tenses.removeAt(next);
    } else {
      tenses = List<Tense>.from(widget.tenses);
    }
    return tense;
  }

  void _showNext() async {
    setState(() {
      isVerbHidden = true;
      isTranslationHidden = true;
      tense = _getNextTense();
    });
    if (_isPhraseVoicingEnabled) {
      phraseVoicing.play(tense.ruVoicing);
    }
  }

  @override
  void initState() {
    super.initState();
    tenses = List<Tense>.from(widget.tenses);
    tense = _getNextTense();
    phraseVoicing = AudioCache(prefix: "", fixedPlayer: _phraseAudioPlayer);
    translationVoicing =
        AudioCache(prefix: "", fixedPlayer: _translationAudioPlayer);
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
                        tense = _getNextTense();
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
            if (!_isPhraseVoicingEnabled) {
              phraseVoicing.play(tense.ruVoicing);
            }
            setState(() {
              _isPhraseVoicingEnabled = !_isPhraseVoicingEnabled;
            });
          },
          icon: _isPhraseVoicingEnabled
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
          if (_isTranslationVoicingEnabled && isTranslationHidden) {
            translationVoicing.play(tense.enVoicing);
          }
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
            value: isAutoModeEnabled,
            onChanged: (bool value) async {
              setState(() {
                isAutoModeEnabled = value;
              });
              if (isAutoModeEnabled) {
                timer?.cancel();
                timer = Timer.periodic(
                  Duration(seconds: _currentSliderValue.toInt()),
                  (_) => _showNext(),
                );
              } else {
                timer?.cancel();
              }
            },
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
              setState(() {
                _isTranslationVoicingEnabled = !_isTranslationVoicingEnabled;
              });
            },
            icon: _isTranslationVoicingEnabled
                ? Icon(Icons.volume_up)
                : Icon(Icons.volume_off),
          ),
        ],
      ),
      Slider(
        value: _currentSliderValue,
        min: 5,
        max: 30,
        divisions: 5,
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
                onPressed: _showNext,
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
