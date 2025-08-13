import 'dart:ffi' as ffi;

import 'common.dart';

final String targetPath = "F:\\Codex\\PROJECT\\photon_magic\\build\\windows";

final rasterLib = getLib("Rasteron", directory: targetPath);

void rasterlibTest(){
  // TODO: Implement here
}

final geoLib = getLib("GEOLIB", directory: targetPath);

void geolibTest(){
  // TODO: Implement here
}