import 'package:esc/models/tense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'choose_train.dart';
import 'package:csv/csv.dart';
import 'package:esc/models/tense.dart';

class SimpleTensesPractice extends StatefulWidget {
  final Tense tense;
  const SimpleTensesPractice({Key? key, required this.tense}) : super(key: key);

  @override
  State<SimpleTensesPractice> createState() => _SimpleTensesPracticeState();
}

class _SimpleTensesPracticeState extends State<SimpleTensesPractice> {
  late final List<Tense> _tenses;

  String showTranslation = 'Показать перевод';
  String showVerb = 'Показать глагол';
  String showVerbTranslation = '';
  double _currentSliderValue = 10;

  Widget _showTranslation() => Text(
        '$showTranslation',
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black),
      );

  @override
  void initState() {
    super.initState();
    // В initState нельзя использовать асинхронные функции, поэтому используем
    // конструкцию then()
    loadTenses().then((value) => _tenses = value);
  }

  Future<List<Tense>> loadTenses() async {
    // Читаем csv-файл как строку
    final csvString =
        await rootBundle.loadString('assets/csv/simple_tenses_practice.csv');
    // Конвертируем csv-строку
    final rows =
        const CsvToListConverter().convert(csvString, fieldDelimiter: ";");
    // Генерируем модельки Tense из csv
    final tenses = <Tense>[];
    for (final row in rows) {
      tenses.add(Tense.fromCSVRow(row.cast<String>()));
    }
    return tenses;
  }

  Widget _openTranslation() => Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: FittedBox(
          child: Text(
            widget.tense.translation,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                fontSize: 36, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
      );

  Widget _phraseShow() => Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: FittedBox(
          child: Text(
            widget.tense.phrase,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                fontSize: 36, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
      );

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
      ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.fromLTRB(50, 30, 50, 35)),
          //fixedSize: MaterialStateProperty.all(const Size(350, 100)),

          minimumSize: MaterialStateProperty.all(const Size(180, 50)),
          //elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
          overlayColor:
              MaterialStateProperty.all(Colors.lightBlueAccent.shade100),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        onPressed: () {
          setState(
            () {
              showVerb = widget.tense.verb;
              showVerbTranslation = widget.tense.verbTranslation;
            },
          );
        },
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
              '$showVerb\n$showVerbTranslation',
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
      _phraseShow(),
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
      ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.fromLTRB(50, 30, 50, 30)),
          //minimumSize: MaterialStateProperty.all(const Size(180, 50)),
          fixedSize: MaterialStateProperty.all(const Size(350, 100)),
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
          foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
          overlayColor:
              MaterialStateProperty.all(Colors.lightBlueAccent.shade100),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        onPressed: () {
          setState(() {
            showTranslation = widget.tense.translation;
          });
        },
        child: _showTranslation(),
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
            'Установить задержку',
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(180, 50)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade50),
                  foregroundColor:
                      MaterialStateProperty.all(Colors.grey.shade700),
                  overlayColor: MaterialStateProperty.all(
                      Colors.lightBlueAccent.shade100),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
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
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(180, 50)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade50),
                  foregroundColor:
                      MaterialStateProperty.all(Colors.grey.shade700),
                  overlayColor: MaterialStateProperty.all(
                      Colors.lightBlueAccent.shade100),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                onPressed: () {
                  //changePhrase();
                },

                //() {
                //setState(() {

                //_phraseShow() = new;
                //tense:
                //widget.tense.translation = showTranslation;
                //_openTranslation() = _showTranslation();
                //});
                //},
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
