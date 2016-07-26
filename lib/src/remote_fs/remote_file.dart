library duck_adapter.remote_file;

import 'dart:io';
import 'dart:async';
import 'dart:convert';

///Abstraction of a remote server file implementing the Directory Interface from dart:io
class RemoteFile implements File{

  // TODO: implement absolute
  @override
  File get absolute => null;

  @override
  Future<File> copy(String newPath) {
    // TODO: implement copy
  }

  @override
  File copySync(String newPath) {
    // TODO: implement copySync
  }

  @override
  Future<File> create({bool recursive: false}) {
    // TODO: implement create
  }

  @override
  void createSync({bool recursive: false}) {
    // TODO: implement createSync
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
  Future<DateTime> lastModified() {
    // TODO: implement lastModified
  }

  @override
  DateTime lastModifiedSync() {
    // TODO: implement lastModifiedSync
  }

  @override
  Future<int> length() {
    // TODO: implement length
  }

  @override
  int lengthSync() {
    // TODO: implement lengthSync
  }

  @override
  Future<RandomAccessFile> open({FileMode mode: FileMode.READ}) {
    // TODO: implement open
  }

  @override
  Stream<List<int>> openRead([int start, int end]) {
    // TODO: implement openRead
  }

  @override
  RandomAccessFile openSync({FileMode mode: FileMode.READ}) {
    // TODO: implement openSync
  }

  @override
  IOSink openWrite({FileMode mode: FileMode.WRITE, Encoding encoding: UTF8}) {
    // TODO: implement openWrite
  }

  // TODO: implement parent
  @override
  Directory get parent => null;

  // TODO: implement path
  @override
  String get path => null;

  @override
  Future<List<int>> readAsBytes() {
    // TODO: implement readAsBytes
  }

  @override
  List<int> readAsBytesSync() {
    // TODO: implement readAsBytesSync
  }

  @override
  Future<List<String>> readAsLines({Encoding encoding: UTF8}) {
    // TODO: implement readAsLines
  }

  @override
  List<String> readAsLinesSync({Encoding encoding: UTF8}) {
    // TODO: implement readAsLinesSync
  }

  @override
  Future<String> readAsString({Encoding encoding: UTF8}) {
    // TODO: implement readAsString
  }

  @override
  String readAsStringSync({Encoding encoding: UTF8}) {
    // TODO: implement readAsStringSync
  }

  @override
  Future<File> rename(String newPath) {
    // TODO: implement rename
  }

  @override
  File renameSync(String newPath) {
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

  @override
  Future<File> writeAsBytes(List<int> bytes, {FileMode mode: FileMode.WRITE, bool flush: false}) {
    // TODO: implement writeAsBytes
  }

  @override
  void writeAsBytesSync(List<int> bytes, {FileMode mode: FileMode.WRITE, bool flush: false}) {
    // TODO: implement writeAsBytesSync
  }

  @override
  Future<File> writeAsString(String contents, {FileMode mode: FileMode.WRITE, Encoding encoding: UTF8, bool flush: false}) {
    // TODO: implement writeAsString
  }

  @override
  void writeAsStringSync(String contents, {FileMode mode: FileMode.WRITE, Encoding encoding: UTF8, bool flush: false}) {
    // TODO: implement writeAsStringSync
  }
}