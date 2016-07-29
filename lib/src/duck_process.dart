library duck_adapter.duck_process;

import 'dart:async';
import 'dart:io';
import 'enums/sync_option.dart';
import 'enums/load_option.dart';
import 'duck_transaction.dart';
import 'enums/command.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

class DuckProcess {
  final Logger _log = new Logger("duck_adapter.duck_process");

  ///gives the stdout of duck for each duck call to the attached stream
  ///each event on this stream will be a complete stdout of one duck call
  final StreamController<String> stdout_controller = new StreamController<String>.broadcast();

  Stream<String> get stdout => stdout_controller.stream;

  ///path to root folder of remote server
  ///e.g. ftp://<hostname>/
  String remoteRoot = "";

  ///option to set external editor
  String externalEditor;

  ///Username to use for logging in to the storage service
  String user;

  ///identity file for authentication of ssh based storage services
  String identityFile;

  ///password or secret for string based secret authentication
  ///NOTE: identityFile will be preferred
  String password;

  ///Suppress progress messages
  bool quiet;

  ///prints transcript on stdout
  bool verbose;

  ///assumes yes for all promts
  bool assume_yes;

  ///Throttle bandwidth <bytes per second>
  int throttle;

  ///Preserve permissions and modification date for transferred files
  bool preservePermissionsAndModDate;

  //TODO: Support password authentication as secure as possible

  DuckProcess(this.remoteRoot,
      {
      this.user: "",
      this.externalEditor: "",
      this.identityFile: "",
      this.password: "",
      this.quiet: true,
      this.verbose: false,
      this.assume_yes: true,
      this.preservePermissionsAndModDate: null,
      this.throttle: 0
      }) {
    //

  }

  //cleaned from here down

  Future<String> get version async {
    ProcessResult processResult = await Process.run("duck", [Command.version.cliArg]);
    _log.info("Version: ${processResult.stdout}");
    return processResult.stdout;
  }


//TODO: add createTransaction Method
}
