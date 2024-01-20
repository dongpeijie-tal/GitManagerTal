import 'package:gitlabtal/data/LocalProject.dart';
import 'package:sqlite3/sqlite3.dart';

class SqliteHelper {
  static final SqliteHelper _instance = SqliteHelper._internal();

  factory SqliteHelper() {
    return _instance;
  }

  SqliteHelper._internal();

  /// 创建
  void install() {
    final db = sqlite3.openInMemory();
    db.execute('''
    CREATE TABLE IF NOT EXISTS project(
      id INTEGER NOT NULL PRIMARY KEY,
      dir TEXT,
      description TEXT,
      created_at TEXT,
      name TEXT,
      web_url TEXT,
      rawJson TEXT
    );
    ''');
    db.dispose();
  }

  /// 插入一条
  void insert(LocalProject project) {
    final db = sqlite3.openInMemory();
    final stmt = db.prepare(
        'INSERT INTO project (id, dir, createdAt, name, webUrl, rawJson) VALUES (?, ?, ?, ?, ?, ?, ?)');
    stmt.execute([
      project.id,
      project.dir,
      project.createdAt,
      project.name,
      project.webUrl,
      project.rawJson
    ]);
    stmt.dispose();
    db.dispose();
  }

  /// 查找所有项目
  List<LocalProject> queryAll() {
    var list = List<LocalProject>.empty();
    final db = sqlite3.openInMemory();
    final ResultSet sets = db.select('SELECT * FROM project');
    db.dispose();
    for (final Row row in sets) {
      list.add(LocalProject.fromMap(row));
    }
    return list;
  }

  /// 删除
  void delete(LocalProject project) {
    final db = sqlite3.openInMemory();
    final stmt = db.prepare('DELETE FROM project WHERE id = ?');
    stmt.execute([project.id]);
    stmt.dispose();
    db.dispose();
  }
}
