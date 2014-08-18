
Shader "Hidden/MotionBlurClear" 
{

Properties { }

SubShader {
Pass {
	//ZTest LEqual
	ZTest Always // lame depth test
	ZWrite Off // lame depth test

	CGPROGRAM

	#pragma vertex vert
	#pragma fragment frag
	#pragma glsl

	#include "UnityCG.cginc"

	struct vs_input {
		float4 vertex : POSITION;
	};

	struct ps_input {
		float4 pos : SV_POSITION;
		float4 screen : TEXCOORD0;
	};

<<<<<<< HEAD
	sampler2D _CameraDepthTexture;
=======
	sampler2D_float _CameraDepthTexture;
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407

	ps_input vert (vs_input v)
	{
		ps_input o;
		o.pos = mul (UNITY_MATRIX_MVP, v.vertex);	
		o.screen = ComputeScreenPos(o.pos);
		COMPUTE_EYEDEPTH(o.screen.z);
		return o;
	}

<<<<<<< HEAD
	float4 frag (ps_input i) : COLOR
=======
	float4 frag (ps_input i) : SV_Target
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
	{
		// superlame: manual depth test needed as we can't bind depth, FIXME for 4.x
		// alternatively implement SM > 3 version where we write out custom depth

<<<<<<< HEAD
		float d = UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.screen)));
=======
		float d = SAMPLE_DEPTH_TEXTURE_PROJ(_CameraDepthTexture, UNITY_PROJ_COORD(i.screen));
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
		d = LinearEyeDepth(d);
		
		clip(d - i.screen.z + 1e-2f);
		return float4(0, 0, 0, 0);
	}

	ENDCG

	}
}

Fallback Off
}
