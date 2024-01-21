

import 'dart:convert';
import 'package:gitlabtal/data/LocalProject.dart';
import 'package:gitlabtal/data/ProjectEntity.dart';
import 'package:hive/hive.dart';

class HiveHelper {

  static final HiveHelper _instance = HiveHelper._inner();

  HiveHelper._inner();

  factory HiveHelper(){
    return _instance;
  }

  /// 执行LocalProject《数据库》存储
  Future<void> executeLocalProjectDb(Future<void> Function(CollectionBox<Map>) runner) async {
    final collection = await BoxCollection.open('MyBox', {'local_project'},);
    final db = await collection.openBox<Map>('local_project',preload: true);
    await runner(db);
    collection.close();
  }

  /// 插入一条LocalProject
  Future<bool> insertLocalProject(LocalProject project) async {
    var result = false;
    await executeLocalProjectDb((db) async {
      db.put(project.id.toString(),project.toJson());
      result = await db.get(project.id.toString()) != null;
    });
    return result;
  }

  /// 获取所有localProject
  Future<List<LocalProject>> queryAllLocalProject() async {
    List<LocalProject> result = List.empty(growable: true);
    await executeLocalProjectDb((db) async {
      final allValue = await db.getAll(await db.getAllKeys());
      for (var value in allValue) {
        if(value != null && value['_id'] != 0){
          result.add(LocalProject.fromJson(value));
        }
      }
    });
    print("存储内容：${jsonEncode(result)}");
    return result;
  }

  /// 删除一条LocalProject
  Future<bool> deleteLocalProject(LocalProject project) async {
    var result = false;
    await executeLocalProjectDb((db) async {
      db.delete(project.id.toString());
      result = await db.get(project.id.toString()) == null;
    });
    return result;
  }

  Future<void> deleteAllLocalProject() async{
    await executeLocalProjectDb((db)async{
      await db.deleteAll(await db.getAllKeys());
    });
  }
  /// 是否已经保存到本地了
  Future<bool> isSaveLocalProject(ProjectEntity temp) async{
    var result = false;
    await executeLocalProjectDb((db)async{
      result = await db.get(temp.id.toString()) != null;
    });
    return result;
  }
}