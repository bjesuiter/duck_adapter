library duck_adapter.commands;

import 'package:enums/enums.dart';
import 'load_options.dart';
import 'sync_options.dart';

///Command to String mapping of duck cli commands
class Commands extends Enum {

  ///External editor application
  ///
  /// Params: --application <path>
  static const Commands application = const Commands._("application");

  /// Copy between servers
  ///
  /// Params: --copy <url> <url>
  static const Commands copy = const Commands._("copy");

  /// Download file or folder. Denote a folder with a trailing '/'.
  ///
  /// Params: --download <url> <[file]>
  /// Connected Command: existing <option>
  /// Option can be one of [LoadOptions]
  static const Commands download = const Commands._("download");

  /// Delete.
  ///
  /// Params: --delete <url>
  static const Commands delete = const Commands._("delete");

  /// Transfer action for existing files.
  ///
  /// Params: --existing <action>
  /// Action can be one of [LoadOptions] or [SyncOptions], depending on the used method
  static const Commands existing = const Commands._("existing");

  /// Edit file in external editor.
  ///
  /// Params: --edit <url>
  /// Connected Command: application
  static const Commands edit = const Commands._("edit");

  /// Print this help.
  static const Commands help = const Commands._("help");

  /// Selects a file from which the identity (private key) for public key authentication is read.
  ///
  /// Params: --identity <private key file>
  static const Commands identity = const Commands._("identity");

  /// List files in remote folder.
  ///
  /// Params: --list <url>
  /// Connected command: longlist
  static const Commands list = const Commands._("list");

  /// Long list format with modification date and permission mask.
  static const Commands longlist = const Commands._("longlist");

  /// Password.
  ///
  /// Params: --password <password or secret key>
  static const Commands password = const Commands._("password");

  ///Preserve permissions and modification date for transferred files.
  static const Commands preserve = const Commands._("preserve");

  /// Number of concurrent connections to use for transfers.
  ///
  /// --parallel <connections>
  static const Commands parallel = const Commands._("parallel");

  ///Suppress progress messages.
  static const Commands quiet = const Commands._("quiet");

  /// Retry failed connection attempts.
  ///
  /// --retry <count>
  static const Commands retry = const Commands._("retry");

  /// Location of bucket or container.
  ///
  /// --region <location>
  static const Commands region = const Commands._("region");

  /// Synchronize folders.
  ///
  /// Params: --synchronize <url> <directory>
  /// Connected Command: existing <option>
  /// Option can be one of [SyncOptions]
  static const Commands synchronize = const Commands._("synchronize");

  /// Throttle bandwidth.
  ///
  /// Params: --throttle <bytes per second>
  static const Commands throttle = const Commands._("throttle");

  /// Username.
  ///
  /// Params: --username <username or access key>
  static const Commands username = const Commands._("username");

  /// Use UDT protocol if applicable.
  static const Commands udt = const Commands._("udt");

  /// Upload file or folder recursively.
  ///
  /// Params: --upload <url> <file>
  /// Connected Command: existing <option>
  /// Option can be one of [LoadOptions]
  static const Commands upload = const Commands._("upload");

  /// Print transcript.
  static const Commands verbose = const Commands._("verbose");

  /// Show version number and quit.
  static const Commands version = const Commands._("version");

  /// Assume yes for all prompts.
  static const Commands assumeyes = const Commands._("assumeyes");

  // these two lines are required to add support for values and valueOf
  static Commands valueOf(String name) => Enum.valueOf(Commands, name);

  static List<Commands> get values => Enum.values(Commands);

  // your own implementation
  final String _command;

  String get cliArg => "--$_command";

  const Commands._(this._command);

}