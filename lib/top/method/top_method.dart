import 'dart:io';

void cloneRepo(String path,String dirPath) async {
  await Process.start('cd', [dirPath]);
  final process = await Process.start('git', ['clone', path]);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
}