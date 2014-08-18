Shader "Hidden/BlendOneOne" {
	Properties {
		_MainTex ("-", 2D) = "" {}
	}
	
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
	half _Intensity;
		
	v2f vert( appdata_img v ) {
		v2f o;
		o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
		o.uv =  v.texcoord.xy;
		return o;
	}
	
<<<<<<< HEAD
	half4 frag(v2f i) : COLOR {
=======
	half4 frag(v2f i) : SV_Target {
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
		return tex2D(_MainTex, i.uv) * _Intensity;
	}

	ENDCG
	
Subshader {

  Pass {
  		BlendOp Add
  		Blend One One
  
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
	
}