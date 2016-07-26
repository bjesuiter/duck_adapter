library duck_adapter.duck_process;

import 'dart:async';
import 'sync_options.dart';
import 'load_options.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

class DuckProcess {
  final Logger _log = new Logger("duck_adapter.session");

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

  //TODO: Support password authentication as secure as possible

  DuckProcess(this.remoteRoot, {this.user: "", this.externalEditor: "", this.identityFile: ""}) {
    if (!path.isAbsolute(remoteRoot))
      throw new path.PathException("remoteRoot is not absolute");

    if (!remoteRoot.endsWith("/"))
      remoteRoot += "/";
  }

  Future upload(String remotePath, String localPath, {LoadOptions handleExisting}) async {

  }

  Future download(String remotePath, String localPath, {LoadOptions handleExisting}) async {

  }

  Future sync(String remotePath, String localPath, {SyncOptions handleExisting}) async {

  }

  Future delete() async {

  }

  ///remote location 1 = absolute | relative to this.remoteRoot
  ///remote location 2 = absolute | relative to this.remoteRoot
  Future serverCopy(remoteLocation1, remoteLocation2) async {

  }

  ///Opens the given file in an external editor
  ///Uses optionalParameter first and this.externalEditor secondly
  Future editRemoteFile(String remoteFile, {String externalEditor}) async {

  }


}