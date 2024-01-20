import 'dart:convert';
/// id : 43945
/// description : "摩比权限库"
/// name : "mobby_xespermission"
/// name_with_namespace : "wangxiao_xueyanandroid_library / mobby_xespermission"
/// path : "mobby_xespermission"
/// path_with_namespace : "wangxiao_xueyanandroid_library/mobby_xespermission"
/// created_at : "2024-01-15T08:15:58.000Z"
/// default_branch : "master"
/// tag_list : []
/// ssh_url_to_repo : "git@git.100tal.com:wangxiao_xueyanandroid_library/mobby_xespermission.git"
/// http_url_to_repo : "https://git.100tal.com/wangxiao_xueyanandroid_library/mobby_xespermission.git"
/// web_url : "https://git.100tal.com/wangxiao_xueyanandroid_library/mobby_xespermission"
/// readme_url : "https://git.100tal.com/wangxiao_xueyanandroid_library/mobby_xespermission/blob/master/README.md"
/// avatar_url : null
/// star_count : 0
/// forks_count : 0
/// last_activity_at : "2024-01-16T07:30:52.000Z"
/// namespace : {"id":838,"name":"wangxiao_xueyanandroid_library","path":"wangxiao_xueyanandroid_library","kind":"group","full_path":"wangxiao_xueyanandroid_library","parent_id":null}

SearchProject searchProjectFromJson(String str) => SearchProject.fromJson(json.decode(str));
String searchProjectToJson(SearchProject data) => json.encode(data.toJson());
class SearchProject {
  SearchProject({
      num? id, 
      String? description, 
      String? name, 
      String? nameWithNamespace, 
      String? path, 
      String? pathWithNamespace, 
      String? createdAt, 
      String? defaultBranch, 
      String? sshUrlToRepo,
      String? httpUrlToRepo, 
      String? webUrl, 
      String? readmeUrl, 
      dynamic avatarUrl, 
      num? starCount, 
      num? forksCount, 
      String? lastActivityAt, 
      Namespace? namespace,}){
    _id = id;
    _description = description;
    _name = name;
    _nameWithNamespace = nameWithNamespace;
    _path = path;
    _pathWithNamespace = pathWithNamespace;
    _createdAt = createdAt;
    _defaultBranch = defaultBranch;
    _sshUrlToRepo = sshUrlToRepo;
    _httpUrlToRepo = httpUrlToRepo;
    _webUrl = webUrl;
    _readmeUrl = readmeUrl;
    _avatarUrl = avatarUrl;
    _starCount = starCount;
    _forksCount = forksCount;
    _lastActivityAt = lastActivityAt;
    _namespace = namespace;
}

  SearchProject.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _name = json['name'];
    _nameWithNamespace = json['name_with_namespace'];
    _path = json['path'];
    _pathWithNamespace = json['path_with_namespace'];
    _createdAt = json['created_at'];
    _defaultBranch = json['default_branch'];
    _sshUrlToRepo = json['ssh_url_to_repo'];
    _httpUrlToRepo = json['http_url_to_repo'];
    _webUrl = json['web_url'];
    _readmeUrl = json['readme_url'];
    _avatarUrl = json['avatar_url'];
    _starCount = json['star_count'];
    _forksCount = json['forks_count'];
    _lastActivityAt = json['last_activity_at'];
    _namespace = json['namespace'] != null ? Namespace.fromJson(json['namespace']) : null;
  }
  num? _id;
  String? _description;
  String? _name;
  String? _nameWithNamespace;
  String? _path;
  String? _pathWithNamespace;
  String? _createdAt;
  String? _defaultBranch;
  String? _sshUrlToRepo;
  String? _httpUrlToRepo;
  String? _webUrl;
  String? _readmeUrl;
  dynamic _avatarUrl;
  num? _starCount;
  num? _forksCount;
  String? _lastActivityAt;
  Namespace? _namespace;
