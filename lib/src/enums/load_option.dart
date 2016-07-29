library duck_adapter.load_option;

import 'package:enums/enums.dart';

/// Options to manage how to deal with existing files and folders while uploading or downloading
class LoadOption extends Enum {

  ///Append existing files (resume)
  static const LoadOption resume = const LoadOption._("resume");

  ///Overwrite all files (overwrite)
  static const LoadOption overwrite = const LoadOption._("overwrite");

  ///Rename transferred files with a timestamp appended to the filename (similar)
  static const LoadOption similar = const LoadOption._("similar");

  ///existing	Rename existing files with timestamp appended to filename (rename)
  static const LoadOption rename = const LoadOption._("rename");

  ///Skip transfer of files that already exist (skip)
  static const LoadOption skip = const LoadOption._("skip");

  ///Skip files that match size, modification date or checksum (compare)
  static const LoadOption compare = const LoadOption._("compare");

  ///(cancel)
  static const LoadOption cancel = const LoadOption._("cancel");

  // these two lines are required to add support for values and valueOf
  static LoadOption valueOf(String name) => Enum.valueOf(LoadOption, name);

  static List<LoadOption> get values => Enum.values(LoadOption);

  // your own implementation
  final String name;

  const LoadOption._(this.name);
}