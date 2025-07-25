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

struct VertexTest* create_vertices(unsigned count){
    struct VertexTest* vertices = (struct VertexTest*)malloc(count * sizeof(struct VertexTest));

    for(unsigned v = 0; v < count; v++)
        *(vertices + v) = (struct VertexTest){
            (struct VertexAttrib){ 0.0f, 0.0f, 0.0f },
            (struct VertexAttrib){ 0.0f, 0.0f, 0.0f },
            (struct VertexAttrib){ 0.0f, 0.0f, 0.0f },
            (struct VertexAttrib){ 0.0f, 0.0f, 0.0f }
        };

    return vertices;
}