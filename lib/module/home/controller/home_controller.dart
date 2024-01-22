import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/custom/dialog/GitLogDialog.dart';
import 'package:gitlabtal/data/LocalProject.dart';
import 'package:gitlabtal/provider/user_provider.dart';
import 'package:gitlabtal/storage/databases/hive/hive_helper.dart';
import 'package:gitlabtal/top/bean/git_const.dart';
import 'package:gitlabtal/utils/log.dart';
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

  Future<void> insertLocalProject(LocalProject project) =>
      HiveHelper().insertLocalProject(project);

  /// 清空账号
  void clearUser() {
    box.remove(TOKEN_SIGN);
  }

  /// 更改本地项目文件夹位置
  Future<void> changeLocalProjectDir(LocalProject project) async {
    final String? directoryPath = await getDirectoryPath();
    if (directoryPath == null) {
      return;
    }
    final newProject = project.copyWith(dir: directoryPath);
    await insertLocalProject(newProject).catchError((e) {
      e.printError();
      return;
    });

    /// 更换localProjects中的元素
    if (!localProjects.contains(project)) {
      return;
    }
    localProjects[localProjects.indexOf(project)] = newProject;
  }

  /// clone全部项目
  void gitCloneAll() {
    if (localProjects.isNotEmpty) {
      var gitLogs = List.filled(localProjects.length, '').obs;
      showGitLogDialog(this, gitLogs);
      Log.d("clone全部项目..");
      for (int i = 0; i < localProjects.length; i++) {
        _cloneRepo(localProjects[i], i, gitLogs);
      }
    }
  }

  /// 克隆实现
  void gitClone(LocalProject project) {
    Log.d("开始Clone...");
    if (project.dir?.isNotEmpty == false) {
      Log.d("更新文件夹位置..");
      changeLocalProjectDir(project);
    }
    if (project.webUrl == null) {
      Get.snackbar("错误", "该仓库没有ssh地址。");
      return;
    }
    var gitLogs = List.filled(1, '').obs;
    showGitLogDialog(this, gitLogs);
    _cloneRepo(project, 0, gitLogs);
  }

  void _cloneRepo(
      LocalProject project, int index, RxList<String> gitLogs) async {
    var gitLog = "${project.name}";
    gitLogs[index] = gitLog;
    final workDir = project.dir;
    if (workDir?.isEmpty != false) {
      gitLog = "$gitLog-文件夹未选择";
      gitLogs[index] = gitLog;
      return;
    }
    Log.d("Clone 执行git命令 ${project.name} ,是第$index个..");
    try {
      final process = await Process.start('git', ['clone', project.webUrl!],
              workingDirectory: project.dir)
          .catchError((e) {
        e.printError();
        return null;
      });
      // 创建一个Future来处理stderr
      var streamErr = process.stderr.transform(utf8.decoder).listen((data) {
        gitLog += data;
      });
      // 创建一个Future来处理stdout
      var streamOut = process.stdout.transform(utf8.decoder).listen((data) {
        gitLog += data;
      });
      Log.d("clone完毕..");
      // 结果码
      int code = await process.exitCode;
      streamErr.cancel();
      streamOut.cancel();
      // 0 = 成功
      if (code == 0) {
        gitLog = "${gitLog}clone成功";
        gitLogs[index] = gitLog;
      } else {
        gitLog = "${gitLog}clone失败";
        gitLogs[index] = gitLog;
      }
    } catch (e) {
      e.printError();
    }
  }

  /// 同步所有仓库
  void gitPullAll() {
    if (localProjects.isNotEmpty) {
      var gitLogs = List.filled(localProjects.length, '').obs;
      showGitLogDialog(this, gitLogs);
      for (int i = 0; i < localProjects.length; i++) {
        _pullRepo(localProjects[i], i, gitLogs);
      }
    }
  }

  /// 同步代码
  void _pullRepo(
      LocalProject project, int index, RxList<String> gitLogs) async {
    var gitLog = "${project.name}";
    gitLogs[index] = gitLog;
    if (project.dir?.isEmpty != false) {
      gitLog = "$gitLog-文件夹未选择";
      gitLogs[index] = gitLog;
      return;
    }
    try {
      final workDir =
          project.dir! + Platform.pathSeparator + (project.name ?? "");
      final process = await Process.start(
          'git',
          [
            'pull',
            '--no-commit',
            '--no-ff',
            '--verbose',
            '--depth=10',
            project.webUrl ?? ""
          ],
          workingDirectory: workDir);
      // 创建一个Future来处理stderr
      var streamErr = process.stderr.transform(utf8.decoder).listen((data) {
        gitLog += data;
      });
      // 创建一个Future来处理stdout
      var streamOut = process.stdout.transform(utf8.decoder).listen((data) {
        gitLog += data;
      });
      Log.d("clone完毕..");
      // 结果码
      int code = await process.exitCode;
      streamErr.cancel();
      streamOut.cancel();
      // 0 = 成功
      if (code == 0) {
        gitLog = "${gitLog}pull成功";
        gitLogs[index] = gitLog;
      } else {
        gitLog = "${gitLog}pull失败";
        gitLogs[index] = gitLog;
      }
    } catch (e) {
      e.printError();
    }
  }
}
