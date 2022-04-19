import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';

var phr = const Text('не нравится?!!!');

class ReadCsv extends StatelessWidget {
  const ReadCsv({Key? key}) : super(key: key);

  Future<List<List<dynamic>>> loadingCsvData(String path) async {
    final csvFile = File('/assets/csv/simple_tenses_practice.csv').openRead();

    return await csvFile
        .transform(utf8.decoder)
        .transform(
          CsvToListConverter(),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReadCsv(),
    );
  }
}
