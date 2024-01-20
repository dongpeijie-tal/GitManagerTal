import 'dart:convert';

import 'package:hive/hive.dart';

/// id : ""
/// dir : ""
/// createdAt : ""
/// name : ""
/// webUrl : ""
/// rawJson : ""

LocalProject localProjectFromJson(String str) =>
    LocalProject.fromJson(json.decode(str));

String localProjectToJson(LocalProject data) => json.encode(data.toJson());

class LocalProject extends HiveObject{
  LocalProject(int? id,{
    String? dir,
    String? createdAt,
    String? name,
    String? webUrl,
    String? rawJson,
  }) {
    _id = id;
    _dir = dir;
    _createdAt = createdAt;
    _name = name;
    _webUrl = webUrl;
    _rawJson = rawJson;
  }

  LocalProject.fromJson(dynamic json) {
    _id = json['id'];
    _dir = json['dir'];
    _createdAt = json['createdAt'];
    _name = json['name'];
    _webUrl = json['webUrl'];
    _rawJson = json['rawJson'];
  }
  int? _id;
  String? _dir;
  String? _createdAt;
  String? _name;
  String? _webUrl;
  String? _rawJson;

  LocalProject copyWith({
    int? id,
    String? dir,
    String? createdAt,
    String? name,
    String? webUrl,
    String? rawJson,
  }) =>
      LocalProject(
        id ?? _id,
        dir: dir ?? _dir,
        createdAt: createdAt ?? _createdAt,
        name: name ?? _name,
        webUrl: webUrl ?? _webUrl,
        rawJson: rawJson ?? _rawJson,
      );

  int? get id => _id;

  String? get dir => _dir;

  String? get createdAt => _createdAt;

  String? get name => _name;

  String? get webUrl => _webUrl;

  String? get rawJson => _rawJson;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['dir'] = _dir;
    map['createdAt'] = _createdAt;
    map['name'] = _name;
    map['webUrl'] = _webUrl;
    map['rawJson'] = _rawJson;
    return map;
  }

  LocalProject.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _dir = map['dir'];
    _createdAt = map['createdAt'];
    _name = map['name'];
    _webUrl = map['webUrl'];
    _rawJson = map['rawJson'];
  }
}
