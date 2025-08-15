import 'dart:ffi' as ffi;

import 'common.dart';

final String targetPath = "F:\\Codex\\PROJECT\\photon_magic\\build\\windows";

final rasterLib = getLib("Rasterlib", directory: targetPath);

final class Rasteron_Size extends ffi.Struct {
  @ffi.Uint32()
  external int width;
  @ffi.Uint32()
  external int height;
}

typedef GetImgSizeFunc = Rasteron_Size Function(ffi.Uint32 height, ffi.Uint32 width);
typedef GetImgSize = Rasteron_Size Function(int height, int width);

final class Rasteron_Image extends ffi.Struct {
  external ffi.Pointer<ffi.Char> name;
  @ffi.Uint32()
  external int height;
  @ffi.Uint32()
  external int width;
  external ffi.Pointer<ffi.Uint32> data;
}

typedef SolidImgFunc = ffi.Pointer<Rasteron_Image> Function(Rasteron_Size size, ffi.Uint32 color);
typedef SolidImg = ffi.Pointer<Rasteron_Image> Function(Rasteron_Size size, int color);

void rasterlibTest(){

  final getSize_func = rasterLib.lookup<ffi.NativeFunction<GetImgSizeFunc>>("internal_create_size");
  final getSize = getSize_func.asFunction<GetImgSize>();

  final solidImgOp_func = rasterLib.lookup<ffi.NativeFunction<SolidImgFunc>>("solidImgOp");
  final solidImgOp = solidImgOp_func.asFunction<SolidImg>();

  ffi.Pointer<Rasteron_Image> image = solidImgOp(getSize(1024, 1024), 0xFF00FF00);
  print("Getting image with width: ${image.ref.width}, height: ${image.ref.height}, name ${image.ref.name.toString()}");
}