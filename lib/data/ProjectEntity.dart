/// id : 43645
/// description : "摩比思维下载库"
/// name : "mobby_download"
/// name_with_namespace : "wangxiao_xueyanandroid_library / mobby_download"
/// path : "mobby_download"
/// path_with_namespace : "wangxiao_xueyanandroid_library/mobby_download"
/// created_at : "2023-12-14T06:24:53.000Z"
/// default_branch : "develop"
/// tag_list : []
/// ssh_url_to_repo : "git@git.100tal.com:wangxiao_xueyanandroid_library/mobby_download.git"
/// http_url_to_repo : "https://git.100tal.com/wangxiao_xueyanandroid_library/mobby_download.git"
/// web_url : "https://git.100tal.com/wangxiao_xueyanandroid_library/mobby_download"
/// readme_url : "https://git.100tal.com/wangxiao_xueyanandroid_library/mobby_download/blob/develop/README.md"
/// avatar_url : null
/// star_count : 0
/// forks_count : 0
/// last_activity_at : "2023-12-14T06:24:53.000Z"
/// namespace : {"id":838,"name":"wangxiao_xueyanandroid_library","path":"wangxiao_xueyanandroid_library","kind":"group","full_path":"wangxiao_xueyanandroid_library","parent_id":null}
/// _links : {"self":"https://git.100tal.com/api/v4/projects/43645","issues":"https://git.100tal.com/api/v4/projects/43645/issues","merge_requests":"https://git.100tal.com/api/v4/projects/43645/merge_requests","repo_branches":"https://git.100tal.com/api/v4/projects/43645/repository/branches","labels":"https://git.100tal.com/api/v4/projects/43645/labels","events":"https://git.100tal.com/api/v4/projects/43645/events","members":"https://git.100tal.com/api/v4/projects/43645/members"}
/// archived : false
/// visibility : "private"
/// resolve_outdated_diff_discussions : false
/// container_registry_enabled : true
/// issues_enabled : true
/// merge_requests_enabled : true
/// wiki_enabled : true
/// jobs_enabled : false
/// snippets_enabled : true
/// shared_runners_enabled : false
/// lfs_enabled : true
/// creator_id : 3698
/// import_status : "none"
/// open_issues_count : 0
/// public_jobs : true
/// ci_config_path : null
/// shared_with_groups : []
/// only_allow_merge_if_pipeline_succeeds : false
/// request_access_enabled : false
/// only_allow_merge_if_all_discussions_are_resolved : false
/// printing_merge_request_link_enabled : true
/// merge_method : "merge"
/// permissions : {"project_access":null,"group_access":{"access_level":30,"notification_level":3}}

class ProjectEntity {
  ProjectEntity({
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
      Namespace? namespace, 
      Links? links, 
      bool? archived, 
      String? visibility, 
      bool? resolveOutdatedDiffDiscussions, 
      bool? containerRegistryEnabled, 
      bool? issuesEnabled, 
      bool? mergeRequestsEnabled, 
      bool? wikiEnabled, 
      bool? jobsEnabled, 
      bool? snippetsEnabled, 
      bool? sharedRunnersEnabled, 
      bool? lfsEnabled, 
      num? creatorId, 
      String? importStatus, 
      num? openIssuesCount, 
      bool? publicJobs, 
      dynamic ciConfigPath, 
      bool? onlyAllowMergeIfPipelineSucceeds,
      bool? requestAccessEnabled, 
      bool? onlyAllowMergeIfAllDiscussionsAreResolved, 
      bool? printingMergeRequestLinkEnabled, 
      String? mergeMethod, 
      Permissions? permissions,}){
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
    _links = links;
    _archived = archived;
    _visibility = visibility;
    _resolveOutdatedDiffDiscussions = resolveOutdatedDiffDiscussions;
    _containerRegistryEnabled = containerRegistryEnabled;
    _issuesEnabled = issuesEnabled;
    _mergeRequestsEnabled = mergeRequestsEnabled;
    _wikiEnabled = wikiEnabled;
    _jobsEnabled = jobsEnabled;
    _snippetsEnabled = snippetsEnabled;
    _sharedRunnersEnabled = sharedRunnersEnabled;
    _lfsEnabled = lfsEnabled;
    _creatorId = creatorId;
    _importStatus = importStatus;
    _openIssuesCount = openIssuesCount;
    _publicJobs = publicJobs;
    _ciConfigPath = ciConfigPath;
    _onlyAllowMergeIfPipelineSucceeds = onlyAllowMergeIfPipelineSucceeds;
    _requestAccessEnabled = requestAccessEnabled;
    _onlyAllowMergeIfAllDiscussionsAreResolved = onlyAllowMergeIfAllDiscussionsAreResolved;
    _printingMergeRequestLinkEnabled = printingMergeRequestLinkEnabled;
    _mergeMethod = mergeMethod;
    _permissions = permissions;
}

