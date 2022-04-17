import 'package:esc/models/tense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var phrase = const Text('Тебе нравится?');

class SimpleTensesPractice extends StatefulWidget {
  final Tense tense;

  const SimpleTensesPractice({Key? key, required this.tense}) : super(key: key);

  @override
  State<SimpleTensesPractice> createState() => _SimpleTensesPracticeState();
}

double _currentSliderValue = 10;

class _SimpleTensesPracticeState extends State<SimpleTensesPractice> {
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
              const EdgeInsets.fromLTRB(85, 30, 80, 35)),
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
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/clue.png',
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Показать глагол',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
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
      Text(
        widget.tense.phrase,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            fontSize: 36, fontWeight: FontWeight.w700, color: Colors.black),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
        alignment: Alignment.bottomRight,
        // width: 20,
        // height: 20,
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
          minimumSize: MaterialStateProperty.all(const Size(180, 50)),
          //elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
          foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
          overlayColor:
              MaterialStateProperty.all(Colors.lightBlueAccent.shade100),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        onPressed: () {},
        child: Text(
          widget.tense.translation,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              fontSize: 36, fontWeight: FontWeight.w700, color: Colors.black),
        ),
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
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlue.shade50,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Домой',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_ios_rounded),
              label: 'Вперед',
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: children2,
          ),
        ),
      ),
    );
  }
}
