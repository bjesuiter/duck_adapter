import 'package:grinder/grinder.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

const duck = "duck";
const user = "fewo-birkennest.de";
const remoteRoot = "sftp://$user@ssh.strato.de/";

const generalDuckParams = const [
  "--identity", "/home/bjesuiter/.ssh/fewo-birkennest.de",
  "--quiet"
];

main(args) => grind(args);

@DefaultTask("builds the project")
build() async {
  defaultClean(context);
  var workingDir = path.join(Platform.script.toFilePath(), "../");
  var buildMode = "release";
  Pub.build(mode: buildMode, directories: ["web"]);
}

@Task("Deploys the contact php endpoints")
deployContactPhp() {
  deploy("api/", "contact/contact.php");
  deploy("api/", "contact/contact_test.php");
}

@Task("Deploying to Webroot 1")
///https://trac.cyberduck.io/wiki/help/en/howto/cli
///call this task like: grind deploy-webroot1
deployWebroot1() => deploy("webroot/", "build/web/");

@Task("Deploying to Webroot 2")
deployWebroot2() => deploy("webroot2/", "build/web/");


deploy(String remoteLocation, String localLocation) {
  var args = [
    "--upload", "$remoteRoot$remoteLocation $localLocation",
    "--existing", "compare"
  ]
    ..addAll(generalDuckParams);

  var processResult = Process.run(duck, args);

  processResult.then(showProcessResult);

  log("Upload running... ");
}

void showProcessResult(ProcessResult result) {
  log("ExitCode: ${result.exitCode} \n"
      "StdOut:\n ${result.stdout} \n"
      "StdErr: \n ${result.stderr}"
  );
}
