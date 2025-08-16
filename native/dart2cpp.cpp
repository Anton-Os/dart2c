#include "dart2cpp.hpp"

void hello_world(){ std::cout << "Hello CPP World!" << std::endl; }

unsigned calc_num(uintCallback callback){ return callback(0); }

float calc_dec(floatCallback callback, float f){ return callback(f); }