import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/custom/dialog/GitLogDialog.dart';
import 'package:gitlabtal/data/LocalProject.dart';
import 'package:gitlabtal/provider/user_provider.dart';
import 'package:gitlabtal/storage/databases/hive/hive_helper.dart';
import 'package:gitlabtal/top/bean/git_const.dart';
import '../state/state_widget.dart';

class HomeController extends GetxController with StateMixin<HomeState> {
  final provider = Get.find<UserProvider>();
  var localProjects = List<LocalProject>.empty(growable: true).obs;
  final box = GetStorage();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    change(HomeState(false), status: RxStatus.loading());
    this.localProjects.clear();
    var localProjects = await HiveHelper().queryAllLocalProject();
    if (localProjects.isEmpty) {
      change(HomeState(false), status: RxStatus.empty());
    } else {
      change(HomeState(true), status: RxStatus.success());
    }
    this.localProjects.addAll(localProjects);
  }

  Future<void> deleteAll() async {
    await HiveHelper().deleteAllLocalProject();
    fetchData();
  }

  Future<void> insertLocalProject(LocalProject project) => HiveHelper().insertLocalProject(project);

  /// 清空账号
  void clearUser() {
    box.remove(TOKEN_SIGN);
  }

  var gitLogs = <String>[].obs;

  Future<void> _cloneRepo(
    List<LocalProject> projects,
  ) async {
    for (int i = 0 ; i < projects.length ; i++) {
      final project = projects[i];
      var gitLog = "${project.name}";
      gitLogs.add(gitLog);
      final process = await Process.start('git', ['clone', project.webUrl!], workingDirectory: project.dir);
      // 创建一个Future来处理stderr
      await for (var data in process.stderr.transform(utf8.decoder)) {
        gitLog += data;
      }
      // 结果码
      int code = await process.exitCode;
      // 0 = 成功
      if (code == 0) {
        gitLog = "${gitLog}clone成功";
        gitLogs[i] = gitLog;
      } else {
        gitLog = "${gitLog}clone失败";
        gitLogs[i] = gitLog;
      }
    }
  }

  /// 克隆实现
  Future<void> gitClone(LocalProject project) async {
    final String? directoryPath = await FilePicker.platform.getDirectoryPath();
    if (directoryPath == null) {
      return;
    }
    if (project.webUrl == null) {
      Get.snackbar("错误", "该仓库没有ssh地址。");
      return;
    }
    project.dir = directoryPath;
    await insertLocalProject(project);
    showGitLogDialog(this);
    await _cloneRepo([project]);
  }

  Future<void> gitCloneAll() async {
    if(localProjects.isNotEmpty){
      showGitLogDialog(this);
      await _cloneRepo(localProjects);
    }
  }

}
