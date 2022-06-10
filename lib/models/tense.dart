class Tense {
  final String phrase;
  final String translation;
  final String verb;
  final String verbTranslation;
  final String ruVoicing;
  final String enVoicing;

  Tense({
    required this.ruVoicing,
    required this.enVoicing,
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
      ruVoicing: row.length == 4 ? "FIXME" : row[4],
      enVoicing: row.length == 4 ? "FIXME" : row[5],
    );
  }
}