  ProjectEntity.fromJson(dynamic json) {
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
    _links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
    _archived = json['archived'];
    _visibility = json['visibility'];
    _resolveOutdatedDiffDiscussions = json['resolve_outdated_diff_discussions'];
    _containerRegistryEnabled = json['container_registry_enabled'];
    _issuesEnabled = json['issues_enabled'];
    _mergeRequestsEnabled = json['merge_requests_enabled'];
    _wikiEnabled = json['wiki_enabled'];
    _jobsEnabled = json['jobs_enabled'];
    _snippetsEnabled = json['snippets_enabled'];
    _sharedRunnersEnabled = json['shared_runners_enabled'];
    _lfsEnabled = json['lfs_enabled'];
    _creatorId = json['creator_id'];
    _importStatus = json['import_status'];
    _openIssuesCount = json['open_issues_count'];
    _publicJobs = json['public_jobs'];
    _ciConfigPath = json['ci_config_path'];
    _onlyAllowMergeIfPipelineSucceeds = json['only_allow_merge_if_pipeline_succeeds'];
    _requestAccessEnabled = json['request_access_enabled'];
    _onlyAllowMergeIfAllDiscussionsAreResolved = json['only_allow_merge_if_all_discussions_are_resolved'];
    _printingMergeRequestLinkEnabled = json['printing_merge_request_link_enabled'];
    _mergeMethod = json['merge_method'];
    _permissions = json['permissions'] != null ? Permissions.fromJson(json['permissions']) : null;
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
  Links? _links;
  bool? _archived;
  String? _visibility;
  bool? _resolveOutdatedDiffDiscussions;
  bool? _containerRegistryEnabled;
  bool? _issuesEnabled;
  bool? _mergeRequestsEnabled;
  bool? _wikiEnabled;
  bool? _jobsEnabled;
  bool? _snippetsEnabled;
  bool? _sharedRunnersEnabled;
  bool? _lfsEnabled;
  num? _creatorId;
  String? _importStatus;
  num? _openIssuesCount;
  bool? _publicJobs;
  dynamic _ciConfigPath;
  bool? _onlyAllowMergeIfPipelineSucceeds;
  bool? _requestAccessEnabled;
  bool? _onlyAllowMergeIfAllDiscussionsAreResolved;
  bool? _printingMergeRequestLinkEnabled;
  String? _mergeMethod;
  Permissions? _permissions;
ProjectEntity copyWith({  num? id,
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
  Namespace? namespace,
  Links? links,
  bool? archived,
  String? visibility,
  bool? resolveOutdatedDiffDiscussions,
  bool? containerRegistryEnabled,
  bool? issuesEnabled,
  bool? mergeRequestsEnabled,
  bool? wikiEnabled,
  bool? jobsEnabled,
  bool? snippetsEnabled,
  bool? sharedRunnersEnabled,
  bool? lfsEnabled,
  num? creatorId,
  String? importStatus,
  num? openIssuesCount,
  bool? publicJobs,
  dynamic ciConfigPath,
  bool? onlyAllowMergeIfPipelineSucceeds,
  bool? requestAccessEnabled,
  bool? onlyAllowMergeIfAllDiscussionsAreResolved,
  bool? printingMergeRequestLinkEnabled,
  String? mergeMethod,
  Permissions? permissions,
}) => ProjectEntity(  id: id ?? _id,
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
  links: links ?? _links,
  archived: archived ?? _archived,
  visibility: visibility ?? _visibility,
  resolveOutdatedDiffDiscussions: resolveOutdatedDiffDiscussions ?? _resolveOutdatedDiffDiscussions,
  containerRegistryEnabled: containerRegistryEnabled ?? _containerRegistryEnabled,
  issuesEnabled: issuesEnabled ?? _issuesEnabled,
  mergeRequestsEnabled: mergeRequestsEnabled ?? _mergeRequestsEnabled,
  wikiEnabled: wikiEnabled ?? _wikiEnabled,
  jobsEnabled: jobsEnabled ?? _jobsEnabled,
  snippetsEnabled: snippetsEnabled ?? _snippetsEnabled,
  sharedRunnersEnabled: sharedRunnersEnabled ?? _sharedRunnersEnabled,
  lfsEnabled: lfsEnabled ?? _lfsEnabled,
  creatorId: creatorId ?? _creatorId,
  importStatus: importStatus ?? _importStatus,
  openIssuesCount: openIssuesCount ?? _openIssuesCount,
  publicJobs: publicJobs ?? _publicJobs,
  ciConfigPath: ciConfigPath ?? _ciConfigPath,
  onlyAllowMergeIfPipelineSucceeds: onlyAllowMergeIfPipelineSucceeds ?? _onlyAllowMergeIfPipelineSucceeds,
  requestAccessEnabled: requestAccessEnabled ?? _requestAccessEnabled,
  onlyAllowMergeIfAllDiscussionsAreResolved: onlyAllowMergeIfAllDiscussionsAreResolved ?? _onlyAllowMergeIfAllDiscussionsAreResolved,
  printingMergeRequestLinkEnabled: printingMergeRequestLinkEnabled ?? _printingMergeRequestLinkEnabled,
  mergeMethod: mergeMethod ?? _mergeMethod,
  permissions: permissions ?? _permissions,
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
  Links? get links => _links;
  bool? get archived => _archived;
  String? get visibility => _visibility;
  bool? get resolveOutdatedDiffDiscussions => _resolveOutdatedDiffDiscussions;
  bool? get containerRegistryEnabled => _containerRegistryEnabled;
  bool? get issuesEnabled => _issuesEnabled;
  bool? get mergeRequestsEnabled => _mergeRequestsEnabled;
  bool? get wikiEnabled => _wikiEnabled;
  bool? get jobsEnabled => _jobsEnabled;
  bool? get snippetsEnabled => _snippetsEnabled;
  bool? get sharedRunnersEnabled => _sharedRunnersEnabled;
  bool? get lfsEnabled => _lfsEnabled;
  num? get creatorId => _creatorId;
  String? get importStatus => _importStatus;
  num? get openIssuesCount => _openIssuesCount;
  bool? get publicJobs => _publicJobs;
  dynamic get ciConfigPath => _ciConfigPath;
  bool? get onlyAllowMergeIfPipelineSucceeds => _onlyAllowMergeIfPipelineSucceeds;
  bool? get requestAccessEnabled => _requestAccessEnabled;
  bool? get onlyAllowMergeIfAllDiscussionsAreResolved => _onlyAllowMergeIfAllDiscussionsAreResolved;
  bool? get printingMergeRequestLinkEnabled => _printingMergeRequestLinkEnabled;
  String? get mergeMethod => _mergeMethod;
  Permissions? get permissions => _permissions;

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
    if (_links != null) {
      map['_links'] = _links?.toJson();
    }
    map['archived'] = _archived;
    map['visibility'] = _visibility;
    map['resolve_outdated_diff_discussions'] = _resolveOutdatedDiffDiscussions;
    map['container_registry_enabled'] = _containerRegistryEnabled;
    map['issues_enabled'] = _issuesEnabled;
    map['merge_requests_enabled'] = _mergeRequestsEnabled;
    map['wiki_enabled'] = _wikiEnabled;
    map['jobs_enabled'] = _jobsEnabled;
    map['snippets_enabled'] = _snippetsEnabled;
    map['shared_runners_enabled'] = _sharedRunnersEnabled;
    map['lfs_enabled'] = _lfsEnabled;
    map['creator_id'] = _creatorId;
    map['import_status'] = _importStatus;
    map['open_issues_count'] = _openIssuesCount;
    map['public_jobs'] = _publicJobs;
    map['ci_config_path'] = _ciConfigPath;
    map['only_allow_merge_if_pipeline_succeeds'] = _onlyAllowMergeIfPipelineSucceeds;
    map['request_access_enabled'] = _requestAccessEnabled;
    map['only_allow_merge_if_all_discussions_are_resolved'] = _onlyAllowMergeIfAllDiscussionsAreResolved;
    map['printing_merge_request_link_enabled'] = _printingMergeRequestLinkEnabled;
    map['merge_method'] = _mergeMethod;
    if (_permissions != null) {
      map['permissions'] = _permissions?.toJson();
    }
    return map;
  }

}

/// project_access : null
/// group_access : {"access_level":30,"notification_level":3}

class Permissions {
  Permissions({
      dynamic projectAccess, 
      GroupAccess? groupAccess,}){
    _projectAccess = projectAccess;
    _groupAccess = groupAccess;
}

