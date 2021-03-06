#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

out vec2 TexCoords;
out vec3 Normal;
out vec3 FragPos;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

mat2x2 a = mat2( vec2( 1.0, 0.0 ), vec2(-1.05, 0.95) );

void main()
{
    FragPos = vec3(model * vec4(aPos.x, aPos.y, aPos.z, 1.0));
    TexCoords = aTexCoords;    
    Normal = mat3(transpose(inverse(model))) * aNormal;
    gl_Position = projection * view * model * vec4(aPos.x, aPos.y, aPos.z, 1.0);
}