#version 420 compatibility

struct V2T
{
    vec3 position;
    vec3 normal;
	
	//Texture3D coords
	vec3 texcoord3;
};

struct TC2E
{
    vec3 b3;
    vec3 b21x3, b12x3;
    vec3 n2;
    vec3 n11;
	
	//Texture3D coords
	vec3 bt3;
	//vec3 bt21x3, bt12x3;
};

struct TPatch
{
    //vec3 b300,b030,b003;
    //vec3 b210,b120;
    //vec3 b021,b012;
    //vec3 b102,b201;
    vec3 b111x6;
    //vec3 n200,n020,n002;
    //vec3 n110,n011,n101;
	
	//Texture3D coords - probably not needed, causes glitchy textures
	//vec3 bt111x6;
};

struct T2G
{
    vec3 position;
    vec3 normal;
    vec3 patchDistance;
	
	//Texture3D coords
	vec3 texcoord3;
};

struct G2F
{
    vec3 position;
    vec3 normal;
    vec3 patchDistance;
    vec3 triDistance;
	
	//Texture3D coords
	vec3 texcoord3;
};

#ifdef VertexShader //--------------------------------------
out V2T vdata;

void main()
{
    vdata.position = gl_Vertex.xyz;
    vdata.normal = normalize(gl_Normal.xyz);
	
	//Texture3D coords
	vdata.texcoord3.xyz = gl_MultiTexCoord0.xyz;
}
#endif
#ifdef TessellationControlShader //-----------------------
layout (vertices = 3) out;
uniform float TessellationLevel;
//const float TessellationLevel = 6.;
in V2T vdata[];
out TC2E tcdata[];
out patch TPatch tpdata;

void main()
{
//    const int I = gl_InvocationID;
#define I gl_InvocationID
    const int J = (I+1)%3;
    vec3 p1 = vdata[I].position;
	
	//Texture3D coords
	vec3 t1 = vdata[I].texcoord3;
	
    tcdata[I].b3 = p1;
	
	//Texture3D coords
	tcdata[I].bt3 = t1;
	
    tcdata[I].n2 = vdata[I].normal;
    vec3 dp = vdata[J].position - vdata[I].position;
	
	//Texture3D coords - probably not needed, causes glitchy textures
	//vec3 tdp = vdata[J].texcoord3 - vdata[I].texcoord3;
	
    vec3 n12 = vdata[I].normal + vdata[J].normal;
    tcdata[I].n11 = normalize( n12*dot(dp,dp) + dp*(2.*dot(dp,n12)) );

    float w12 = dot(dp,vdata[I].normal);
    float w21 = -dot(dp,vdata[J].normal);
	
	//Texture3D coords - probably not needed, causes glitchy textures
	//float tw12 = dot(tdp,vdata[I].normal);
    //float tw21 = -dot(tdp,vdata[J].normal);
	
    tcdata[I].b21x3 = (2.*vdata[I].position + vdata[J].position - w12*vdata[I].normal);
    tcdata[I].b12x3 = (2.*vdata[J].position + vdata[I].position - w21*vdata[J].normal);
	
	//Texture3D coords - probably not needed, causes glitchy textures
	//tcdata[I].bt21x3 = (2.*vdata[I].texcoord3 + vdata[J].texcoord3 - tw12*vdata[I].normal);
    //tcdata[I].bt12x3 = (2.*vdata[J].texcoord3 + vdata[I].texcoord3 - tw21*vdata[J].normal);

    gl_TessLevelOuter[I] = TessellationLevel;

    barrier();
    //float ee = (tcdata[0].b21x3[I] + tcdata[0].b12x3[I] + tcdata[1].b21x3[I] + tcdata[1].b12x3[I] + tcdata[2].b21x3[I] + tcdata[2].b12x3[I]);
    //float vv = (tcdata[0].b3[I] + tcdata[1].b3[I] + tcdata[2].b3[I]);
    //p.b111x6[I] = (ee/2. + vv);
    if (I==0)
    {
        vec3 eex18 = (tcdata[0].b21x3 + tcdata[0].b12x3 + tcdata[1].b21x3 + tcdata[1].b12x3 + tcdata[2].b21x3 + tcdata[2].b12x3);
        vec3 vvx3 = (tcdata[0].b3 + tcdata[1].b3 + tcdata[2].b3);
        tpdata.b111x6 = (eex18/2. - vvx3);
		
		//Texture3D coords - probably not needed, causes glitchy textures
		//vec3 teex18 = (tcdata[0].bt21x3 + tcdata[0].bt12x3 + tcdata[1].bt21x3 + tcdata[1].bt12x3 + tcdata[2].bt21x3 + tcdata[2].bt12x3);
		//vec3 tvvx3 = (tcdata[0].bt3 + tcdata[1].bt3 + tcdata[2].bt3);
		//tpdata.bt111x6 = (teex18/2. - tvvx3);

        gl_TessLevelInner[0] = TessellationLevel;

    }
#undef I
}

