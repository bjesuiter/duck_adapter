library duck_adapter.duck_process;

import 'dart:async';
import 'dart:io';
import 'sync_options.dart';
import 'load_options.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

class DuckProcess {
  final Logger _log = new Logger("duck_adapter.duck_process");

  ///gives the stdout of duck for each duck call to the attached stream
  ///each event on this stream will be a complete stdout of one duck call
  final StreamController<String> stdout_controller = new StreamController<String>.broadcast();

  Stream<String> get stdout => stdout_controller.stream;

  path.Context _url;

  ///path to root folder of remote server
  ///e.g. ftp://<hostname>/
  String remoteRoot = "";

  ///option to set external editor
  String externalEditor;

  ///Username to use for logging in to the storage service
  String user;

  ///identity file for authentication of ssh based storage services
  ///NOTE: Password auth is not supported right now
  String identityFile;

  bool quiet;

  ///prints transcript on stdout
  bool verbose;

  ///assumes yes for all promts
  bool assume_yes;

  //TODO: Support password authentication as secure as possible

  DuckProcess(this.remoteRoot,
      {this.user: "",
      this.externalEditor: "",
      this.identityFile: "",
      this.quiet: true,
      this.verbose: false,
      this.assume_yes: true}) {
    //
    //

    if (path.url.isRelative(remoteRoot) || path.url.isRootRelative(remoteRoot))
      throw new path.PathException("remoteRoot is not absolute");
    if (!remoteRoot.endsWith("/")) remoteRoot += "/";
    _url = new path.Context(style: path.Style.url, current: remoteRoot);
  }

  Future upload(String remotePath, String localPath, {LoadOptions handleExisting}) async {}

  Future download(String remotePath, String localPath, {LoadOptions handleExisting}) async {
    var args = [
      "--download", _url.absolute(remotePath), path.absolute(localPath)
    ];

    return runDuck(args);
  }

  Future sync(String remotePath, String localPath, {SyncOptions handleExisting}) async {}

  Future delete(String remoteLocation) async {
    var args = ["--delete", _url.absolute(remoteLocation)];
    return runDuck(args);
  }

  ///Copy between servers
  ///remote location 1 = absolute | relative to this.remoteRoot
  ///remote location 2 = absolute | relative to this.remoteRoot
  Future serverCopy(String remoteLocation1, String remoteLocation2) async {
    //_url context knows root url -> matching is not necessary

    var args = ["--copy", _url.absolute(remoteLocation1), _url.absolute(remoteLocation2)];
  }

  ///Opens the given file in an external editor
  ///Uses optional parameter  externalEditor first and this.externalEditor secondly
  Future editRemoteFile(String remoteFile, {String externalEditor}) async {
    var editor = externalEditor ?? this.externalEditor;
    if (editor.isEmpty || !(new File(editor).existsSync()))
      throw new Exception(
          "No external editor specified. Please specify external editor with optional param in editRemoteFile"
              " or set external editor at DuckProcess construction time");

    var args = ["--application", editor, "--edit", remoteFile];

    return runDuck(args);
  }

  ///only to be feature complete
  Future<String> get version async {
    ProcessResult processResult = await runDuck(["--version"], addSessionParams: false);
    return processResult.stdout;
  }

  Future<ProcessResult> runDuck(List<String> args, {bool addSessionParams: true}) {
    ///add session params
    if (addSessionParams) {
      if (quiet) args.add("--quiet");

      if (verbose) args.add("--verbose");

      if (assume_yes) args.add("--assumeyes");

      args..add("--user")..add(user);

      if (identityFile.isNotEmpty) {
        args..add("--identity")..add(identityFile);
      }
    }

    _log.fine(args.join(" "));

    return Process.run("duck", args);
  }
}
