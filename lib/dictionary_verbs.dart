import 'package:esc/card_of_verb.dart';
import 'package:esc/models/tense.dart';
import 'package:esc/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DictionaryVerbs extends StatefulWidget {
  final List<Tense> tenses;
  final List<Tense> previouslySelectedTenses;
  final void Function(List<Tense>) onSelected;

  const DictionaryVerbs({
    Key? key,
    required this.tenses,
    required this.onSelected,
    required this.previouslySelectedTenses,
  }) : super(key: key);

  @override
  State<DictionaryVerbs> createState() => _DictionaryVerbsState();
}

class _DictionaryVerbsState extends State<DictionaryVerbs> {
  bool allChecked = true;
  final List<Tense> currentTenses = <Tense>[];
  final List<Tense> selectedTenses = <Tense>[];
  final Set<String> selectedVerbs = <String>{};

  @override
  void initState() {
    super.initState();
    allChecked = widget.previouslySelectedTenses.length == widget.tenses.length;
    final verbsTaken = <String>[];
    widget.tenses.forEach((tense) {
      if (!verbsTaken.contains(tense.verb)) {
        currentTenses.add(tense);
        verbsTaken.add(tense.verb);
      }
    });
    selectedTenses.addAll(widget.previouslySelectedTenses);
    selectedVerbs.addAll(selectedTenses.map((e) => e.verb));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
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
          child: Column(
            children: [
              Text(
                'Выберите глаголы:',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  color: currentTheme.currentTheme == ThemeMode.light
                      ? Colors.black
                      : Colors.white,),
              ),
              CheckAll(
                isChecked: allChecked,
                onCheck: () {
                  setState(() {
                    if (allChecked) {
                      selectedTenses.clear();
                      selectedVerbs.clear();
                    } else {
                      selectedTenses.clear();
                      selectedTenses.addAll(widget.tenses);
                      selectedVerbs.clear();
                      selectedVerbs.addAll(selectedTenses.map((e) => e.verb));
                    }
                    allChecked = !allChecked;
                  });
                },
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: currentTenses.length,
                  itemBuilder: (context, index) => VerbCard(
                    tense: currentTenses[index],
                    isChecked: selectedVerbs.contains(currentTenses[index].verb),
                    onCheck: (tense) => setState(() {
                      if (selectedTenses.contains(tense)) {
                        allChecked = false;
                        selectedTenses.removeWhere((t) => t.verb == tense.verb);
                        selectedVerbs.remove(tense.verb);
                      } else {
                        selectedTenses.addAll(
                          widget.tenses.where((t) => tense.verb == t.verb),
                        );
                        selectedVerbs.add(tense.verb);
                        allChecked =
                            widget.tenses.length == selectedTenses.length;
                      }
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Color(0xFFA4CCE4),
        backgroundColor: Color(0xFFA4CCE4),
        onPressed: selectedTenses.isNotEmpty
            ? () {
                widget.onSelected(selectedTenses);
                Navigator.of(context).pop();
              }
            : null,
        child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
      ),
    );
  }
}
