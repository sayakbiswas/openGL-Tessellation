#version 440 core

struct V2F
{
	vec3 position;
	vec3 normal;
	vec4 color;
};

layout(location = 0) in vec4 vertexPosition_modelspace;
layout(location = 1) in vec4 vertexColor;
layout(location = 2) in vec3 vertexNormal_modelspace;

out V2F vdata;

uniform mat4 P;
uniform mat4 V;
uniform mat4 M;

void main() {
	vdata.position = (vertexPosition_modelspace).xyz;
	vdata.normal = normalize(vertexNormal_modelspace);
	vdata.color = vertexColor;

	gl_Position = P * V * M * vertexPosition_modelspace;
}
