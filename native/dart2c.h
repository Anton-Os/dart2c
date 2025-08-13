#include <stdio.h>

__declspec(dllexport) void hello_world();

struct ImageTest {
    unsigned width;
    unsigned height;
    unsigned* data;
};

__declspec(dllexport) struct ImageTest create_image(unsigned width, unsigned height);

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

__declspec(dllexport) struct Vertex* create_vertices(unsigned count);
