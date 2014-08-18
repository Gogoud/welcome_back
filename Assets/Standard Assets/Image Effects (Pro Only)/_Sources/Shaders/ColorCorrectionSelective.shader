Shader "Hidden/ColorCorrectionSelective" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
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
	
	float4 selColor;
	float4 targetColor;
	
	v2f vert( appdata_img v ) {
		v2f o;
		o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
		o.uv = v.texcoord.xy;
		return o;
	} 
	
<<<<<<< HEAD
	fixed4 frag(v2f i) : COLOR {
=======
	fixed4 frag(v2f i) : SV_Target {
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
		fixed4 color = tex2D (_MainTex, i.uv); 
	
		fixed diff = saturate (2.0 * length (color.rgb - selColor.rgb));
		color = lerp (targetColor, color, diff);
		return color;
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
	
} 