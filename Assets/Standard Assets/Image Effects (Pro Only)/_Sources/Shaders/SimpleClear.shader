

Shader "Hidden/SimpleClear" {
Properties {
	_MainTex ("Base (RGB)", 2D) = "white" {}
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
uniform float4 _MainTex_TexelSize;
 
struct v2f {
<<<<<<< HEAD
	float4 pos : POSITION;
=======
	float4 pos : SV_POSITION;
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
};

v2f vert( appdata_img v )
{
	v2f o;
	o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
	return o;
}

<<<<<<< HEAD
half4 frag (v2f i) : COLOR
=======
half4 frag (v2f i) : SV_Target
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
{
	return half4(0,0,0,0);
}
ENDCG
	}
}

Fallback off

}