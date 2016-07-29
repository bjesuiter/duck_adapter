library duck_adapter.load_options;

import 'package:enums/enums.dart';

/// Options to manage how to deal with existing files and folders while uploading or downloading
class LoadOptions extends Enum {

  ///Append existing files (resume)
  static const LoadOptions resume = const LoadOptions._("resume");

  ///Overwrite all files (overwrite)
  static const LoadOptions overwrite = const LoadOptions._("overwrite");

  ///Rename transferred files with a timestamp appended to the filename (similar)
  static const LoadOptions similar = const LoadOptions._("similar");

  ///existing	Rename existing files with timestamp appended to filename (rename)
  static const LoadOptions rename = const LoadOptions._("rename");

  ///Skip transfer of files that already exist (skip)
  static const LoadOptions skip = const LoadOptions._("skip");

  ///Skip files that match size, modification date or checksum (compare)
  static const LoadOptions compare = const LoadOptions._("compare");

  ///(cancel)
  static const LoadOptions cancel = const LoadOptions._("cancel");

  // these two lines are required to add support for values and valueOf
  static LoadOptions valueOf(String name) => Enum.valueOf(LoadOptions, name);

  static List<LoadOptions> get values => Enum.values(LoadOptions);

  // your own implementation
  final String name;

  const LoadOptions._(this.name);
}