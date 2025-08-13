import 'dart:ffi' as ffi;
import 'dart:io' show Directory, Platform;

ffi.DynamicLibrary getLib(String name, { String directory = "" }){
  if(directory == "") {
    directory = Directory.current.path;
    if(Platform.isWindows) directory += "/Debug";
  }

  String fullPath;
  if(Platform.isWindows) fullPath = directory + '/' + name + ".dll";
  else if(Platform.isMacOS || Platform.isIOS) fullPath = directory + '/' + name + ".dylib";
  else fullPath = directory + '/' + name + ".so";

  if(Platform.isWindows) fullPath = fullPath.replaceAll('/', '\\');

  print("Full path is ${fullPath}");
  return ffi.DynamicLibrary.open(fullPath);
}