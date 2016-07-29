library duck_adapter;

import 'package:logging/logging.dart';
import 'enums/transaction_mode.dart';
import 'enums/command.dart';
import 'enums/load_option.dart';
import 'enums/sync_option.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as path;


//rename later to duck process: behave like command line.
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


  //TODO: add unit support for throttling (KB, MB, GB)
  DuckTransaction(this.remoteRoot,
      {this.user: "",
      this.externalEditor: "",
      this.identityFile: "",
      this.password: "",
      this.quiet: true,
      this.verbose: false,
      this.assume_yes: true,
      this.preservePermissionsAndModDate: null,
      this.throttle: 0})
      : mode = TransactionMode.General {}

  _init() {
    _url = new path.Context(style: path.Style.url, current: remoteRoot);
    if (path.url.isRelative(remoteRoot) || path.url.isRootRelative(remoteRoot))
      throw new path.PathException("remoteRoot is not absolute");
    if (!remoteRoot.endsWith("/")) remoteRoot += "/";
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
    _init();
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
    _init();
  }

  addUpload(String remotePath, String localPath) {
    if (mode == TransactionMode.Synchronize)
      throw new Exception("Cannot add Upload action to transaction created with new DuckTransaction.synchronize");
    _addCommand(Command.upload, _url.absolute(remotePath), path.absolute(localPath));
  }

  addDownload(String remotePath, String localPath) {
    if (mode == TransactionMode.Synchronize)
      throw new Exception("Cannot add Download action to transaction created with new DuckTransaction.synchronize");
    _addCommand(Command.download, _url.absolute(remotePath), path.absolute(localPath));
  }

  /// Syncs two directories.
  addSync(String remotePath, String localPath) {
    if (mode == TransactionMode.UpAndDownload)
      throw new Exception("Cannot add Sync action to transaction created with new DuckTransaction.upAndDownload");
    _addCommand(Command.synchronize, _url.absolute(remotePath), path.absolute(localPath));
  }

  addDeletion(String remoteLocation) async {
    _addCommand(Command.delete, _url.absolute(remoteLocation));
  }

  //TODO: try multiple times on one transaction
  ///Copy between servers.
  ///remote location 1 = absolute | relative to this.remoteRoot
  ///remote location 2 = absolute | relative to this.remoteRoot
  addServerCopy(String remoteLocation1, String remoteLocation2) {
    _addCommand(Command.copy, _url.absolute(remoteLocation1), _url.absolute(remoteLocation2));
  }

  //TODO: Try multiple times on one transaction
  ///set external application in constructor
  addRemoteFileEdit(String remoteFile) {
    if (externalEditor.isEmpty)
      throw new Exception(
          "Please specify an external editor when constructing DuckTansaction to use remote file edit functionality.");

    _addCommand(Command.edit, _url.absolute(remoteFile));
  }


  ///lists directory content of a remote location
  ///if longFormat is true, list will provide additional modification time data and permissions (as mask) for each entry
  listRemote(String remoteLocation, {bool longFormat: false}) {
    _addCommand(Command.list, _url.absolute(remoteLocation));

    if (longFormat)
      _addCommand(Command.longlist);

    //TODO: maybe avoid adding listRemote doubled to one Transaction
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

      if (externalEditor.isNotEmpty) _addCommand(Command.application, externalEditor);

      _addCommand(Command.username, user);

      if (identityFile.isNotEmpty) {
        _addCommand(Command.identity, identityFile);
      } else if (password.isNotEmpty) {
        _addCommand(Command.password, password);
      }

      if (throttle > 0) _addCommand(Command.throttle, throttle.toString());
    }

    _log.finest(commands.join(" "));

    var result = Process.run("duck", commands);

    result.then((processResult) {
      stdout_controller.add(processResult.stdout);
    });

    return result;
  }
}
