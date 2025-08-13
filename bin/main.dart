import 'package:bind_2_blind/dart2c.dart' as dart2c;
import 'package:bind_2_blind/dart2cpp.dart' as dart2cpp;

void main(List<String> arguments) {
  dart2c.hello_c();
  dart2c.create_image_c();
  dart2c.create_vertices_c();

  dart2cpp.hello();
}