#endif
#ifdef TessellationEvaluationShader //-----------------------
layout(triangles, equal_spacing, cw) in;
in TC2E tcdata[];
in patch TPatch tpdata;
out T2G tedata;

void main()
{
    tedata.patchDistance = gl_TessCoord;
    float u = gl_TessCoord.x, v = gl_TessCoord.y, w = gl_TessCoord.z;

    float u2 = u*u, v2 = v*v, w2 = w*w;
    tedata.normal = tcdata[0].n2*(u2) + tcdata[1].n2*(v2) + tcdata[2].n2*(w2) + 
        tcdata[0].n11*(u*v) + tcdata[1].n11*(v*w) + tcdata[2].n11*(w*u);
    vec3 pos = tcdata[0].b3*(u2*u) + tcdata[1].b3*(v2*v) + tcdata[2].b3*(w2*w) +
        tcdata[0].b21x3*(u2*v) + tcdata[0].b12x3*(u*v2) +
        tcdata[1].b21x3*(v2*w) + tcdata[1].b12x3*(v*w2) +
        tcdata[2].b21x3*(w2*u) + tcdata[2].b12x3*(w*u2) +
        tpdata.b111x6*(u*v*w);
		
	//Texture3D coords - probably not needed, causes glitchy textures
	//vec3 tpos = tcdata[0].bt3*(u2*u) + tcdata[1].bt3*(v2*v) + tcdata[2].bt3*(w2*w) +
        //tcdata[0].bt21x3*(u2*v) + tcdata[0].bt12x3*(u*v2) +
        //tcdata[1].bt21x3*(v2*w) + tcdata[1].bt12x3*(v*w2) +
        //tcdata[2].bt21x3*(w2*u) + tcdata[2].bt12x3*(w*u2) +
        //tpdata.bt111x6*(u*v*w);
	vec3 tpos = tcdata[0].bt3 * u + tcdata[1].bt3 * v + tcdata[2].bt3 * w;

    //tedata.normal = tcdata[0].n2*(w) + tcdata[1].n2*(u) + tcdata[2].n2*(v);
    //vec3 pos = tcdata[0].b3*(w) + tcdata[1].b3*(u) + tcdata[2].b3*(v);

    tedata.position = pos;
	
	//Texture3D coords
	tedata.texcoord3 = tpos;
	
    gl_Position = gl_ModelViewProjectionMatrix * vec4(pos, 1);
}

#endif
#ifdef GeometryShader //------------------------------------

layout(triangles) in;
layout(triangle_strip, max_vertices = 3) out;
in T2G tedata[3];
out G2F gdata;

void main()
{
/*
    vec3 A = tePosition[2] - tePosition[0];
    vec3 B = tePosition[1] - tePosition[0];
    gNormal = normalize(cross(A, B));
*/
    gdata.position = tedata[0].position;
    gdata.normal = tedata[0].normal;
    gdata.patchDistance = tedata[0].patchDistance;
    gdata.triDistance = vec3(1, 0, 0);
	
	//Texture3D coords
	gdata.texcoord3 = tedata[0].texcoord3;
	
    gl_Position = gl_in[0].gl_Position;
    EmitVertex();

    gdata.position = tedata[1].position;
    gdata.normal = tedata[1].normal;
    gdata.patchDistance = tedata[1].patchDistance;
    gdata.triDistance = vec3(0, 1, 0);
	
	//Texture3D coords
	gdata.texcoord3 = tedata[1].texcoord3;
	
    gl_Position = gl_in[1].gl_Position;
    EmitVertex();

    gdata.position = tedata[2].position;
    gdata.normal = tedata[2].normal;
    gdata.patchDistance = tedata[2].patchDistance;
    gdata.triDistance = vec3(0, 0, 1);
	
	//Texture3D coords
	gdata.texcoord3 = tedata[2].texcoord3;
	
    gl_Position = gl_in[2].gl_Position;
    EmitVertex();

    EndPrimitive();
}
#endif
#ifdef FragmentShader //------------------------------------
//out vec4 FragColor;
in G2F gdata;
//uniform vec3 LightPosition;
//uniform vec3 DiffuseMaterial;
//uniform vec3 AmbientMaterial;
const vec3 LIGHTPOS = vec3( -50., 10., 150. );
uniform sampler3D colorTexture3;

float amplify(float d, float scale, float offset)
{
    d = scale * d + offset;
    d = 1 - exp2(-2*d*d);
    d = clamp(d, 0, 1);
    return d;
}

void main()
{
	vec3 in_texcoord3 = gdata.texcoord3.xyz;
	vec4 color = texture3D(colorTexture3, in_texcoord3);
    gl_FragColor = vec4(color.rgb, 1.0);
	//gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
}
#endif