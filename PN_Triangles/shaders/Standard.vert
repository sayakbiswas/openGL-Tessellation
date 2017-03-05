#version 330 core
layout(location = 0) in vec4 vertexPosition_modelspace;
layout(location = 1) in vec4 vertexColor;
layout(location = 2) in vec3 vertexNormal_modelspace;

out vec4 out_vertexColor;
out vec3 position_worldspace;
out vec3 normal_cameraspace;
out vec3 eyeDirection_cameraspace;
out vec3 lightDirection_cameraspace;

uniform mat4 M;
uniform mat4 V;
uniform mat4 P;
uniform vec3 lightPosition_worldspace;

void main() {
    gl_PointSize = 5.0;
    gl_Position = P * V * M * vertexPosition_modelspace;
    position_worldspace = (M * vertexPosition_modelspace).xyz;

    vec3 vertexPosition_cameraspace = (V * M * vertexPosition_modelspace).xyz;
    eyeDirection_cameraspace = vec3(0.0f, 0.0f, 0.0f) - vertexPosition_cameraspace;

    vec3 lightPosition_cameraspace = (V * vec4(lightPosition_worldspace, 1)).xyz;
    lightDirection_cameraspace = lightPosition_cameraspace + eyeDirection_cameraspace;

    normal_cameraspace = (V * M * vec4(vertexNormal_modelspace, 0)).xyz;

    out_vertexColor = vertexColor;
}