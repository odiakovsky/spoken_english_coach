import 'package:esc/card_of_verb.dart';
import 'package:esc/models/tense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DictionaryVerbs extends StatefulWidget {
  final List<Tense> tenses;
  final void Function(List<Tense>) onSelected;

  const DictionaryVerbs({
    Key? key,
    required this.tenses,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<DictionaryVerbs> createState() => _DictionaryVerbsState();
}

class _DictionaryVerbsState extends State<DictionaryVerbs> {
  bool allChecked = true;
  late List<Tense> currentTenses;
  late List<Tense> selectedTenses;
  late ScrollController _controller;
  int limit = 100;
  int offset = 0;

  void _paginate() {
    if ((_controller.position.pixels >=
        _controller.position.maxScrollExtent - 150) &&
        (currentTenses.length < widget.tenses.length)) {
      setState(() {
        offset += limit;
        try {
          currentTenses.addAll(widget.tenses.sublist(offset, offset + limit));
        } catch (RangeError) {
          currentTenses
              .addAll(widget.tenses.sublist(offset, widget.tenses.length));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    currentTenses =
        List<Tense>.from(widget.tenses).sublist(offset, limit + offset);
    selectedTenses = List<Tense>.from(widget.tenses);
    _controller = ScrollController()..addListener(_paginate);
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
                controller: _controller,
                physics: BouncingScrollPhysics(),
                itemCount: currentTenses.length,
                itemBuilder: (context, index) => VerbCard(
                  tense: currentTenses[index],
                  isChecked: selectedTenses.contains(widget.tenses[index]),
                  onCheck: (tense) => setState(() {
                    if (selectedTenses.contains(tense)) {
                      selectedTenses.removeWhere((t) => t.verb == tense.verb);
                    } else {
                      selectedTenses.addAll(
                        widget.tenses.where((t) => tense.verb == t.verb),
                      );
                    }
                  }),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onSelected(selectedTenses);
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