SearchProject copyWith({  num? id,
  String? description,
  String? name,
  String? nameWithNamespace,
  String? path,
  String? pathWithNamespace,
  String? createdAt,
  String? defaultBranch,
  List<dynamic>? tagList,
  String? sshUrlToRepo,
  String? httpUrlToRepo,
  String? webUrl,
  String? readmeUrl,
  dynamic avatarUrl,
  num? starCount,
  num? forksCount,
  String? lastActivityAt,
  Namespace? namespace,
}) => SearchProject(  id: id ?? _id,
  description: description ?? _description,
  name: name ?? _name,
  nameWithNamespace: nameWithNamespace ?? _nameWithNamespace,
  path: path ?? _path,
  pathWithNamespace: pathWithNamespace ?? _pathWithNamespace,
  createdAt: createdAt ?? _createdAt,
  defaultBranch: defaultBranch ?? _defaultBranch,
  sshUrlToRepo: sshUrlToRepo ?? _sshUrlToRepo,
  httpUrlToRepo: httpUrlToRepo ?? _httpUrlToRepo,
  webUrl: webUrl ?? _webUrl,
  readmeUrl: readmeUrl ?? _readmeUrl,
  avatarUrl: avatarUrl ?? _avatarUrl,
  starCount: starCount ?? _starCount,
  forksCount: forksCount ?? _forksCount,
  lastActivityAt: lastActivityAt ?? _lastActivityAt,
  namespace: namespace ?? _namespace,
);
  num? get id => _id;
  String? get description => _description;
  String? get name => _name;
  String? get nameWithNamespace => _nameWithNamespace;
  String? get path => _path;
  String? get pathWithNamespace => _pathWithNamespace;
  String? get createdAt => _createdAt;
  String? get defaultBranch => _defaultBranch;
  String? get sshUrlToRepo => _sshUrlToRepo;
  String? get httpUrlToRepo => _httpUrlToRepo;
  String? get webUrl => _webUrl;
  String? get readmeUrl => _readmeUrl;
  dynamic get avatarUrl => _avatarUrl;
  num? get starCount => _starCount;
  num? get forksCount => _forksCount;
  String? get lastActivityAt => _lastActivityAt;
  Namespace? get namespace => _namespace;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    map['name'] = _name;
    map['name_with_namespace'] = _nameWithNamespace;
    map['path'] = _path;
    map['path_with_namespace'] = _pathWithNamespace;
    map['created_at'] = _createdAt;
    map['default_branch'] = _defaultBranch;
    map['ssh_url_to_repo'] = _sshUrlToRepo;
    map['http_url_to_repo'] = _httpUrlToRepo;
    map['web_url'] = _webUrl;
    map['readme_url'] = _readmeUrl;
    map['avatar_url'] = _avatarUrl;
    map['star_count'] = _starCount;
    map['forks_count'] = _forksCount;
    map['last_activity_at'] = _lastActivityAt;
    if (_namespace != null) {
      map['namespace'] = _namespace?.toJson();
    }
    return map;
  }

}

/// id : 838
/// name : "wangxiao_xueyanandroid_library"
/// path : "wangxiao_xueyanandroid_library"
/// kind : "group"
/// full_path : "wangxiao_xueyanandroid_library"
/// parent_id : null

Namespace namespaceFromJson(String str) => Namespace.fromJson(json.decode(str));
String namespaceToJson(Namespace data) => json.encode(data.toJson());
class Namespace {
  Namespace({
      num? id, 
      String? name, 
      String? path, 
      String? kind, 
      String? fullPath, 
      dynamic parentId,}){
    _id = id;
    _name = name;
    _path = path;
    _kind = kind;
    _fullPath = fullPath;
    _parentId = parentId;
}

  Namespace.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _path = json['path'];
    _kind = json['kind'];
    _fullPath = json['full_path'];
    _parentId = json['parent_id'];
  }
  num? _id;
  String? _name;
  String? _path;
  String? _kind;
  String? _fullPath;
  dynamic _parentId;
Namespace copyWith({  num? id,
  String? name,
  String? path,
  String? kind,
  String? fullPath,
  dynamic parentId,
}) => Namespace(  id: id ?? _id,
  name: name ?? _name,
  path: path ?? _path,
  kind: kind ?? _kind,
  fullPath: fullPath ?? _fullPath,
  parentId: parentId ?? _parentId,
);
  num? get id => _id;
  String? get name => _name;
  String? get path => _path;
  String? get kind => _kind;
  String? get fullPath => _fullPath;
  dynamic get parentId => _parentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['path'] = _path;
    map['kind'] = _kind;
    map['full_path'] = _fullPath;
    map['parent_id'] = _parentId;
    return map;
  }

}