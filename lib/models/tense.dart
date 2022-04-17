class Tense {
  final String phrase;
  final String translation;
  final String verb;
  final String verbTranslation;

  Tense({
    required this.phrase,
    required this.translation,
    required this.verb,
    required this.verbTranslation,
  });

  factory Tense.fromCSVRow(List<String> row) {
    return Tense(
      phrase: row[0],
      translation: row[1],
      verb: row[2],
      verbTranslation: row[3],
    );
  }
}
