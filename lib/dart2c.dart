import 'dart:ffi' as ffi;

import 'common.dart';

final library = getLib("Dart2C");

typedef HelloWorldFunc = ffi.Void Function();
typedef HelloWorld = void Function();

final class ImageTest extends ffi.Struct {
  @ffi.Uint32()
  external int width;
  @ffi.Uint32()
  external int height;
  external ffi.Pointer<ffi.Uint32> data;
}

typedef CreateImageFunc = ImageTest Function(ffi.Uint32 width, ffi.Uint32 height);
typedef CreateImage = ImageTest Function(int width, int height);

final class VertexAttrib extends ffi.Struct {
  @ffi.Float()
  external double x;
  @ffi.Float()
  external double y;
  @ffi.Float()
  external double z;
}

final class Vertex extends ffi.Struct {
  external VertexAttrib pos;
  external VertexAttrib texcoord;
  external VertexAttrib normal;
  external VertexAttrib color;
}

typedef CreateVerticesFunc = ffi.Pointer<Vertex> Function(ffi.Uint32 count);
typedef CreateVertices = ffi.Pointer<Vertex> Function(int count);

void hello_c() {
  final HelloWorld hello_world_func = library.lookup<ffi.NativeFunction<HelloWorldFunc>>("hello_world").asFunction();

  hello_world_func();
}

void create_struct_c() {
  final CreateImage create_struct_func = library.lookupFunction<CreateImageFunc, CreateImage>("create_struct");

  final image = create_struct_func(256, 256);
}

void create_vertices_c(){
  final CreateVertices create_vertices_func = library.lookupFunction<CreateVerticesFunc, CreateVertices>("create_vertices");

  final vertices = create_vertices_func(100);

  // for(final v in vertices) print("Parsing vertex $v");
}
