import 'dart:ffi' as ffi;

import 'common.dart';

final library = getLib("Dart2CPP");

typedef HelloWorldFunc = ffi.Void Function();
typedef HelloWorld = void Function();

void hello(){
  final HelloWorld hello_world_func = library.lookup<ffi.NativeFunction<HelloWorldFunc>>("hello_world").asFunction();

  hello_world_func();
}