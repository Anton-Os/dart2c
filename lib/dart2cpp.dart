import 'dart:ffi' as ffi;

String getLibPath(){
  String path = "F:\\Codex\\PROJECT\\dart2c\\bin\\Debug\\Dart2CPP.dll";

  // if(Platform.isWindows) libPath += "Debug\\Dart2C.dll";

  return path;
}

String libPath = getLibPath();

final library = ffi.DynamicLibrary.open(libPath);

typedef HelloWorldFunc = ffi.Void Function();
typedef HelloWorld = void Function();

void hello(){
  print("Library path is $libPath");

  final HelloWorld hello_world_func = library.lookup<ffi.NativeFunction<HelloWorldFunc>>("hello_world").asFunction();

  hello_world_func();
}