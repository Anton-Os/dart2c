#include "dart2c.h"

void hello_world(){
    puts("Hello C world!");
}

struct ImageTest create_image(unsigned width, unsigned height){
    struct ImageTest image = {};
    image.width = width;
    image.height = height;
    image.data = (unsigned*)malloc(sizeof(unsigned) * width * height);

    printf("Created image with width: %d, and height: %d", width, height);

    return image;
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