library duck_adapter.sync_option;

import 'package:enums/enums.dart';

/// Options to manage how to deal with existing files and folders while syncing
class SyncOption extends Enum {

  ///Download changed and missing files (download)
  static const SyncOption download = const SyncOption._("download");

  ///Upload changed and missing files (upload)
  static const SyncOption upload = const SyncOption._("upload");

  ///Download and Upload (mirror)
  static const SyncOption mirror = const SyncOption._("mirror");

  ///(cancel)
  static const SyncOption cancel = const SyncOption._("cancel");

  // these two lines are required to add support for values and valueOf
  static SyncOption valueOf(String name) => Enum.valueOf(SyncOption, name);

  static List<SyncOption> get values => Enum.values(SyncOption);

  // your own implementation
  final String name;

  const SyncOption._(this.name);
}