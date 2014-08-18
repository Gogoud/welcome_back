Shader "Hidden/GlowCompose" {

Properties {
	_Color ("Glow Amount", Color) = (1,1,1,1)
	_MainTex ("", 2D) = "white" {}
}

Category {
	ZTest Always Cull Off ZWrite Off Fog { Mode Off }
	Blend One One

	Subshader {
		Pass {
			CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#pragma fragmentoption ARB_precision_hint_fastest

				#include "UnityCG.cginc"

				struct v2f {
<<<<<<< HEAD
					float4 pos : POSITION;
=======
					float4 pos : SV_POSITION;
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
					half2 uv : TEXCOORD0;
				};

				float4 _MainTex_TexelSize;
				float4 _BlurOffsets;

				v2f vert (appdata_img v)
				{
					v2f o;
					o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
					o.uv = MultiplyUV (UNITY_MATRIX_TEXTURE0, v.texcoord.xy);
					return o;
				}

				sampler2D _MainTex;
				fixed4 _Color;

<<<<<<< HEAD
				fixed4 frag( v2f i ) : COLOR
=======
				fixed4 frag( v2f i ) : SV_Target
>>>>>>> b1e7e130151e489b1b5d34254c1b528e0ffd4407
				{
					return 2.0f * _Color * tex2D( _MainTex, i.uv );
				}
			ENDCG
		}
	}

	SubShader {
		Pass {
			SetTexture [_MainTex] {constantColor [_Color] combine constant * texture DOUBLE}
		}
	}
}

Fallback off

}