  Permissions.fromJson(dynamic json) {
    _projectAccess = json['project_access'];
    _groupAccess = json['group_access'] != null ? GroupAccess.fromJson(json['group_access']) : null;
  }
  dynamic _projectAccess;
  GroupAccess? _groupAccess;
Permissions copyWith({  dynamic projectAccess,
  GroupAccess? groupAccess,
}) => Permissions(  projectAccess: projectAccess ?? _projectAccess,
  groupAccess: groupAccess ?? _groupAccess,
);
  dynamic get projectAccess => _projectAccess;
  GroupAccess? get groupAccess => _groupAccess;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['project_access'] = _projectAccess;
    if (_groupAccess != null) {
      map['group_access'] = _groupAccess?.toJson();
    }
    return map;
  }

}

/// access_level : 30
/// notification_level : 3

class GroupAccess {
  GroupAccess({
      num? accessLevel, 
      num? notificationLevel,}){
    _accessLevel = accessLevel;
    _notificationLevel = notificationLevel;
}

  GroupAccess.fromJson(dynamic json) {
    _accessLevel = json['access_level'];
    _notificationLevel = json['notification_level'];
  }
  num? _accessLevel;
  num? _notificationLevel;
GroupAccess copyWith({  num? accessLevel,
  num? notificationLevel,
}) => GroupAccess(  accessLevel: accessLevel ?? _accessLevel,
  notificationLevel: notificationLevel ?? _notificationLevel,
);
  num? get accessLevel => _accessLevel;
  num? get notificationLevel => _notificationLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_level'] = _accessLevel;
    map['notification_level'] = _notificationLevel;
    return map;
  }

}

