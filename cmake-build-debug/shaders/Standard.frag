#version 440 core

struct V2F
{
	vec3 position;
	vec3 normal;
	vec4 color;
};

in V2F vdata;
out vec3 color;

void main() {
	color = vdata.color.xyz;
}
