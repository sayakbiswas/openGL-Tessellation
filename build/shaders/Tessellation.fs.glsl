#version 440 core

struct T2F
{
    vec3 position;
    vec3 normal;
    vec4 color;
};

in T2F tedata;
out vec3 color;

uniform mat4 M;
uniform mat4 V;
uniform vec3 lightPosition_worldspace;

void main() {
    vec3 position_worldspace = (M * vec4(tedata.position, 1)).xyz;
    vec3 vertexPosition_cameraspace = (V * M * vec4(tedata.position, 1)).xyz;
    vec3 eyeDirection_cameraspace = vec3(0.0f, 0.0f, 0.0f) - vertexPosition_cameraspace;
    vec3 lightPosition_cameraspace = (V * vec4(lightPosition_worldspace, 1)).xyz;
    vec3 lightDirection_cameraspace = lightPosition_cameraspace + eyeDirection_cameraspace;
    vec3 normal_cameraspace = (V * M * vec4(tedata.normal, 0)).xyz;

    vec3 lightColor = vec3(1, 1, 1);
    float lightPower = 200.0f;

    vec3 materialDiffuseColor = tedata.color.rgb;
    vec3 materialAmbientColor = vec3(0.3, 0.3, 0.3) * materialDiffuseColor;
    vec3 materialSpecularColor = vec3(0.5, 0.5, 0.5) * materialDiffuseColor;

    float distance = length(lightPosition_worldspace - position_worldspace);

    vec3 n = normalize(normal_cameraspace);
    vec3 l = normalize(lightDirection_cameraspace);

    float cosTheta = clamp(dot(n, l), 0, 1);

    vec3 e = normalize(eyeDirection_cameraspace);
    vec3 r = reflect(-l, n);

    float cosAlpha = clamp(dot(e,r), 0, 1);

    color = materialAmbientColor
	    + materialDiffuseColor * lightColor * lightPower * cosTheta / (distance * distance)
	    + materialSpecularColor * lightColor * lightPower * pow(cosAlpha, 5) / (distance * distance);
}
