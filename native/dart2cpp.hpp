#include <iostream>

#include "common.h"

typedef unsigned (*uintCallback)(unsigned i);
typedef float (*floatCallback)(float f);

extern "C" {

DllExport void hello_world();

DllExport unsigned calc_num(uintCallback callback);

DllExport float calc_dec(floatCallback callback, float f);

}