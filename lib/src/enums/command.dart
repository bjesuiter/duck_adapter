library duck_adapter.commands;

import 'package:enums/enums.dart';
import 'load_option.dart';
import 'sync_option.dart';

///Command to String mapping of duck cli commands
class Command extends Enum {

  ///External editor application
  ///
  /// Params: --application <path>
  static const Command application = const Command._("application");

  /// Copy between servers
  ///
  /// Params: --copy <url> <url>
  static const Command copy = const Command._("copy");

  /// Download file or folder. Denote a folder with a trailing '/'.
  ///
  /// Params: --download <url> <[file]>
  /// Connected Command: existing <option>
  /// Option can be one of [LoadOption]
  static const Command download = const Command._("download");

  /// Delete.
  ///
  /// Params: --delete <url>
  static const Command delete = const Command._("delete");

  /// Transfer action for existing files.
  ///
  /// Params: --existing <action>
  /// Action can be one of [LoadOption] or [SyncOption], depending on the used method
  static const Command existing = const Command._("existing");

  /// Edit file in external editor.
  ///
  /// Params: --edit <url>
  /// Connected Command: application
  static const Command edit = const Command._("edit");

  /// Print this help.
  static const Command help = const Command._("help");

  /// Selects a file from which the identity (private key) for public key authentication is read.
  ///
  /// Params: --identity <private key file>
  static const Command identity = const Command._("identity");

  /// List files in remote folder.
  ///
  /// Params: --list <url>
  /// Connected command: longlist
  static const Command list = const Command._("list");

  /// Long list format with modification date and permission mask.
  static const Command longlist = const Command._("longlist");

  /// Password.
  ///
  /// Params: --password <password or secret key>
  static const Command password = const Command._("password");

  ///Preserve permissions and modification date for transferred files.
  static const Command preserve = const Command._("preserve");

  /// Number of concurrent connections to use for transfers.
  ///
  /// --parallel <connections>
  static const Command parallel = const Command._("parallel");

  ///Suppress progress messages.
  static const Command quiet = const Command._("quiet");

  /// Retry failed connection attempts.
  ///
  /// --retry <count>
  static const Command retry = const Command._("retry");

  /// Location of bucket or container.
  ///
  /// --region <location>
  static const Command region = const Command._("region");

  /// Synchronize folders.
  ///
  /// Params: --synchronize <url> <directory>
  /// Connected Command: existing <option>
  /// Option can be one of [SyncOption]
  static const Command synchronize = const Command._("synchronize");

  /// Throttle bandwidth.
  ///
  /// Params: --throttle <bytes per second>
  static const Command throttle = const Command._("throttle");

  /// Username.
  ///
  /// Params: --username <username or access key>
  static const Command username = const Command._("username");

  /// Use UDT protocol if applicable.
  static const Command udt = const Command._("udt");

  /// Upload file or folder recursively.
  ///
  /// Params: --upload <url> <file>
  /// Connected Command: existing <option>
  /// Option can be one of [LoadOption]
  static const Command upload = const Command._("upload");

  /// Print transcript.
  static const Command verbose = const Command._("verbose");

  /// Show version number and quit.
  static const Command version = const Command._("version");

  /// Assume yes for all prompts.
  static const Command assumeyes = const Command._("assumeyes");

  // these two lines are required to add support for values and valueOf
  static Command valueOf(String name) => Enum.valueOf(Command, name);

  static List<Command> get values => Enum.values(Command);

  // your own implementation
  final String _command;

  String get cliArg => "--$_command";

  const Command._(this._command);

}