/// self : "https://git.100tal.com/api/v4/projects/43645"
/// issues : "https://git.100tal.com/api/v4/projects/43645/issues"
/// merge_requests : "https://git.100tal.com/api/v4/projects/43645/merge_requests"
/// repo_branches : "https://git.100tal.com/api/v4/projects/43645/repository/branches"
/// labels : "https://git.100tal.com/api/v4/projects/43645/labels"
/// events : "https://git.100tal.com/api/v4/projects/43645/events"
/// members : "https://git.100tal.com/api/v4/projects/43645/members"

class Links {
  Links({
      String? self, 
      String? issues, 
      String? mergeRequests, 
      String? repoBranches, 
      String? labels, 
      String? events, 
      String? members,}){
    _self = self;
    _issues = issues;
    _mergeRequests = mergeRequests;
    _repoBranches = repoBranches;
    _labels = labels;
    _events = events;
    _members = members;
}

  Links.fromJson(dynamic json) {
    _self = json['self'];
    _issues = json['issues'];
    _mergeRequests = json['merge_requests'];
    _repoBranches = json['repo_branches'];
    _labels = json['labels'];
    _events = json['events'];
    _members = json['members'];
  }
  String? _self;
  String? _issues;
  String? _mergeRequests;
  String? _repoBranches;
  String? _labels;
  String? _events;
  String? _members;
Links copyWith({  String? self,
  String? issues,
  String? mergeRequests,
  String? repoBranches,
  String? labels,
  String? events,
  String? members,
}) => Links(  self: self ?? _self,
  issues: issues ?? _issues,
  mergeRequests: mergeRequests ?? _mergeRequests,
  repoBranches: repoBranches ?? _repoBranches,
  labels: labels ?? _labels,
  events: events ?? _events,
  members: members ?? _members,
);
  String? get self => _self;
  String? get issues => _issues;
  String? get mergeRequests => _mergeRequests;
  String? get repoBranches => _repoBranches;
  String? get labels => _labels;
  String? get events => _events;
  String? get members => _members;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['self'] = _self;
    map['issues'] = _issues;
    map['merge_requests'] = _mergeRequests;
    map['repo_branches'] = _repoBranches;
    map['labels'] = _labels;
    map['events'] = _events;
    map['members'] = _members;
    return map;
  }

}

/// id : 838
/// name : "wangxiao_xueyanandroid_library"
/// path : "wangxiao_xueyanandroid_library"
/// kind : "group"
/// full_path : "wangxiao_xueyanandroid_library"
/// parent_id : null

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