library duck_adapter;

import 'package:logging/logging.dart';
import 'enums/transaction_mode.dart';
import 'enums/command.dart';
import 'enums/load_option.dart';
import 'enums/sync_option.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as path;

class DuckTransaction {
  final Logger _log = new Logger("duck_adapter.duck_transaction");

  ///Defines if this transaction uses synchronize or UpAndDownloads.
  ///This is necessary to avoid problems with different settings for handling existing files.
  final TransactionMode mode;

  ///gives the stdout of duck for each duck call to the attached stream
  ///each event on this stream will be a complete stdout of one duck call
  final StreamController<String> stdout_controller = new StreamController<String>.broadcast();

  Stream<String> get stdout => stdout_controller.stream;

  ///argument list for duck to execute
  final List<String> commands = [];

  path.Context _url;

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

  DuckTransaction() : mode=TransactionMode.General {

  }

  DuckTransaction.synchronize(this.remoteRoot, SyncOption onExistingFile,
      {this.user: "",
      this.externalEditor: "",
      this.identityFile: "",
      this.password: "",
      this.quiet: true,
      this.verbose: false,
      this.assume_yes: true,
      this.preservePermissionsAndModDate: null,
      this.throttle: 0})
      : mode = TransactionMode.Synchronize {
    _addCommand(Command.existing, onExistingFile.name);
    _url = new path.Context(style: path.Style.url, current: remoteRoot);
  }

  DuckTransaction.upAndDownload(this.remoteRoot, LoadOption onExistingFile,
      {this.user: "",
      this.externalEditor: "",
      this.identityFile: "",
      this.password: "",
      this.quiet: true,
      this.verbose: false,
      this.assume_yes: true,
      this.preservePermissionsAndModDate: null,
      this.throttle: 0})
      : mode = TransactionMode.UpAndDownload {
    _addCommand(Command.existing, onExistingFile.name);
    _url = new path.Context(style: path.Style.url, current: remoteRoot);
  }

  addUpload(String remotePath, String localPath) {
    if (mode == TransactionMode.Synchronize)
      throw new Exception("Cannot add Upload action to transaction created with new DuckTransaction.synchronize");
  }

  addDownload() {
    if (mode == TransactionMode.Synchronize)
      throw new Exception("Cannot add Download action to transaction created with new DuckTransaction.synchronize");
  }

  addSync() {
    if (mode == TransactionMode.UpAndDownload)
      throw new Exception("Cannot add Sync action to transaction created with new DuckTransaction.upAndDownload");
  }

  _addCommand(Command command, [String arg1 = "", String arg2 = "", String arg3 = ""]) {
    commands.add(command.cliArg);

    if (arg1.isNotEmpty) commands.add(arg1);

    if (arg2.isNotEmpty) commands.add(arg2);

    if (arg3.isNotEmpty) commands.add(arg3);
  }

  Future<ProcessResult> execute({bool addSessionParams: true}) {

    ///add session params
    if (addSessionParams) {
      if (quiet) _addCommand(Command.quiet);

      if (verbose) _addCommand(Command.verbose);

      if (assume_yes) _addCommand(Command.assumeyes);

      _addCommand(Command.username, user);

      if (identityFile.isNotEmpty) {
        _addCommand(Command.identity, identityFile);
      } else if (password.isNotEmpty) {
        _addCommand(Command.password, password);
      }

      if (throttle > 0)
        _addCommand(Command.throttle, throttle.toString());
    }

    _log.finest(commands.join(" "));

    var result = Process.run("duck", commands);

    result.then((processResult) {
      stdout_controller.add(processResult.stdout);
    });

    return result;
  }

}

