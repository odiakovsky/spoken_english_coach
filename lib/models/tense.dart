class Tense {
  final String phrase;
  final String translation;
  final String verb;
  final String verbTranslation;

  /// Путь до файла с озвучкой фразы
  final String phraseVoicing;
  /// Путь до файла с озвучкой перевода
  final String translationVoicing;

  Tense({
    required this.phraseVoicing,
    required this.translationVoicing,
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
      phraseVoicing: row.length == 4 ? "FIXME" : row[4],
      translationVoicing: row.length == 4 ? "FIXME" : row[5],
    );
  }
}
