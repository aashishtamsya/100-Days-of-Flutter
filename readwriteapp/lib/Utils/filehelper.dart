import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get localFile async {
  final path = await localPath;
  return new File("$path/data.txt");
}

Future<File> writeData(String message) async {
  final file = await localFile;
  return file.writeAsString("$message");
}

Future<String> readData() async {
  try {
    final file = await localFile;
    return file.readAsString();
  } catch (err) {
    return "Nothing saved yet!";
  }
}

