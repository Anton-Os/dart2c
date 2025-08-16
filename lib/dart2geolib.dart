import 'dart:ffi' as ffi;

import 'common.dart';

final String targetPath = "F:\\Codex\\PROJECT\\photon_magic\\build\\windows";

final geoLib = getLib("GEOLIB", directory: targetPath);

final class Shape2D extends ffi.Struct {
  @ffi.Float()
  external double radius;
  @ffi.Uint16()
  external int segments;
}

typedef CreateShape2DFunc = Shape2D Function(ffi.Float radius, ffi.Uint16 segs);
typedef CreateShape2D = Shape2D Function(double radius, int segs);

final class Shape3D extends ffi.Struct {
  @ffi.Float()
  external double radius;
  @ffi.Uint16()
  external int xSegs;
  @ffi.Uint16()
  external int ySegs;
}

typedef CreateShape3DFunc = Shape3D Function(ffi.Float radius, ffi.Uint16 xSegs, ffi.Uint16 ySegs);
typedef CreateShape3D = Shape3D Function(double radius, int xSegs, int ySegs);

final class Geo_Vertex extends ffi.Struct {
  @ffi.Array.multi([3])
  external ffi.Array<ffi.Float> position;
  @ffi.Array.multi([3])
  external ffi.Array<ffi.Float> texcoord;
  @ffi.Array.multi([3])
  external ffi.Array<ffi.Float> normal;
  @ffi.Array.multi([4])
  external ffi.Array<ffi.Float> color;
  @ffi.Array.multi([3])
  external ffi.Array<ffi.Float> tangent;
}

typedef GenSurfaceFunc = ffi.Pointer<Geo_Vertex> Function(Shape2D shape, ffi.Float z);
typedef GenSurface = ffi.Pointer<Geo_Vertex> Function(Shape2D shape, double z);

void shapeTest(){
  final createShape2D_func = geoLib.lookup<ffi.NativeFunction<CreateShape2DFunc>>("create_shape2D");
  final createShape2D = createShape2D_func.asFunction<CreateShape2D>();

  Shape2D shape2D = createShape2D(1.0, 3);

  print("Generated shape with radius: ${shape2D.radius}, and segs: ${shape2D.segments}");

  final createShape3D_func = geoLib.lookup<ffi.NativeFunction<CreateShape3DFunc>>("create_shape3D");
  final createShape3D = createShape3D_func.asFunction<CreateShape3D>();

  Shape3D shape3D = createShape3D(1.0, 3, 3);

  print("Generated shape with radius: ${shape3D.radius}, and segs: ${shape3D.xSegs}, ${shape3D.ySegs}");

  final genSurface_func = geoLib.lookup<ffi.NativeFunction<GenSurfaceFunc>>("genSurface_vertices");
  final genSurface = genSurface_func.asFunction<GenSurface>();

  ffi.Pointer<Geo_Vertex> vertices = genSurface(createShape2D(1.0, 3), 0.0);
}