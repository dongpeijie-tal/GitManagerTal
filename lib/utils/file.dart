
import 'dart:io';

class FileUtils{

  static final FileUtils _fileUtils = FileUtils._instance();

  factory FileUtils(){
    return _fileUtils;
  }

  FileUtils._instance();

  /// 向md文件写入数据
  Future<void> write(String msg, String path,FileMode mode) async {
    final file = File(path);
    await file.writeAsString(msg,mode: mode);
  }

  /// 从path中读取md文件信息
  Future<String> read(String path) async {
    final file = File(path);
    try {
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      throw Exception('Failed to read file because$e');
    }
  }
}