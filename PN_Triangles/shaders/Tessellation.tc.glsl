#version 420 compatibility

struct V2T
{
	vec3 position;
	vec3 normal;
};

struct TC2E {
	vec3 position;
	vec3 normal;
};

layout (vertices = 3) out;
uniform float tessellationLevelInner;
uniform float tessellationLevelOuter;
in V2T vdata[];
out TC2E tcdata[];

void main() {
	#define ID gl_InvocationID
	tcdata[ID].position = vdata[ID].position;
	tcdata[ID].normal = vdata[ID].normal;

	if(ID == 0) {
		gl_TessLevelInner[0] = tessellationLevelInner;
		gl_TessLevelOuter[0] = tessellationLevelOuter;
		gl_TessLevelOuter[1] = tessellationLevelOuter;
		gl_TessLevelOuter[2] = tessellationLevelOuter;
	}
	#undef ID
}
