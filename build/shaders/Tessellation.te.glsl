#version 440 core

struct TC2E
{
    vec3 position;
    vec3 normal;
    vec4 color;
};

struct T2F
{
    vec3 position;
    vec3 normal;
    vec4 color;
};

layout(triangles, equal_spacing, cw) in;
in TC2E tcdata[];
out T2F tedata;

uniform mat4 M;
uniform mat4 V;
uniform mat4 P;

void main() {
    vec3 p0 = tcdata[0].position;
    vec3 p1 = tcdata[1].position;
    vec3 p2 = tcdata[2].position;

    vec3 n0 = tcdata[0].normal;
    vec3 n1 = tcdata[1].normal;
    vec3 n2 = tcdata[2].normal;

    vec3 c0 = tcdata[0].color.rgb;
    vec3 c1 = tcdata[1].color.rgb;
    vec3 c2 = tcdata[2].color.rgb;

    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;
    float w = gl_TessCoord.z;

    vec3 b0 = p0;
    vec3 b1 = p1;
    vec3 b2 = p2;

    float w01 = dot(p1 - p0, n0);
    float w10 = dot(p0 - p1, n1);
    float w12 = dot(p2 - p1, n1);
    float w21 = dot(p1 - p2, n2);
    float w20 = dot(p0 - p2, n2);
    float w02 = dot(p2 - p0, n0);

    vec3 b01 = (2.*p0 + p1 - w01*n0) / 3.;
    vec3 b10 = (2.*p1 + p0 - w10*n1) / 3.;
    vec3 b12 = (2.*p1 + p2 - w12*n1) / 3.;
    vec3 b21 = (2.*p2 + p1 - w21*n2) / 3.;
    vec3 b20 = (2.*p2 + p0 - w20*n2) / 3.;
    vec3 b02 = (2.*p0 + p2 - w02*n0) / 3.;

    vec3 ee = (b01 + b10 + b12 + b21 + b20 + b02) / 6.;
    vec3 vv = (p0 + p1 + p2) / 3.;
    vec3 b012 = ee + (ee - vv) / 2.;

    float u3 = u * u * u;
    float v3 = v * v * v;
    float w3 = w * w * w;
    float u2 = u * u;
    float v2 = v * v;
    float w2 = w * w;

    vec3 pos = b0 * u3 + b1 * v3 + b2 * w3
		+ b01 * 3. * u2 * v + b10 * 3. * u * v2
		+ b12 * 3. * v2 * w + b21 * 3. * v * w2
		+ b20 * 3. * u * w2 + b02 * 3. * u2 * w
		+ b012 * 6. * u * v * w;

    tedata.position = pos;

    float v01 = (2.*(dot(p1 - p0, n0 + n1) / dot(p1 - p0, p1 - p0)));
    float v12 = (2.*(dot(p2 - p1, n1 + n2) / dot(p2 - p1, p2 - p1)));
    float v02 = (2.*(dot(p2 - p0, n0 + n2) / dot(p2 - p0, p2 - p0)));

    vec3 n01 = normalize(n0 + n1 - v01*(p1 - p0));
    vec3 n12 = normalize(n1 + n2 - v12*(p2 - p1));
    vec3 n02 = normalize(n0 + n2 - v02*(p2 - p0));

    tedata.normal = n0 * u2 + n1 * v2 + n2 * w2
		    + n01 * u * v + n12 * v * w + n02 * w * u;
    //tedata.normal = n0 * u + n1 * v + n2 * w;

    tedata.color = vec4(c0 * u + c1 * v + c2 * w, 1.0);
    //tedata.color = vec4(c0, 1.0);

    gl_Position = P * V * M * vec4(pos, 1.0);
}
