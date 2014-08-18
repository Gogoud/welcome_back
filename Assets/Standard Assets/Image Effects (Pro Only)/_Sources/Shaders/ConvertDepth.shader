Shader "Hidden/ConvertDepth" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	
	// Shader code pasted into all further CGPROGRAM blocks
	CGINCLUDE
		
	#include "UnityCG.cginc"
	
	struct v2f {
<<<<<<< HEAD
		float4 pos : POSITION;
=======
		float4 pos : SV_POSITION;
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
		float2 uv : TEXCOORD0;
	};
		
	sampler2D _MainTex;
<<<<<<< HEAD
	sampler2D _CameraDepthTexture;
=======
	sampler2D_float _CameraDepthTexture;
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
		
	v2f vert( appdata_img v ) 
	{
		v2f o;
		o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
		o.uv =  v.texcoord.xy;
		return o;
	}
	
<<<<<<< HEAD
	half4 frag(v2f i) : COLOR 
	{
		float d = UNITY_SAMPLE_DEPTH( tex2D(_CameraDepthTexture, i.uv.xy) );
=======
	half4 frag(v2f i) : SV_Target 
	{
		float d = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, i.uv.xy);
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
		d = Linear01Depth(d);
			 
		if(d>0.99999)
			return half4(1,1,1,1);
		else
			return EncodeFloatRGBA(d); 
	}

	ENDCG
	
Subshader {
	
 Pass {
	  ZTest Always Cull Off ZWrite Off
	  Fog { Mode off }      

      CGPROGRAM
      #pragma fragmentoption ARB_precision_hint_fastest
      #pragma vertex vert
      #pragma fragment frag
      ENDCG
  }
}

Fallback off
	
} // shader