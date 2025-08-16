#include "dart2c.h"

void hello_world(){
    puts("Hello C world!");
}

struct StructTest create_struct(unsigned width, unsigned height){
    struct StructTest testStruct = {};
    testStruct.width = width;
    testStruct.height = height;
    testStruct.data = (unsigned*)malloc(sizeof(unsigned) * width * height);

    printf("Created testStruct with width: %d, and height: %d", width, height);

    return testStruct;
}

struct Vertex* create_vertices(unsigned count){
    struct Vertex* vertices = (struct Vertex*)malloc(count * sizeof(struct Vertex));

    for(unsigned v = 0; v < count; v++)
        *(vertices + v) = (struct Vertex){
            (struct VertexAttrib){ 0.0f, 0.0f, 0.0f },
            (struct VertexAttrib){ 0.0f, 0.0f, 0.0f },
            (struct VertexAttrib){ 0.0f, 0.0f, 0.0f },
            (struct VertexAttrib){ 0.0f, 0.0f, 0.0f }
        };

    return vertices;
}