library duck_adapter.remote_dir;

import 'dart:io';
import 'dart:async';

///Abstraction of a remote server directory implementing the Directory Interface from dart:io
class RemoteDirectory implements Directory {
  // TODO: implement absolute
  @override
  Directory get absolute => null;

  @override
  Future<Directory> create({bool recursive: false}) {
    // TODO: implement create
  }

  @override
  void createSync({bool recursive: false}) {
    // TODO: implement createSync
  }

  @override
  Future<Directory> createTemp([String prefix]) {
    // TODO: implement createTemp
  }

  @override
  Directory createTempSync([String prefix]) {
    // TODO: implement createTempSync
  }

  @override
  Future<FileSystemEntity> delete({bool recursive: false}) {
    // TODO: implement delete
  }

  @override
  void deleteSync({bool recursive: false}) {
    // TODO: implement deleteSync
  }

  @override
  Future<bool> exists() {
    // TODO: implement exists
  }

  @override
  bool existsSync() {
    // TODO: implement existsSync
  }

  // TODO: implement isAbsolute
  @override
  bool get isAbsolute => null;

  @override
  Stream<FileSystemEntity> list({bool recursive: false, bool followLinks: true}) {
    // TODO: implement list
  }

  @override
  List<FileSystemEntity> listSync({bool recursive: false, bool followLinks: true}) {
    // TODO: implement listSync
  }

  // TODO: implement parent
  @override
  Directory get parent => null;

  // TODO: implement path
  @override
  String get path => null;

  @override
  Future<Directory> rename(String newPath) {
    // TODO: implement rename
  }

  @override
  Directory renameSync(String newPath) {
    // TODO: implement renameSync
  }

  @override
  Future<String> resolveSymbolicLinks() {
    // TODO: implement resolveSymbolicLinks
  }

  @override
  String resolveSymbolicLinksSync() {
    // TODO: implement resolveSymbolicLinksSync
  }

  @override
  Future<FileStat> stat() {
    // TODO: implement stat
  }

  @override
  FileStat statSync() {
    // TODO: implement statSync
  }

  // TODO: implement uri
  @override
  Uri get uri => null;

  @override
  Stream<FileSystemEvent> watch({int events: FileSystemEvent.ALL, bool recursive: false}) {
    // TODO: implement watch
  }
}
