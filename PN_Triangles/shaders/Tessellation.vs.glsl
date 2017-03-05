#version 420 compatibility

struct V2T
{
	vec3 position;
	vec3 normal;
};

layout(location = 0) in vec4 vertexPosition_modelspace;
layout(location = 1) in vec4 vertexColor;
layout(location = 2) in vec3 vertexNormal_modelspace;

out V2T vdata;

uniform mat4 M;
uniform mat4 V;
uniform mat4 P;

void main() {
	vdata.position = (P * V * M * vertexPosition_modelspace).xyz;
	vdata.normal = normalize(vertexNormal_modelspace);
}
