import 'dart:convert';
import 'dart:io';
import 'package:gitlabtal/utils/file.dart';

void cloneRepo(
    String path,
    String dirPath,
    void Function() successBlock,
    void Function(String msg) failBlock,
    ) async {
  // 构建命令
  final process = await Process.start('git', ['clone', path], workingDirectory: dirPath);
  // 创建一个Future来处理stderr
  String stderrOutput = '';
  await for (var data in process.stderr.transform(utf8.decoder)) {
    stderrOutput += data;
  }
  // 结果码
  int code = await process.exitCode;
  // 0 = 成功
  if (code == 0) {
    successBlock();
  } else {
    print(stderrOutput);
    failBlock(stderrOutput);
  }
}

void appendLog(String logPath, String message) {
  FileUtils().write(message, logPath, FileMode.append);
}
/// 同步代码
void pullRepo(
    String path,
    String dirPath,
    void Function(String msg) successBlock,
    void Function(String msg) failBlock,
    ) async {
  final process = await Process.start('git', ['pull','--no-commit','--no-ff','--verbose','--depth=10', path],workingDirectory: dirPath);
  String stdouput = '';
  await for (var data in process.stdout.transform(utf8.decoder)) {
    stdouput += data;
  }
  // 创建一个Future来处理stderr
  String stderrOutput = '';
  await for (var data in process.stderr.transform(utf8.decoder)) {
    stderrOutput += data;
  }
  // 结果码
  int code = await process.exitCode;
  // 0 = 成功
  if (code == 0) {
    successBlock(stdouput);
  } else {
    failBlock(stderrOutput);
  }
}

/// 同步分支
void fetchRepo(
  String path,
  String dirPath,
  void Function(String msg) successBlock,
  void Function(String msg) failBlock,
) async {
  final process = await Process.start('git', ['fetch','--prune','--verbose', path],workingDirectory: dirPath);
  String stdouput = '';
  await for (var data in process.stdout.transform(utf8.decoder)) {
    stdouput += data;
  }
  // 创建一个Future来处理stderr
  String stderrOutput = '';
  await for (var data in process.stderr.transform(utf8.decoder)) {
    stderrOutput += data;
  }
  // 结果码
  int code = await process.exitCode;
  // 0 = 成功
  if (code == 0) {
    successBlock(stdouput);
  } else {
    failBlock(stderrOutput);
  }
}
