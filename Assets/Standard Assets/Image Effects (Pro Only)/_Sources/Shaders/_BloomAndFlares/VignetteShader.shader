Shader "Hidden/VignetteShader" {
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
	
	float4 _MainTex_TexelSize;
	float vignetteIntensity;
		
	v2f vert( appdata_img v ) {
		v2f o;
		o.pos = mul(UNITY_MATRIX_MVP, v.vertex);	
		
		o.uv = v.texcoord.xy;
		return o;
	} 
	
<<<<<<< HEAD
	half4 frag(v2f i) : COLOR {
=======
	half4 frag(v2f i) : SV_Target {
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
		half2 coords = i.uv;
		half2 uv = i.uv;
		
		coords = (coords - 0.5) * 2.0;		
		half coordDot = dot (coords,coords);
		half4 color = tex2D (_MainTex, uv);	 
		 		 
		float mask = 1.0 - coordDot * vignetteIntensity; 
		return color * mask;
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