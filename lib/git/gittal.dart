import 'package:git2dart/git2dart.dart';

class GitTal {
  static final GitTal _instance = GitTal._inner();

  GitTal._inner();

  factory GitTal() => _instance;
}

void gitClone(String targetDir, String gitUrl) {
  Repository.clone(
      url: gitUrl,
      localPath: targetDir,
      callbacks: Callbacks(
        sidebandProgress: (s) {
          print(s);
        },
        transferProgress: (t) {
          print(t);
        },
        credentials:Keypair(username: 'a', pubKey: '', privateKey: '', passPhrase: ''),
      ));
}
