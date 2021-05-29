#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

out vec2 TexCoords;
out vec3 normal;
out vec3 fragPos;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

mat2x2 a = mat2( vec2( 1.0, 0.0 ), vec2(-1.05, 0.95) );
//mat2x2 b = mat2( vec2( 1.0, 0.0 ), vec2(-sqrt(3.0)-2, sqrt(2)+sqrt(6) ) );

void main()
{
    TexCoords = vec2(aTexCoords.x-0.1, aTexCoords.y);
    TexCoords = a*TexCoords;
    //TexCoords = vec2(1.0-TexCoords.x, TexCoords.y);
    gl_Position = projection * view * model * vec4(aPos, 1.0);
    normal = normalize((transpose(inverse(mat3(model)))*aNormal));
    fragPos = vec3(model*vec4(aPos, 1.0f));
}