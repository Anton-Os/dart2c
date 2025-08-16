#include "common.h"

DllExport void hello_world();

struct StructTest {
    unsigned width;
    unsigned height;
    unsigned* data;
};

DllExport struct StructTest create_struct(unsigned width, unsigned height);

struct VertexAttrib {
    float x;
    float y;
    float z;
};

struct VertexDesc { unsigned count; };

struct Vertex {
    struct VertexAttrib pos;
    struct VertexAttrib texcoord;
    struct VertexAttrib normal;
    struct VertexAttrib color;
};

DllExport struct Vertex* create_vertices(unsigned count);
