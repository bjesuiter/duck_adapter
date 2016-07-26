library duck_adapter;

class Session {

  Uri remoteRoot;

  String externalEditorApp = "";

  Session(String remoteRootPath) {
    remoteRoot = Uri.parse(remoteRootPath);
  }


}