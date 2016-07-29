library duck_adapter.sync_options;

import 'package:enums/enums.dart';

/// Options to manage how to deal with existing files and folders while syncing
class SyncOptions extends Enum {

  ///Download changed and missing files (download)
  static const SyncOptions download = const SyncOptions._("download");

  ///Upload changed and missing files (upload)
  static const SyncOptions upload = const SyncOptions._("upload");

  ///Download and Upload (mirror)
  static const SyncOptions mirror = const SyncOptions._("mirror");

  ///(cancel)
  static const SyncOptions cancel = const SyncOptions._("cancel");

  // these two lines are required to add support for values and valueOf
  static SyncOptions valueOf(String name) => Enum.valueOf(SyncOptions, name);

  static List<SyncOptions> get values => Enum.values(SyncOptions);

  // your own implementation
  final String name;

  const SyncOptions._(this.name);
}