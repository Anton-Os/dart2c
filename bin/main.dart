import 'package:bind_2_blind/dart2c.dart' as dart2c;
import 'package:bind_2_blind/dart2cpp.dart' as dart2cpp;
import 'package:bind_2_blind/dart2rasterlib.dart' as dart2rasterlib;
import 'package:bind_2_blind/dart2geolib.dart' as dart2geolib;

void main(List<String> arguments) {
  dart2c.hello_c();
  dart2c.create_image_c();
  // dart2c.create_vertices_c();

  dart2cpp.hello();

  dart2rasterlib.imageTest();

  dart2geolib.shapeTest();
}
