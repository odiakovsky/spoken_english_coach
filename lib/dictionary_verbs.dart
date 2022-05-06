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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'Выберите глаголы:',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 25,
              ),
              checkAll, //По умолчанию чекбокс здесь должен быть выбран и соответственно выбраны все, что ниже.
              //При снятии здесь галочки, должны пропадать все галочки ниже.
              cardOfVerb, //Нужно чтобы из таких карточек выводился весь список глаголов. Попорядку, не перемешивая.
              //Наверное нужно использовать какой-нибудь ListView.
              //Сейчас загружен файл с сотней глаголов. То есть из нашей модели он должен подставлять
              //в карточку verb и verbTranslation. В карточке есть чекбокс. Нужно сделать так, что если я выберу,
              //например, два глагола и нажму на FloatingActionButton, то происходил возврат на экран simple_tenses_practice
              //и выбиралась случайная фраза только из выбранных глаголов. У каждого глагола по девять фраз, то есть
              //случайный выбор был бы из 18 вариантов.
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
