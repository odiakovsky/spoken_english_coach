import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

var phr = const Text('нравится?!!!');

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
