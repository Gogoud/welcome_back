

Shader "Hidden/ShowAlphaChannel" {
Properties {
	_MainTex ("Base (RGB)", 2D) = "white" {}
	_EdgeTex ("_EdgeTex", 2D) = "white" {}
}

SubShader {
	Pass {
		ZTest Always Cull Off ZWrite Off
		Fog { Mode off }

CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#pragma fragmentoption ARB_precision_hint_fastest 

#include "UnityCG.cginc"

uniform sampler2D _MainTex;
uniform sampler2D _EdgeTex;

uniform float4 _MainTex_TexelSize;

float filterRadius;

struct v2f {
<<<<<<< HEAD
	float4 pos : POSITION;
=======
	float4 pos : SV_POSITION;
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
	float2 uv : TEXCOORD0;
};

v2f vert( appdata_img v )
{
	v2f o;
	o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
	o.uv = v.texcoord.xy;
	
	return o;
}

<<<<<<< HEAD
half4 frag (v2f i) : COLOR
=======
half4 frag (v2f i) : SV_Target
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
{

	half4 color = tex2D(_MainTex,  i.uv.xy);
	half edges = color.a;
	
	return edges;
}
ENDCG
	}
}

Fallback off

}