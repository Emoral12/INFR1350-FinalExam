Shader "Custom/Fluid Motion Water"
{
    Properties
    {
        _MainTex ("Diffuse", 2D) = "white" {}
        _WaterTex ("Water", 2D) = "white" {}
        _FoamTex ("Foam", 2D) = "white" {}
        _BumpMap ("Normalmap", 2D) = "bump" {}
        _ScaleUV ("Scale", Range(1,20)) = 1
        _Tint ("Color Tint", Color) = (1,1,1,1)
        _Freq ("Frequency", Range(0,5)) = 3
        _Speed ("Speed", Range(0,100)) = 10
        _Amp ("Amplitude", Range(0,1)) = 0.5
        _ScrollX ("Scroll X Speed", Range(0,1)) = 0.1
        _ScrollY ("Scroll Y Speed", Range(0,1)) = 0.1
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" }
        LOD 300

        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        sampler2D _MainTex;
        sampler2D _WaterTex;
        sampler2D _FoamTex;
        sampler2D _BumpMap;

        float _Freq;
        float _Speed;
        float _Amp;
        float _ScrollX;
        float _ScrollY;
        float4 _Tint;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_WaterTex;
            float2 uv_FoamTex;
        };

        void vert (inout appdata_full v, out Input o)
        {
            UNITY_INITIALIZE_OUTPUT(Input, o);

            // Calculate wave offset
            float waveOffset = _Time.y * _Speed;
            float waveHeight = sin(waveOffset + v.vertex.x * _Freq) * _Amp;
            waveHeight += sin(waveOffset * 1.5 + v.vertex.z * _Freq * 0.5) * (_Amp * 0.5);

            // Apply wave displacement
            v.vertex.y += waveHeight;
            v.normal = normalize(float3(v.normal.x + waveHeight, v.normal.y, v.normal.z));
            
            // Apply UV scaling and offset directly
            o.uv_MainTex = v.texcoord.xy;
            o.uv_WaterTex = v.texcoord.xy;
            o.uv_FoamTex = v.texcoord.xy;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Scroll water and foam textures
            float2 waterUV = IN.uv_WaterTex + float2(_ScrollX * _Time.y, _ScrollY * _Time.y);
            float2 foamUV = IN.uv_FoamTex + float2(_ScrollX * 0.5 * _Time.y, _ScrollY * 0.5 * _Time.y);

            // Sample textures
            float3 waterColor = tex2D(_WaterTex, waterUV).rgb;
            float3 foamColor = tex2D(_FoamTex, foamUV).rgb;
            float3 mainColor = tex2D(_MainTex, IN.uv_MainTex).rgb;

            // Blend foam with water
            float foamIntensity = smoothstep(0.3, 0.7, foamColor.r); // Adjust as needed
            float3 finalColor = lerp(waterColor, foamColor, foamIntensity) * _Tint.rgb;

            o.Albedo = finalColor;
        }
        ENDCG
    }
    FallBack "Transparent/Diffuse"
}
