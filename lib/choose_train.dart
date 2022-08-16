import 'package:csv/csv.dart';
import 'package:esc/models/tense.dart';
import 'package:esc/simple_tenses_practice.dart';
import 'package:esc/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'style_button.dart';

class ChooseTrain extends StatefulWidget {
  const ChooseTrain({Key? key}) : super(key: key);

  @override
  State<ChooseTrain> createState() => _ChooseTrainState();
}

class _ChooseTrainState extends State<ChooseTrain> {
  // Поле, в которое будем единожды считывать все Tense
  late final List<Tense> _tenses;

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: currentTheme.currentTheme == ThemeMode.light
                ? BoxDecoration(
                    color: Color(0xFFF6F6F6),
                  )
                : BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                    Color(0xFF222229),
                    Color(0xFF6490AA),
                    Color(0xFF222229),
                  ])),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Выберите тренировку:',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.currentTheme == ThemeMode.light
                            ? Colors.grey.shade900
                            : Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    constraints: BoxConstraints.loose(const Size(450, 140)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: currentTheme.currentTheme == ThemeMode.light
                          ? Color(0xFFCDDDE7)
                          : Color(0xFF05324D),
                      elevation: 10,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '1 уровень',
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: currentTheme.currentTheme ==
                                          ThemeMode.light
                                      ? Color(0xFF265D7E)
                                      : Color(0xFF5987A3)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                            child: Column(
                              children: [
                                Text(
                                  'Простое время',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: currentTheme.currentTheme ==
                                            ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Text(
                                  'The simple tenses',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: currentTheme.currentTheme ==
                                            ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: styleButtonTheoryAndPractice,
                                      onPressed: () {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            '/theory_of_simple_tenses',
                                            (route) => true);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icons/textbook.png',
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
                                              color: Colors.white,
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
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    ElevatedButton(
                                      style: styleButtonTheoryAndPractice,
                                      onPressed: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SimpleTensesPractice(
                                              // Выбираем случайный Tense
                                              tenses: _tenses,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icons/speaking.png',
                                            width: 26,
                                            height: 26,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Практика',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            'assets/icons/forward.png',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints.loose(const Size(450, 140)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: currentTheme.currentTheme == ThemeMode.light
                          ? Color(0xFFCDDDE7)
                          : Color(0xFF05324D),
                      elevation: 10,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.lock_outline,
                              color: currentTheme.currentTheme ==
                                  ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                            child: Column(
                              children: [
                                Text(
                                  'Глагол to be',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: currentTheme.currentTheme ==
                                            ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Text(
                                  '(быть, находиться)',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: currentTheme.currentTheme ==
                                            ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: styleButtonTheoryAndPractice,
                                      onPressed: null,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icons/textbook.png',
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
                                                color: Colors.white),
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
                                      onPressed: null,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icons/speaking.png',
                                            width: 26,
                                            height: 26,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Практика',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            'assets/icons/forward.png',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints.loose(const Size(450, 140)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: currentTheme.currentTheme == ThemeMode.light
                          ? Color(0xFFCDDDE7)
                          : Color(0xFF05324D),
                      elevation: 10,
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child:    Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.lock_outline,
                                color: currentTheme.currentTheme ==
                                    ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '2 уровень',
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: currentTheme.currentTheme ==
                                          ThemeMode.light
                                      ? Color(0xFF265D7E)
                                      : Color(0xFF5987A3)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                            child: Column(
                              children: [
                                Text(
                                  'Простое время',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: currentTheme.currentTheme ==
                                            ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Text(
                                  'The simple tenses',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: currentTheme.currentTheme ==
                                            ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: styleButtonTheoryAndPractice,
                                      onPressed: null,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icons/textbook.png',
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
                                                color: Colors.white),
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
                                      onPressed: null,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icons/speaking.png',
                                            width: 26,
                                            height: 26,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Практика',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            'assets/icons/forward.png',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints.loose(const Size(450, 140)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: currentTheme.currentTheme == ThemeMode.light
                          ? Color(0xFFCDDDE7)
                          : Color(0xFF05324D),
                      elevation: 10,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.lock_outline,
                              color: currentTheme.currentTheme ==
                                  ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                            child: Column(
                              children: [
                                Text(
                                  'Продолженное время',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: currentTheme.currentTheme ==
                                            ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Text(
                                  'The Continuous Tenses',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: currentTheme.currentTheme ==
                                            ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: styleButtonTheoryAndPractice,
                                      onPressed: null,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icons/textbook.png',
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
                                                color: Colors.white),
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
                                      onPressed: null,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icons/speaking.png',
                                            width: 26,
                                            height: 26,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Практика',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            'assets/icons/forward.png',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints.loose(const Size(450, 140)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: currentTheme.currentTheme == ThemeMode.light
                          ? Color(0xFFCDDDE7)
                          : Color(0xFF05324D),
                      elevation: 10,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                           Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.lock_outline,
                              color: currentTheme.currentTheme ==
                                  ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                            child: Column(
                              children: [
                                Text(
                                  'Совершенное время',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: currentTheme.currentTheme ==
                                            ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Text(
                                  'The Perfect Tenses',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: currentTheme.currentTheme ==
                                            ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: styleButtonTheoryAndPractice,
                                      onPressed: null,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icons/textbook.png',
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
                                                color: Colors.white),
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
                                      onPressed: null,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icons/speaking.png',
                                            width: 26,
                                            height: 26,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Практика',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            'assets/icons/forward.png',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
