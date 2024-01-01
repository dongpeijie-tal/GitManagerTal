import 'dart:convert';
import 'dart:io';

/// clone代码
void cloneRepo(
  String path,
  String dirPath,
  void Function() successBlock,
  void Function(String msg) failBlock,
) async {
  final process = await Process.start('git', ['clone', path],workingDirectory: dirPath);
  final outputMsg = await process.stdout.transform(utf8.decoder).join();
  final errorOutputMsg = await process.stderr.transform(utf8.decoder).join();
  int code = await process.exitCode;
  if (code == 0) {
    successBlock();
  } else {
    failBlock("$outputMsg\n error msg= \n $errorOutputMsg");
  }
}

/// 同步代码
void pullRepo(
  String path,
  String dirPath,
  void Function() successBlock,
  void Function(String msg) failBlock,
) async {
  final process = await Process.start('git', ['pull', path],workingDirectory: dirPath);
  final outputMsg = await process.stdout.transform(utf8.decoder).join();
  final errorOutputMsg = await process.stderr.transform(utf8.decoder).join();
  int code = await process.exitCode;
  if (code == 0) {
    successBlock();
  } else {
    failBlock("$outputMsg\n error msg= \n $errorOutputMsg");
  }
}

/// 同步分支
void fetchRepo(
  String path,
  String dirPath,
  void Function() successBlock,
  void Function(String msg) failBlock,
) async {
  final process = await Process.start('git', ['fetch', path],workingDirectory: dirPath);
  final outputMsg = await process.stdout.transform(utf8.decoder).join();
  final errorOutputMsg = await process.stderr.transform(utf8.decoder).join();
  int code = await process.exitCode;
  if (code == 0) {
    successBlock();
  } else {
    failBlock("$outputMsg\n error msg= \n $errorOutputMsg");
  }
}
