import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esc/models/tense.dart';
import 'package:esc/card_of_verb.dart';

class DictionaryVerbs extends StatefulWidget {
  final List<Tense> tenses;

  const DictionaryVerbs({
    Key? key,
    required this.tenses,
  }) : super(key: key);

  @override
  State<DictionaryVerbs> createState() => _DictionaryVerbsState();
}

class _DictionaryVerbsState extends State<DictionaryVerbs> {
  bool allChecked = true;
  late List<Tense> selectedTenses;

  @override
  void initState() {
    super.initState();
    selectedTenses = List<Tense>.from(widget.tenses);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Выберите глаголы:',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            CheckAll(
              isChecked: allChecked,
              onCheck: () {
                setState(() {
                  if (allChecked) {
                    selectedTenses.clear();
                  } else {
                    selectedTenses.addAll(widget.tenses);
                  }
                  allChecked = !allChecked;
                });
              },
            ),
            //Нужно чтобы из таких карточек выводился весь список глаголов. Попорядку, не перемешивая.
            //Наверное нужно использовать какой-нибудь ListView.
            //Сейчас загружен файл с сотней глаголов. То есть из нашей модели он должен подставлять
            //в карточку verb и verbTranslation. В карточке есть чекбокс. Нужно сделать так, что если я выберу,
            //например, два глагола и нажму на FloatingActionButton, то происходил возврат на экран simple_tenses_practice
            //и выбиралась случайная фраза только из выбранных глаголов. У каждого глагола по девять фраз, то есть
            //случайный выбор был бы из 18 вариантов.
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: widget.tenses.length,
                itemBuilder: (context, index) => VerbCard(
                  tense: widget.tenses[index],
                  isChecked: selectedTenses.contains(widget.tenses[index]),
                  onCheck: (verb) => setState(() {
                    if (selectedTenses.contains(verb)) {
                      selectedTenses.remove(verb);
                    } else {
                      selectedTenses.add(verb);
                    }
                  }),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
