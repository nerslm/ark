// Made with Amplify Shader Editor v1.9.9.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FORGE3D/Planets HD/Lava"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		_SpecularColor( "Specular Color", Color ) = ( 0.3921569, 0.3921569, 0.3921569, 1 )
		_Shininess( "Shininess", Range( 0.01, 1 ) ) = 0.1
		_HeightMap( "Height Map", 2D ) = "white" {}
		_ScatterMap( "Scatter Map", 2D ) = "white" {}
		_ScatterColor( "Scatter Color", Color ) = ( 0, 0, 0, 0 )
		_ScatterBoost( "Scatter Boost", Range( 0, 5 ) ) = 1
		_ScatterIndirect( "Scatter Indirect", Range( 0, 1 ) ) = 0
		_ScatterStretch( "Scatter Stretch", Range( -2, 2 ) ) = 0
		_ScatterCenterShift( "Scatter Center Shift", Range( -2, 2 ) ) = 0
		_DetailMap( "Detail Map", 2D ) = "white" {}
		_MagmaMap( "Magma Map", 2D ) = "white" {}
		_NormalMap( "Normal Map", 2D ) = "white" {}
		_NormalScale( "Normal Scale", Float ) = 0
		_NormalTiling( "Normal Tiling", Float ) = 0
		_HeightTiling( "Height Tiling", Float ) = 2
		_DetailTiling( "Detail Tiling", Float ) = 2
		_MagmaTiling( "Magma Tiling", Float ) = 2
		_LavaMaskTiling( "Lava Mask Tiling", Float ) = 2
		_SpecularColor( "Specular Color", Color ) = ( 0, 0, 0, 0 )
		_Specular( "Specular", Range( 0.03, 1 ) ) = 0.03
		_Smoothness( "Smoothness", Range( 0, 1 ) ) = 0
		_SpecularBoost( "Specular Boost", Float ) = 0.03
		_LavaLow( "Lava Low", Color ) = ( 0, 0, 0, 0 )
		_LavaMid( "Lava Mid", Color ) = ( 0, 0, 0, 0 )
		_LavaHigh( "Lava High", Color ) = ( 0, 0, 0, 0 )
		_LavaFactorsX( "Lava Factors X", Range( 0, 1 ) ) = 0
		_LavaFactorsY( "Lava Factors Y", Range( 0, 1 ) ) = 0
		_LavaFactorsZ( "Lava Factors Z", Range( 0, 1 ) ) = 0
		_LavaDetail( "Lava Detail", Range( 0, 1 ) ) = 0
		_DetailExp( "Detail Exp", Float ) = 0
		_HeightDetail( "Height Detail", Float ) = 0
		_LavaMaskFactorsX( "Lava Mask Factors X", Float ) = 0
		_LavaMaskFactorsY( "Lava Mask Factors Y", Float ) = 0
		_LavaMaskPower( "Lava Mask Power", Float ) = 0
		_LavaMaskBoost( "Lava Mask Boost", Float ) = 0
		_LavaPasstrough( "Lava Passtrough", Range( 0, 0.1 ) ) = 0.02
		_MagmaColorMin( "Magma Color Min", Color ) = ( 0, 0, 0, 0 )
		_MagmaColorMax( "Magma Color Max", Color ) = ( 0, 0, 0, 0 )
		_MagmaPower( "Magma Power", Float ) = 0
		_MagmaBoost( "Magma Boost", Float ) = 0
		_MagmaGlow( "Magma Glow", Float ) = 0
		_FrenselMult( "Frensel Mult", Range( 0, 10 ) ) = 0
		_FresnelPower( "Fresnel Power", Range( 0, 10 ) ) = 0
		_FresnelColor( "Fresnel Color", Color ) = ( 0.4558824, 0.4558824, 0.4558824, 1 )
		_DistortionMap( "Distortion Map", 2D ) = "white" {}
		_DistortionUVTiling( "Distortion UV Tiling", Float ) = 0
		_DistortionUVSpeed( "Distortion UV Speed", Float ) = 0
		_DistortionTiling( "Distortion Tiling", Float ) = 0
		_DistortionSpeed( "Distortion Speed", Float ) = 0
		_DistortionFactor( "Distortion Factor", Range( -1, 1 ) ) = 0


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5

		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		//_InstancedTerrainNormals("Instanced Terrain Normals", Float) = 1.0

		[ToggleOff(_SPECULARHIGHLIGHTS_OFF)] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		//[ToggleUI] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		//[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1

		//[HideInInspector] _XRMotionVectorsPass("_XRMotionVectorsPass", Float) = 1
	}

	SubShader
	{
		LOD 0

		

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull Back
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#if ( SHADER_TARGET > 35 ) && defined( SHADER_API_GLES3 )
			#error For WebGL2/GLES3, please set your shader target to 3.5 via SubShader options. URP shaders in ASE use target 4.5 by default.
		#endif

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define ASE_GEOMETRY
			#define _SPECULAR_SETUP 1
			#define _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 170200


			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
            #pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_ATLAS
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _CLUSTER_LIGHT_LOOP

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile_fragment _ LIGHTMAP_BICUBIC_SAMPLING
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ USE_LEGACY_LIGHTMAPS

			#pragma vertex vert
			#pragma fragment frag

			#if defined( _SPECULAR_SETUP ) && defined( ASE_LIGHTING_SIMPLE )
				#if defined( _SPECULARHIGHLIGHTS_OFF )
					#undef _SPECULAR_COLOR
				#else
					#define _SPECULAR_COLOR
				#endif
			#endif

			#define SHADERPASS SHADERPASS_FORWARD

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Fog.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined( UNITY_INSTANCING_ENABLED ) && defined( ASE_INSTANCED_TERRAIN ) && ( defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL) || defined(_INSTANCEDTERRAINNORMALS_PIXEL) )
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					float4 texcoord1 : TEXCOORD1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					float4 texcoord2 : TEXCOORD2;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				half3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2; // holds terrainUV ifdef ENABLE_TERRAIN_PERPIXEL_NORMAL
				float4 lightmapUVOrVertexSH : TEXCOORD3;
				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					half4 fogFactorAndVertexLight : TEXCOORD4;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD5;
				#endif
				#if defined(USE_APV_PROBE_OCCLUSION)
					float4 probeOcclusion : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _NormalMap_ST;
			float4 _FresnelColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _SpecularColor;
			float _FrenselMult;
			float _LavaMaskBoost;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _DistortionUVTiling;
			float _LavaMaskPower;
			float _LavaMaskFactorsY;
			float _DistortionFactor;
			float _LavaMaskFactorsX;
			float _FresnelPower;
			float _LavaMaskTiling;
			float _MagmaTiling;
			float _MagmaPower;
			float _DistortionUVSpeed;
			float _MagmaBoost;
			float _LavaFactorsY;
			float _MagmaGlow;
			float _NormalTiling;
			float _NormalScale;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _Smoothness;
			float _LavaFactorsZ;
			float _ScatterCenterShift;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _ScatterStretch;
			float _LavaPasstrough;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _NormalMap;
			sampler2D _DetailMap;
			sampler2D _ScatterMap;
			sampler2D _HeightMap;
			sampler2D _DistortionMap;
			sampler2D _MagmaMap;


			inline float4 TriplanarSampling193( sampler2D topTexMap, const float4 topST, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			half3 ASEIndirectDiffuse( PackedVaryings input, half3 normalWS, float3 positionWS, half3 viewDirWS )
			{
			#if defined( DYNAMICLIGHTMAP_ON )
				return SAMPLE_GI( input.lightmapUVOrVertexSH.xy, input.dynamicLightmapUV.xy, 0, normalWS );
			#elif defined( LIGHTMAP_ON )
				return SAMPLE_GI( input.lightmapUVOrVertexSH.xy, 0, normalWS );
			#elif defined( PROBE_VOLUMES_L1 ) || defined( PROBE_VOLUMES_L2 )
				return SampleProbeVolumePixel( SampleSH( normalWS ), positionWS, normalWS, viewDirWS, input.positionCS.xy );
			#else
				return SampleSH( normalWS );
			#endif
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_texcoord7 = input.positionOS;
				output.ase_normal = input.normalOS;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif
				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS, input.tangentOS );

				OUTPUT_LIGHTMAP_UV(input.texcoord1, unity_LightmapST, output.lightmapUVOrVertexSH.xy);
				#if defined(DYNAMICLIGHTMAP_ON)
					output.dynamicLightmapUV.xy = input.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				OUTPUT_SH4(vertexInput.positionWS, normalInput.normalWS.xyz, GetWorldSpaceNormalizeViewDir(vertexInput.positionWS), output.lightmapUVOrVertexSH.xyz, output.probeOcclusion);

				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					output.fogFactorAndVertexLight = 0;
					#if defined(ASE_FOG) && !defined(_FOG_FRAGMENT)
						output.fogFactorAndVertexLight.x = ComputeFogFactor(vertexInput.positionCS.z);
					#endif
					#ifdef _ADDITIONAL_LIGHTS_VERTEX
						half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );
						output.fogFactorAndVertexLight.yzw = vertexLight;
					#endif
				#endif

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				output.normalWS = normalInput.normalWS;
				output.tangentWS = float4( normalInput.tangentWS, ( input.tangentOS.w > 0.0 ? 1.0 : -1.0 ) * GetOddNegativeScale() );

				#if defined( ENABLE_TERRAIN_PERPIXEL_NORMAL )
					output.tangentWS.zw = input.texcoord.xy;
					output.tangentWS.xy = input.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					float4 texcoord1 : TEXCOORD1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					float4 texcoord2 : TEXCOORD2;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.texcoord = input.texcoord;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					output.texcoord1 = input.texcoord1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					output.texcoord2 = input.texcoord2;
				#endif
				
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					output.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					output.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				#endif
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag ( PackedVaryings input
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out uint outRenderingLayers : SV_Target1
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				#if defined( _SURFACE_TYPE_TRANSPARENT )
					const bool isTransparent = true;
				#else
					const bool isTransparent = false;
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					float4 shadowCoord = TransformWorldToShadowCoord( input.positionWS );
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				// @diogo: mikktspace compliant
				float renormFactor = 1.0 / max( FLT_MIN, length( input.normalWS ) );

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				float3 ViewDirWS = GetWorldSpaceNormalizeViewDir( PositionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );
				float3 TangentWS = input.tangentWS.xyz * renormFactor;
				float3 BitangentWS = cross( input.normalWS, input.tangentWS.xyz ) * input.tangentWS.w * renormFactor;
				float3 NormalWS = input.normalWS * renormFactor;

				#if defined( ENABLE_TERRAIN_PERPIXEL_NORMAL )
					float2 sampleCoords = (input.tangentWS.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					NormalWS = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					TangentWS = -cross(GetObjectToWorldMatrix()._13_23_33, NormalWS);
					BitangentWS = cross(NormalWS, -TangentWS);
				#endif

				float3 temp_cast_0 = (0.0).xxx;
				
				float4 triplanar193 = TriplanarSampling193( _NormalMap, _NormalMap_ST, input.ase_texcoord7.xyz, input.ase_normal, 1.0, _NormalTiling, 1.0, 0 );
				float3 unpack195 = UnpackNormalScale( triplanar193, _NormalScale );
				unpack195.z = lerp( 1, unpack195.z, saturate(_NormalScale) );
				float3 normalUnpacked196 = unpack195;
				
				float3 tanToWorld0 = float3( TangentWS.x, BitangentWS.x, NormalWS.x );
				float3 tanToWorld1 = float3( TangentWS.y, BitangentWS.y, NormalWS.y );
				float3 tanToWorld2 = float3( TangentWS.z, BitangentWS.z, NormalWS.z );
				float3 tanNormal51_g139 = float3( 0, 0, 1 );
				float3 worldNormal51_g139 = float3( dot( tanToWorld0, tanNormal51_g139 ), dot( tanToWorld1, tanNormal51_g139 ), dot( tanToWorld2, tanNormal51_g139 ) );
				float4 appendResult63_g139 = (float4(worldNormal51_g139 , 0.0));
				float4 temp_output_57_0_g139 = mul( GetWorldToObjectMatrix(), appendResult63_g139 );
				float4 temp_cast_1 = (2.0).xxxx;
				float4 temp_output_4_0_g139 = pow( abs( temp_output_57_0_g139 ) , temp_cast_1 );
				float4 break6_g139 = temp_output_4_0_g139;
				float4 projNormal10_g139 = ( temp_output_4_0_g139 / ( break6_g139.x + break6_g139.y + break6_g139.z ) );
				float4 appendResult62_g139 = (float4(PositionWS , 1.0));
				float4 break26_g139 = mul( GetWorldToObjectMatrix(), appendResult62_g139 );
				float2 appendResult27_g139 = (float2(break26_g139.z , break26_g139.y));
				float4 nSign18_g139 = sign( temp_output_57_0_g139 );
				float4 break20_g139 = nSign18_g139;
				float2 appendResult21_g139 = (float2(break20_g139.x , 1.0));
				float temp_output_29_0_g139 = _DetailTiling;
				float2 temp_output_65_0_g139 = float2( 0,0 );
				float2 appendResult32_g139 = (float2(break26_g139.x , break26_g139.z));
				float2 appendResult22_g139 = (float2(break20_g139.y , 1.0));
				float2 appendResult34_g139 = (float2(break26_g139.x , break26_g139.y));
				float2 appendResult25_g139 = (float2(-break20_g139.z , 1.0));
				float4 break138 = saturate( ( ( projNormal10_g139.x * tex2D( _DetailMap, ( ( appendResult27_g139 * appendResult21_g139 * temp_output_29_0_g139 ) + temp_output_65_0_g139 ) ) ) + ( projNormal10_g139.y * tex2D( _DetailMap, ( ( temp_output_29_0_g139 * appendResult32_g139 * appendResult22_g139 ) + temp_output_65_0_g139 ) ) ) + ( projNormal10_g139.z * tex2D( _DetailMap, ( temp_output_65_0_g139 + ( temp_output_29_0_g139 * appendResult34_g139 * appendResult25_g139 ) ) ) ) ) );
				float detailTex146 = saturate( ( _DetailExp * pow( max( 0.0 , ( break138.r * break138.g ) ) , _DetailExp ) * 5000.0 ) );
				float4 temp_output_204_0 = saturate( ( detailTex146 * _Specular * _SpecularColor * _SpecularBoost ) );
				
				float temp_output_206_0 = ( ( 1.0 - detailTex146 ) * _Smoothness );
				
				float4 transform4_g120 = mul(GetObjectToWorldMatrix(),float4( input.ase_normal , 0.0 ));
				float4 normalizeResult6_g120 = normalize( transform4_g120 );
				float3 temp_output_1_0_g121 = normalizeResult6_g120.xyz;
				float3 normalizeResult7_g120 = normalize( _MainLightPosition.xyz );
				float dotResult4_g121 = dot( temp_output_1_0_g121 , normalizeResult7_g120 );
				float3 normalizeResult8_g120 = normalize( ViewDirWS );
				float dotResult7_g121 = dot( temp_output_1_0_g121 , normalizeResult8_g120 );
				float2 appendResult10_g121 = (float2(( ( dotResult4_g121 / 2.0 ) + 0.5 ) , dotResult7_g121));
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b ) + 1e-7;
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 temp_output_43_0_g131 = temp_output_204_0;
				float3 normalizeResult4_g132 = normalize( ( ViewDirWS + _MainLightPosition.xyz ) );
				float3 tanNormal12_g131 = normalUnpacked196;
				float3 worldNormal12_g131 = float3( dot( tanToWorld0, tanNormal12_g131 ), dot( tanToWorld1, tanNormal12_g131 ), dot( tanToWorld2, tanNormal12_g131 ) );
				float3 normalizeResult64_g131 = normalize( worldNormal12_g131 );
				float dotResult19_g131 = dot( normalizeResult4_g132 , normalizeResult64_g131 );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoord );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_output_40_0_g131 = ( ase_lightColor * ase_lightAtten );
				float dotResult14_g131 = dot( normalizeResult64_g131 , _MainLightPosition.xyz );
				float3 bakedGI34_g131 = ASEIndirectDiffuse( input, normalizeResult64_g131, PositionWS, ViewDirWS );
				MixRealtimeAndBakedGI( ase_mainLight, normalizeResult64_g131, bakedGI34_g131, half4( 0, 0, 0, 0 ) );
				float3 tanNormal51_g140 = float3( 0, 0, 1 );
				float3 worldNormal51_g140 = float3( dot( tanToWorld0, tanNormal51_g140 ), dot( tanToWorld1, tanNormal51_g140 ), dot( tanToWorld2, tanNormal51_g140 ) );
				float4 appendResult63_g140 = (float4(worldNormal51_g140 , 0.0));
				float4 temp_output_57_0_g140 = mul( GetWorldToObjectMatrix(), appendResult63_g140 );
				float4 temp_cast_9 = (2.0).xxxx;
				float4 temp_output_4_0_g140 = pow( abs( temp_output_57_0_g140 ) , temp_cast_9 );
				float4 break6_g140 = temp_output_4_0_g140;
				float4 projNormal10_g140 = ( temp_output_4_0_g140 / ( break6_g140.x + break6_g140.y + break6_g140.z ) );
				float4 appendResult62_g140 = (float4(PositionWS , 1.0));
				float4 break26_g140 = mul( GetWorldToObjectMatrix(), appendResult62_g140 );
				float2 appendResult27_g140 = (float2(break26_g140.z , break26_g140.y));
				float4 nSign18_g140 = sign( temp_output_57_0_g140 );
				float4 break20_g140 = nSign18_g140;
				float2 appendResult21_g140 = (float2(break20_g140.x , 1.0));
				float temp_output_29_0_g140 = _HeightTiling;
				float2 temp_output_65_0_g140 = float2( 0,0 );
				float2 appendResult32_g140 = (float2(break26_g140.x , break26_g140.z));
				float2 appendResult22_g140 = (float2(break20_g140.y , 1.0));
				float2 appendResult34_g140 = (float2(break26_g140.x , break26_g140.y));
				float2 appendResult25_g140 = (float2(-break20_g140.z , 1.0));
				float detaledHeight167 = saturate( ( detailTex146 * saturate( ( saturate( ( ( projNormal10_g140.x * tex2D( _HeightMap, ( ( appendResult27_g140 * appendResult21_g140 * temp_output_29_0_g140 ) + temp_output_65_0_g140 ) ) ) + ( projNormal10_g140.y * tex2D( _HeightMap, ( ( temp_output_29_0_g140 * appendResult32_g140 * appendResult22_g140 ) + temp_output_65_0_g140 ) ) ) + ( projNormal10_g140.z * tex2D( _HeightMap, ( temp_output_65_0_g140 + ( temp_output_29_0_g140 * appendResult34_g140 * appendResult25_g140 ) ) ) ) ) ).r * _HeightDetail ) ) ) );
				float temp_output_2_0_g119 = saturate( ( _LavaFactorsX - _LavaDetail ) );
				float detaledHeight01178 = saturate( saturate( ( ( detaledHeight167 - temp_output_2_0_g119 ) / ( saturate( ( _LavaFactorsY - _LavaDetail ) ) - temp_output_2_0_g119 ) ) ) );
				float temp_output_6_0_g133 = ( detaledHeight01178 / _LavaFactorsZ );
				float3 lerpResult8_g133 = lerp( _LavaLow.rgb , _LavaMid.rgb , saturate( temp_output_6_0_g133 ));
				float3 lerpResult12_g133 = lerp( lerpResult8_g133 , _LavaHigh.rgb , saturate( ( temp_output_6_0_g133 - 1.0 ) ));
				float3 temp_output_179_0 = lerpResult12_g133;
				float4 temp_output_42_0_g131 = float4( temp_output_179_0 , 0.0 );
				float4 baseColor213 = ( ( float4( (temp_output_43_0_g131).rgb , 0.0 ) * (temp_output_43_0_g131).a * pow( max( dotResult19_g131 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g131 ) + ( ( ( temp_output_40_0_g131 * max( dotResult14_g131 , 0.0 ) ) + float4( bakedGI34_g131 , 0.0 ) ) * float4( (temp_output_42_0_g131).rgb , 0.0 ) ) );
				float4 temp_output_43_0_g137 = _SpecularColor;
				float3 normalizeResult4_g138 = normalize( ( ViewDirWS + _MainLightPosition.xyz ) );
				float3 tanNormal12_g137 = normalUnpacked196;
				float3 worldNormal12_g137 = float3( dot( tanToWorld0, tanNormal12_g137 ), dot( tanToWorld1, tanNormal12_g137 ), dot( tanToWorld2, tanNormal12_g137 ) );
				float3 normalizeResult64_g137 = normalize( worldNormal12_g137 );
				float dotResult19_g137 = dot( normalizeResult4_g138 , normalizeResult64_g137 );
				float4 temp_output_40_0_g137 = ( ase_lightColor * ase_lightAtten );
				float dotResult14_g137 = dot( normalizeResult64_g137 , _MainLightPosition.xyz );
				float3 bakedGI34_g137 = ASEIndirectDiffuse( input, normalizeResult64_g137, PositionWS, ViewDirWS );
				MixRealtimeAndBakedGI( ase_mainLight, normalizeResult64_g137, bakedGI34_g137, half4( 0, 0, 0, 0 ) );
				float4 temp_cast_15 = (1.0).xxxx;
				float4 temp_output_42_0_g137 = temp_cast_15;
				float4 temp_output_306_0 = ( ( float4( (temp_output_43_0_g137).rgb , 0.0 ) * (temp_output_43_0_g137).a * pow( max( dotResult19_g137 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g137 ) + ( ( ( temp_output_40_0_g137 * max( dotResult14_g137 , 0.0 ) ) + float4( bakedGI34_g137 , 0.0 ) ) * float4( (temp_output_42_0_g137).rgb , 0.0 ) ) );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - PositionWS ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - PositionWS ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - PositionWS ).z;
				float3 ase_viewDirTS = normalize( ase_viewVectorTS );
				float3 normalizeResult5_g127 = normalize( normalUnpacked196 );
				float dotResult14_g127 = dot( ase_viewDirTS , normalizeResult5_g127 );
				float detailX235 = break138.r;
				float4 fresnel268 = saturate( ( ( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - dotResult14_g127 ) ) ) , _FresnelPower ) ) * _FrenselMult ) * _FresnelColor ) * detailX235 ) );
				float3 tanNormal51_g129 = float3( 0, 0, 1 );
				float3 worldNormal51_g129 = float3( dot( tanToWorld0, tanNormal51_g129 ), dot( tanToWorld1, tanNormal51_g129 ), dot( tanToWorld2, tanNormal51_g129 ) );
				float4 appendResult63_g129 = (float4(worldNormal51_g129 , 0.0));
				float4 temp_output_57_0_g129 = mul( GetWorldToObjectMatrix(), appendResult63_g129 );
				float4 temp_cast_17 = (5.0).xxxx;
				float4 temp_output_4_0_g129 = pow( abs( temp_output_57_0_g129 ) , temp_cast_17 );
				float4 break6_g129 = temp_output_4_0_g129;
				float4 projNormal10_g129 = ( temp_output_4_0_g129 / ( break6_g129.x + break6_g129.y + break6_g129.z ) );
				float4 appendResult62_g129 = (float4(PositionWS , 1.0));
				float4 break26_g129 = mul( GetWorldToObjectMatrix(), appendResult62_g129 );
				float2 appendResult27_g129 = (float2(break26_g129.z , break26_g129.y));
				float4 nSign18_g129 = sign( temp_output_57_0_g129 );
				float4 break20_g129 = nSign18_g129;
				float2 appendResult21_g129 = (float2(break20_g129.x , 1.0));
				float temp_output_29_0_g129 = _DistortionTiling;
				float temp_output_10_0_g128 = ( _TimeParameters.x * _DistortionSpeed );
				float2 appendResult12_g128 = (float2(temp_output_10_0_g128 , temp_output_10_0_g128));
				float3 tanNormal51_g130 = float3( 0, 0, 1 );
				float3 worldNormal51_g130 = float3( dot( tanToWorld0, tanNormal51_g130 ), dot( tanToWorld1, tanNormal51_g130 ), dot( tanToWorld2, tanNormal51_g130 ) );
				float4 appendResult63_g130 = (float4(worldNormal51_g130 , 0.0));
				float4 temp_output_57_0_g130 = mul( GetWorldToObjectMatrix(), appendResult63_g130 );
				float4 temp_cast_18 = (5.0).xxxx;
				float4 temp_output_4_0_g130 = pow( abs( temp_output_57_0_g130 ) , temp_cast_18 );
				float4 break6_g130 = temp_output_4_0_g130;
				float4 projNormal10_g130 = ( temp_output_4_0_g130 / ( break6_g130.x + break6_g130.y + break6_g130.z ) );
				float4 appendResult62_g130 = (float4(PositionWS , 1.0));
				float4 break26_g130 = mul( GetWorldToObjectMatrix(), appendResult62_g130 );
				float2 appendResult27_g130 = (float2(break26_g130.z , break26_g130.y));
				float4 nSign18_g130 = sign( temp_output_57_0_g130 );
				float4 break20_g130 = nSign18_g130;
				float2 appendResult21_g130 = (float2(break20_g130.x , 1.0));
				float temp_output_29_0_g130 = _DistortionUVTiling;
				float temp_output_2_0_g128 = ( _TimeParameters.x * _DistortionUVSpeed );
				float2 appendResult5_g128 = (float2(temp_output_2_0_g128 , temp_output_2_0_g128));
				float2 temp_output_65_0_g130 = appendResult5_g128;
				float2 appendResult32_g130 = (float2(break26_g130.x , break26_g130.z));
				float2 appendResult22_g130 = (float2(break20_g130.y , 1.0));
				float2 appendResult34_g130 = (float2(break26_g130.x , break26_g130.y));
				float2 appendResult25_g130 = (float2(-break20_g130.z , 1.0));
				float4 break11_g128 = ( saturate( ( ( projNormal10_g130.x * tex2D( _DistortionMap, ( ( appendResult27_g130 * appendResult21_g130 * temp_output_29_0_g130 ) + temp_output_65_0_g130 ) ) ) + ( projNormal10_g130.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g130 * appendResult32_g130 * appendResult22_g130 ) + temp_output_65_0_g130 ) ) ) + ( projNormal10_g130.z * tex2D( _DistortionMap, ( temp_output_65_0_g130 + ( temp_output_29_0_g130 * appendResult34_g130 * appendResult25_g130 ) ) ) ) ) ) * _DistortionFactor );
				float2 appendResult13_g128 = (float2(break11_g128.r , break11_g128.g));
				float2 temp_output_65_0_g129 = ( appendResult12_g128 + appendResult13_g128 );
				float2 appendResult32_g129 = (float2(break26_g129.x , break26_g129.z));
				float2 appendResult22_g129 = (float2(break20_g129.y , 1.0));
				float2 appendResult34_g129 = (float2(break26_g129.x , break26_g129.y));
				float2 appendResult25_g129 = (float2(-break20_g129.z , 1.0));
				float3 tanNormal51_g142 = float3( 0, 0, 1 );
				float3 worldNormal51_g142 = float3( dot( tanToWorld0, tanNormal51_g142 ), dot( tanToWorld1, tanNormal51_g142 ), dot( tanToWorld2, tanNormal51_g142 ) );
				float4 appendResult63_g142 = (float4(worldNormal51_g142 , 0.0));
				float4 temp_output_57_0_g142 = mul( GetWorldToObjectMatrix(), appendResult63_g142 );
				float4 temp_cast_19 = (2.0).xxxx;
				float4 temp_output_4_0_g142 = pow( abs( temp_output_57_0_g142 ) , temp_cast_19 );
				float4 break6_g142 = temp_output_4_0_g142;
				float4 projNormal10_g142 = ( temp_output_4_0_g142 / ( break6_g142.x + break6_g142.y + break6_g142.z ) );
				float4 appendResult62_g142 = (float4(PositionWS , 1.0));
				float4 break26_g142 = mul( GetWorldToObjectMatrix(), appendResult62_g142 );
				float2 appendResult27_g142 = (float2(break26_g142.z , break26_g142.y));
				float4 nSign18_g142 = sign( temp_output_57_0_g142 );
				float4 break20_g142 = nSign18_g142;
				float2 appendResult21_g142 = (float2(break20_g142.x , 1.0));
				float temp_output_29_0_g142 = _MagmaTiling;
				float2 temp_output_65_0_g142 = float2( 0,0 );
				float2 appendResult32_g142 = (float2(break26_g142.x , break26_g142.z));
				float2 appendResult22_g142 = (float2(break20_g142.y , 1.0));
				float2 appendResult34_g142 = (float2(break26_g142.x , break26_g142.y));
				float2 appendResult25_g142 = (float2(-break20_g142.z , 1.0));
				float4 temp_output_214_0 = saturate( ( ( projNormal10_g142.x * tex2D( _MagmaMap, ( ( appendResult27_g142 * appendResult21_g142 * temp_output_29_0_g142 ) + temp_output_65_0_g142 ) ) ) + ( projNormal10_g142.y * tex2D( _MagmaMap, ( ( temp_output_29_0_g142 * appendResult32_g142 * appendResult22_g142 ) + temp_output_65_0_g142 ) ) ) + ( projNormal10_g142.z * tex2D( _MagmaMap, ( temp_output_65_0_g142 + ( temp_output_29_0_g142 * appendResult34_g142 * appendResult25_g142 ) ) ) ) ) );
				float4 temp_cast_20 = (_MagmaPower).xxxx;
				float4 magmaDetial234 = saturate( ( saturate( pow( max( float4( 0,0,0,0 ) , temp_output_214_0 ) , temp_cast_20 ) ) * _MagmaBoost * temp_output_214_0 ) );
				float3 tanNormal51_g141 = float3( 0, 0, 1 );
				float3 worldNormal51_g141 = float3( dot( tanToWorld0, tanNormal51_g141 ), dot( tanToWorld1, tanNormal51_g141 ), dot( tanToWorld2, tanNormal51_g141 ) );
				float4 appendResult63_g141 = (float4(worldNormal51_g141 , 0.0));
				float4 temp_output_57_0_g141 = mul( GetWorldToObjectMatrix(), appendResult63_g141 );
				float4 temp_cast_21 = (2.0).xxxx;
				float4 temp_output_4_0_g141 = pow( abs( temp_output_57_0_g141 ) , temp_cast_21 );
				float4 break6_g141 = temp_output_4_0_g141;
				float4 projNormal10_g141 = ( temp_output_4_0_g141 / ( break6_g141.x + break6_g141.y + break6_g141.z ) );
				float4 appendResult62_g141 = (float4(PositionWS , 1.0));
				float4 break26_g141 = mul( GetWorldToObjectMatrix(), appendResult62_g141 );
				float2 appendResult27_g141 = (float2(break26_g141.z , break26_g141.y));
				float4 nSign18_g141 = sign( temp_output_57_0_g141 );
				float4 break20_g141 = nSign18_g141;
				float2 appendResult21_g141 = (float2(break20_g141.x , 1.0));
				float temp_output_29_0_g141 = _LavaMaskTiling;
				float2 temp_output_65_0_g141 = float2( 0,0 );
				float2 appendResult32_g141 = (float2(break26_g141.x , break26_g141.z));
				float2 appendResult22_g141 = (float2(break20_g141.y , 1.0));
				float2 appendResult34_g141 = (float2(break26_g141.x , break26_g141.y));
				float2 appendResult25_g141 = (float2(-break20_g141.z , 1.0));
				float lavaMaskMap229 = saturate( ( ( projNormal10_g141.x * tex2D( _HeightMap, ( ( appendResult27_g141 * appendResult21_g141 * temp_output_29_0_g141 ) + temp_output_65_0_g141 ) ) ) + ( projNormal10_g141.y * tex2D( _HeightMap, ( ( temp_output_29_0_g141 * appendResult32_g141 * appendResult22_g141 ) + temp_output_65_0_g141 ) ) ) + ( projNormal10_g141.z * tex2D( _HeightMap, ( temp_output_65_0_g141 + ( temp_output_29_0_g141 * appendResult34_g141 * appendResult25_g141 ) ) ) ) ) ).r;
				float dotResult254 = dot( ase_viewDirTS , normalUnpacked196 );
				float lavaMask272 = saturate( ( magmaDetial234.r + ( saturate( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - lavaMaskMap229 ) ) ) , _LavaMaskFactorsX ) ) * _LavaMaskFactorsY ) ) * saturate( ( saturate( pow( max( 0.0 , dotResult254 ) , _LavaMaskPower ) ) * _LavaMaskBoost ) ) ) ) );
				float4 lerpResult274 = lerp( _MagmaColorMin , _MagmaColorMax , lavaMask272);
				float4 lavaColor277 = ( saturate( ( ( projNormal10_g129.x * tex2D( _DistortionMap, ( ( appendResult27_g129 * appendResult21_g129 * temp_output_29_0_g129 ) + temp_output_65_0_g129 ) ) ) + ( projNormal10_g129.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g129 * appendResult32_g129 * appendResult22_g129 ) + temp_output_65_0_g129 ) ) ) + ( projNormal10_g129.z * tex2D( _DistortionMap, ( temp_output_65_0_g129 + ( temp_output_29_0_g129 * appendResult34_g129 * appendResult25_g129 ) ) ) ) ) ) * lerpResult274 * _MagmaGlow );
				

				float3 BaseColor = temp_cast_0;
				float3 Normal = normalUnpacked196;
				float3 Specular = temp_output_204_0.rgb;
				float Metallic = 0;
				float Smoothness = temp_output_206_0;
				float Occlusion = 1;
				float3 Emission = ( saturate( ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g121 ) * _ScatterStretch ) ) * _ScatterColor * ase_lightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( baseColor213 + ( temp_output_306_0 * fresnel268 ) ) ) ) + ( ( lavaColor277 * lavaMask272 ) * saturate( ( _LavaPasstrough + temp_output_306_0 ) ) ) ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = ClipPos.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#if defined( _ALPHATEST_ON )
					AlphaDiscard( Alpha, AlphaClipThreshold );
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_CHANGES_WORLD_POS)
					ShadowCoord = TransformWorldToShadowCoord( PositionWS );
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = PositionWS;
				inputData.positionCS = float4( input.positionCS.xy, ClipPos.zw / ClipPos.w );
				inputData.normalizedScreenSpaceUV = ScreenPosNorm.xy;
				inputData.viewDirectionWS = ViewDirWS;
				inputData.shadowCoord = ShadowCoord;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(TangentWS, BitangentWS, NormalWS));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = NormalWS;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = InitializeInputDataFog(float4(inputData.positionWS, 1.0), input.fogFactorAndVertexLight.x);
				#endif
				#ifdef _ADDITIONAL_LIGHTS_VERTEX
					inputData.vertexLighting = input.fogFactorAndVertexLight.yzw;
				#endif

				#if defined( ENABLE_TERRAIN_PERPIXEL_NORMAL )
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = input.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(input.lightmapUVOrVertexSH.xy, input.dynamicLightmapUV.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.lightmapUVOrVertexSH.xy);
				#elif !defined(LIGHTMAP_ON) && (defined(PROBE_VOLUMES_L1) || defined(PROBE_VOLUMES_L2))
					inputData.bakedGI = SAMPLE_GI( SH, GetAbsolutePositionWS(inputData.positionWS),
						inputData.normalWS,
						inputData.viewDirectionWS,
						input.positionCS.xy,
						input.probeOcclusion,
						inputData.shadowMask );
				#else
					inputData.bakedGI = SAMPLE_GI(input.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.lightmapUVOrVertexSH.xy);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = input.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = input.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
					#if defined(USE_APV_PROBE_OCCLUSION)
						inputData.probeOcclusion = input.probeOcclusion;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToSurfaceData(input.positionCS, surfaceData, inputData);
				#endif

				#ifdef ASE_LIGHTING_SIMPLE
					half4 color = UniversalFragmentBlinnPhong( inputData, surfaceData);
				#else
					half4 color = UniversalFragmentPBR( inputData, surfaceData);
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_CLUSTER_LIGHT_LOOP
							[loop] for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								CLUSTER_LIGHT_LOOP_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_CLUSTER_LIGHT_LOOP
							[loop] for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								CLUSTER_LIGHT_LOOP_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( NormalWS,0 ) ).xyz * ( 1.0 - dot( NormalWS, ViewDirWS ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3(0,0,0), inputData.fogCoord);
					#else
						color.rgb = MixFog(color.rgb, inputData.fogCoord);
					#endif
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					outRenderingLayers = EncodeMeshRenderingLayer();
				#endif

				#if defined( ASE_OPAQUE_KEEP_ALPHA )
					return half4( color.rgb, color.a );
				#else
					return half4( color.rgb, OutputAlpha( color.a, isTransparent ) );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define ASE_GEOMETRY
			#define _SPECULAR_SETUP 1
			#define _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 170200


			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#pragma vertex vert
			#pragma fragment frag

			#if defined( _SPECULAR_SETUP ) && defined( ASE_LIGHTING_SIMPLE )
				#if defined( _SPECULARHIGHLIGHTS_OFF )
					#undef _SPECULAR_COLOR
				#else
					#define _SPECULAR_COLOR
				#endif
			#endif

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _NormalMap_ST;
			float4 _FresnelColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _SpecularColor;
			float _FrenselMult;
			float _LavaMaskBoost;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _DistortionUVTiling;
			float _LavaMaskPower;
			float _LavaMaskFactorsY;
			float _DistortionFactor;
			float _LavaMaskFactorsX;
			float _FresnelPower;
			float _LavaMaskTiling;
			float _MagmaTiling;
			float _MagmaPower;
			float _DistortionUVSpeed;
			float _MagmaBoost;
			float _LavaFactorsY;
			float _MagmaGlow;
			float _NormalTiling;
			float _NormalScale;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _Smoothness;
			float _LavaFactorsZ;
			float _ScatterCenterShift;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _ScatterStretch;
			float _LavaPasstrough;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			float3 _LightDirection;
			float3 _LightPosition;

			
			PackedVaryings VertexFunction( Attributes input )
			{
				PackedVaryings output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				float3 positionWS = TransformObjectToWorld( input.positionOS.xyz );
				float3 normalWS = TransformObjectToWorldDir(input.normalOS);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				//code for UNITY_REVERSED_Z is moved into Shadows.hlsl from 6000.0.22 and or higher
				positionCS = ApplyShadowClamping(positionCS);

				output.positionCS = positionCS;
				output.positionWS = positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(	PackedVaryings input
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord = TransformWorldToShadowCoord(input.positionWS);
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( input.positionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#if defined( _ALPHATEST_ON )
					#if defined( _ALPHATEST_SHADOW_ON )
						AlphaDiscard( Alpha, AlphaClipThresholdShadow );
					#else
						AlphaDiscard( Alpha, AlphaClipThreshold );
					#endif
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define ASE_GEOMETRY
			#define _SPECULAR_SETUP 1
			#define _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 170200


			#pragma vertex vert
			#pragma fragment frag

			#if defined( _SPECULAR_SETUP ) && defined( ASE_LIGHTING_SIMPLE )
				#if defined( _SPECULARHIGHLIGHTS_OFF )
					#undef _SPECULAR_COLOR
				#else
					#define _SPECULAR_COLOR
				#endif
			#endif

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _NormalMap_ST;
			float4 _FresnelColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _SpecularColor;
			float _FrenselMult;
			float _LavaMaskBoost;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _DistortionUVTiling;
			float _LavaMaskPower;
			float _LavaMaskFactorsY;
			float _DistortionFactor;
			float _LavaMaskFactorsX;
			float _FresnelPower;
			float _LavaMaskTiling;
			float _MagmaTiling;
			float _MagmaPower;
			float _DistortionUVSpeed;
			float _MagmaBoost;
			float _LavaFactorsY;
			float _MagmaGlow;
			float _NormalTiling;
			float _NormalScale;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _Smoothness;
			float _LavaFactorsZ;
			float _ScatterCenterShift;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _ScatterStretch;
			float _LavaPasstrough;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(	PackedVaryings input
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord = TransformWorldToShadowCoord(input.positionWS);
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( input.positionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#if defined( _ALPHATEST_ON )
					AlphaDiscard( Alpha, AlphaClipThreshold );
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define ASE_GEOMETRY
			#define _SPECULAR_SETUP 1
			#define _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 170200

			#pragma shader_feature EDITOR_VISUALIZATION

			#pragma vertex vert
			#pragma fragment frag

			#if defined( _SPECULAR_SETUP ) && defined( ASE_LIGHTING_SIMPLE )
				#if defined( _SPECULARHIGHLIGHTS_OFF )
					#undef _SPECULAR_COLOR
				#else
					#define _SPECULAR_COLOR
				#endif
			#endif

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ LIGHTMAP_BICUBIC_SAMPLING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_ATLAS
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON


			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD1;
					float4 LightCoord : TEXCOORD2;
				#endif
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 lightmapUVOrVertexSH : TEXCOORD7;
				float4 dynamicLightmapUV : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _NormalMap_ST;
			float4 _FresnelColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _SpecularColor;
			float _FrenselMult;
			float _LavaMaskBoost;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _DistortionUVTiling;
			float _LavaMaskPower;
			float _LavaMaskFactorsY;
			float _DistortionFactor;
			float _LavaMaskFactorsX;
			float _FresnelPower;
			float _LavaMaskTiling;
			float _MagmaTiling;
			float _MagmaPower;
			float _DistortionUVSpeed;
			float _MagmaBoost;
			float _LavaFactorsY;
			float _MagmaGlow;
			float _NormalTiling;
			float _NormalScale;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _Smoothness;
			float _LavaFactorsZ;
			float _ScatterCenterShift;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _ScatterStretch;
			float _LavaPasstrough;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _ScatterMap;
			sampler2D _DetailMap;
			sampler2D _NormalMap;
			sampler2D _HeightMap;
			sampler2D _DistortionMap;
			sampler2D _MagmaMap;


			inline float4 TriplanarSampling193( sampler2D topTexMap, const float4 topST, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			half3 ASEIndirectDiffuse( PackedVaryings input, half3 normalWS, float3 positionWS, half3 viewDirWS )
			{
			#if defined( DYNAMICLIGHTMAP_ON )
				return SAMPLE_GI( input.lightmapUVOrVertexSH.xy, input.dynamicLightmapUV.xy, 0, normalWS );
			#elif defined( LIGHTMAP_ON )
				return SAMPLE_GI( input.lightmapUVOrVertexSH.xy, 0, normalWS );
			#elif defined( PROBE_VOLUMES_L1 ) || defined( PROBE_VOLUMES_L2 )
				return SampleProbeVolumePixel( SampleSH( normalWS ), positionWS, normalWS, viewDirWS, input.positionCS.xy );
			#else
				return SampleSH( normalWS );
			#endif
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 ase_tangentWS = TransformObjectToWorldDir( input.tangentOS.xyz );
				output.ase_texcoord3.xyz = ase_tangentWS;
				float3 ase_normalWS = TransformObjectToWorldNormal( input.normalOS );
				output.ase_texcoord4.xyz = ase_normalWS;
				float ase_tangentSign = input.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
				output.ase_texcoord5.xyz = ase_bitangentWS;
				OUTPUT_LIGHTMAP_UV( input.texcoord1, unity_LightmapST, output.lightmapUVOrVertexSH.xy );
				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				#if !defined( OUTPUT_SH4 )
				OUTPUT_SH( ase_positionWS, ase_normalWS, GetWorldSpaceNormalizeViewDir( ase_positionWS ), output.lightmapUVOrVertexSH.xyz );
				#elif UNITY_VERSION > 60000009
				OUTPUT_SH4( ase_positionWS, ase_normalWS, GetWorldSpaceNormalizeViewDir( ase_positionWS ), output.lightmapUVOrVertexSH.xyz, output.probeOcclusion );
				#else
				OUTPUT_SH4( ase_positionWS, ase_normalWS, GetWorldSpaceNormalizeViewDir( ase_positionWS ), output.lightmapUVOrVertexSH.xyz );
				#endif
				#if defined( DYNAMICLIGHTMAP_ON )
				output.dynamicLightmapUV.xy = input.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				OUTPUT_LIGHTMAP_UV( input.texcoord1, unity_LightmapST, output.lightmapUVOrVertexSH.xy );
				#if !defined( OUTPUT_SH4 )
				OUTPUT_SH( ase_positionWS, ase_normalWS, GetWorldSpaceNormalizeViewDir( ase_positionWS ), output.lightmapUVOrVertexSH.xyz );
				#elif UNITY_VERSION > 60000009
				OUTPUT_SH4( ase_positionWS, ase_normalWS, GetWorldSpaceNormalizeViewDir( ase_positionWS ), output.lightmapUVOrVertexSH.xyz, output.probeOcclusion );
				#else
				OUTPUT_SH4( ase_positionWS, ase_normalWS, GetWorldSpaceNormalizeViewDir( ase_positionWS ), output.lightmapUVOrVertexSH.xyz );
				#endif
				#if defined( DYNAMICLIGHTMAP_ON )
				output.dynamicLightmapUV.xy = input.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				
				output.ase_normal = input.normalOS;
				output.ase_texcoord6 = input.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.w = 0;
				output.ase_texcoord4.w = 0;
				output.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(input.positionOS.xyz, input.texcoord.xy, input.texcoord1.xy, input.texcoord2.xy, VizUV, LightCoord);
					output.VizUV = float4(VizUV, 0, 0);
					output.LightCoord = LightCoord;
				#endif

				output.positionCS = MetaVertexPosition( input.positionOS, input.texcoord1.xy, input.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				output.positionWS = TransformObjectToWorld( input.positionOS.xyz );
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.texcoord = input.texcoord;
				output.texcoord1 = input.texcoord1;
				output.texcoord2 = input.texcoord2;
				
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				output.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				output.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord = TransformWorldToShadowCoord(input.positionWS);
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( input.positionWS );
				float4 ShadowCoord = shadowCoord;

				float3 temp_cast_0 = (0.0).xxx;
				
				float4 transform4_g120 = mul(GetObjectToWorldMatrix(),float4( input.ase_normal , 0.0 ));
				float4 normalizeResult6_g120 = normalize( transform4_g120 );
				float3 temp_output_1_0_g121 = normalizeResult6_g120.xyz;
				float3 normalizeResult7_g120 = normalize( _MainLightPosition.xyz );
				float dotResult4_g121 = dot( temp_output_1_0_g121 , normalizeResult7_g120 );
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - PositionWS );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				float3 normalizeResult8_g120 = normalize( ase_viewDirWS );
				float dotResult7_g121 = dot( temp_output_1_0_g121 , normalizeResult8_g120 );
				float2 appendResult10_g121 = (float2(( ( dotResult4_g121 / 2.0 ) + 0.5 ) , dotResult7_g121));
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b ) + 1e-7;
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float3 ase_tangentWS = input.ase_texcoord3.xyz;
				float3 ase_normalWS = input.ase_texcoord4.xyz;
				float3 ase_bitangentWS = input.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, ase_normalWS.x );
				float3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, ase_normalWS.y );
				float3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, ase_normalWS.z );
				float3 tanNormal51_g139 = float3( 0, 0, 1 );
				float3 worldNormal51_g139 = float3( dot( tanToWorld0, tanNormal51_g139 ), dot( tanToWorld1, tanNormal51_g139 ), dot( tanToWorld2, tanNormal51_g139 ) );
				float4 appendResult63_g139 = (float4(worldNormal51_g139 , 0.0));
				float4 temp_output_57_0_g139 = mul( GetWorldToObjectMatrix(), appendResult63_g139 );
				float4 temp_cast_3 = (2.0).xxxx;
				float4 temp_output_4_0_g139 = pow( abs( temp_output_57_0_g139 ) , temp_cast_3 );
				float4 break6_g139 = temp_output_4_0_g139;
				float4 projNormal10_g139 = ( temp_output_4_0_g139 / ( break6_g139.x + break6_g139.y + break6_g139.z ) );
				float4 appendResult62_g139 = (float4(PositionWS , 1.0));
				float4 break26_g139 = mul( GetWorldToObjectMatrix(), appendResult62_g139 );
				float2 appendResult27_g139 = (float2(break26_g139.z , break26_g139.y));
				float4 nSign18_g139 = sign( temp_output_57_0_g139 );
				float4 break20_g139 = nSign18_g139;
				float2 appendResult21_g139 = (float2(break20_g139.x , 1.0));
				float temp_output_29_0_g139 = _DetailTiling;
				float2 temp_output_65_0_g139 = float2( 0,0 );
				float2 appendResult32_g139 = (float2(break26_g139.x , break26_g139.z));
				float2 appendResult22_g139 = (float2(break20_g139.y , 1.0));
				float2 appendResult34_g139 = (float2(break26_g139.x , break26_g139.y));
				float2 appendResult25_g139 = (float2(-break20_g139.z , 1.0));
				float4 break138 = saturate( ( ( projNormal10_g139.x * tex2D( _DetailMap, ( ( appendResult27_g139 * appendResult21_g139 * temp_output_29_0_g139 ) + temp_output_65_0_g139 ) ) ) + ( projNormal10_g139.y * tex2D( _DetailMap, ( ( temp_output_29_0_g139 * appendResult32_g139 * appendResult22_g139 ) + temp_output_65_0_g139 ) ) ) + ( projNormal10_g139.z * tex2D( _DetailMap, ( temp_output_65_0_g139 + ( temp_output_29_0_g139 * appendResult34_g139 * appendResult25_g139 ) ) ) ) ) );
				float detailTex146 = saturate( ( _DetailExp * pow( max( 0.0 , ( break138.r * break138.g ) ) , _DetailExp ) * 5000.0 ) );
				float4 temp_output_204_0 = saturate( ( detailTex146 * _Specular * _SpecularColor * _SpecularBoost ) );
				float4 temp_output_43_0_g131 = temp_output_204_0;
				float3 normalizeResult4_g132 = normalize( ( ase_viewDirWS + _MainLightPosition.xyz ) );
				float4 triplanar193 = TriplanarSampling193( _NormalMap, _NormalMap_ST, input.ase_texcoord6.xyz, input.ase_normal, 1.0, _NormalTiling, 1.0, 0 );
				float3 unpack195 = UnpackNormalScale( triplanar193, _NormalScale );
				unpack195.z = lerp( 1, unpack195.z, saturate(_NormalScale) );
				float3 normalUnpacked196 = unpack195;
				float3 tanNormal12_g131 = normalUnpacked196;
				float3 worldNormal12_g131 = float3( dot( tanToWorld0, tanNormal12_g131 ), dot( tanToWorld1, tanNormal12_g131 ), dot( tanToWorld2, tanNormal12_g131 ) );
				float3 normalizeResult64_g131 = normalize( worldNormal12_g131 );
				float dotResult19_g131 = dot( normalizeResult4_g132 , normalizeResult64_g131 );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoord );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_output_40_0_g131 = ( ase_lightColor * ase_lightAtten );
				float dotResult14_g131 = dot( normalizeResult64_g131 , _MainLightPosition.xyz );
				float3 bakedGI34_g131 = ASEIndirectDiffuse( input, normalizeResult64_g131, PositionWS, ase_viewDirWS );
				MixRealtimeAndBakedGI( ase_mainLight, normalizeResult64_g131, bakedGI34_g131, half4( 0, 0, 0, 0 ) );
				float3 tanNormal51_g140 = float3( 0, 0, 1 );
				float3 worldNormal51_g140 = float3( dot( tanToWorld0, tanNormal51_g140 ), dot( tanToWorld1, tanNormal51_g140 ), dot( tanToWorld2, tanNormal51_g140 ) );
				float4 appendResult63_g140 = (float4(worldNormal51_g140 , 0.0));
				float4 temp_output_57_0_g140 = mul( GetWorldToObjectMatrix(), appendResult63_g140 );
				float4 temp_cast_8 = (2.0).xxxx;
				float4 temp_output_4_0_g140 = pow( abs( temp_output_57_0_g140 ) , temp_cast_8 );
				float4 break6_g140 = temp_output_4_0_g140;
				float4 projNormal10_g140 = ( temp_output_4_0_g140 / ( break6_g140.x + break6_g140.y + break6_g140.z ) );
				float4 appendResult62_g140 = (float4(PositionWS , 1.0));
				float4 break26_g140 = mul( GetWorldToObjectMatrix(), appendResult62_g140 );
				float2 appendResult27_g140 = (float2(break26_g140.z , break26_g140.y));
				float4 nSign18_g140 = sign( temp_output_57_0_g140 );
				float4 break20_g140 = nSign18_g140;
				float2 appendResult21_g140 = (float2(break20_g140.x , 1.0));
				float temp_output_29_0_g140 = _HeightTiling;
				float2 temp_output_65_0_g140 = float2( 0,0 );
				float2 appendResult32_g140 = (float2(break26_g140.x , break26_g140.z));
				float2 appendResult22_g140 = (float2(break20_g140.y , 1.0));
				float2 appendResult34_g140 = (float2(break26_g140.x , break26_g140.y));
				float2 appendResult25_g140 = (float2(-break20_g140.z , 1.0));
				float detaledHeight167 = saturate( ( detailTex146 * saturate( ( saturate( ( ( projNormal10_g140.x * tex2D( _HeightMap, ( ( appendResult27_g140 * appendResult21_g140 * temp_output_29_0_g140 ) + temp_output_65_0_g140 ) ) ) + ( projNormal10_g140.y * tex2D( _HeightMap, ( ( temp_output_29_0_g140 * appendResult32_g140 * appendResult22_g140 ) + temp_output_65_0_g140 ) ) ) + ( projNormal10_g140.z * tex2D( _HeightMap, ( temp_output_65_0_g140 + ( temp_output_29_0_g140 * appendResult34_g140 * appendResult25_g140 ) ) ) ) ) ).r * _HeightDetail ) ) ) );
				float temp_output_2_0_g119 = saturate( ( _LavaFactorsX - _LavaDetail ) );
				float detaledHeight01178 = saturate( saturate( ( ( detaledHeight167 - temp_output_2_0_g119 ) / ( saturate( ( _LavaFactorsY - _LavaDetail ) ) - temp_output_2_0_g119 ) ) ) );
				float temp_output_6_0_g133 = ( detaledHeight01178 / _LavaFactorsZ );
				float3 lerpResult8_g133 = lerp( _LavaLow.rgb , _LavaMid.rgb , saturate( temp_output_6_0_g133 ));
				float3 lerpResult12_g133 = lerp( lerpResult8_g133 , _LavaHigh.rgb , saturate( ( temp_output_6_0_g133 - 1.0 ) ));
				float3 temp_output_179_0 = lerpResult12_g133;
				float4 temp_output_42_0_g131 = float4( temp_output_179_0 , 0.0 );
				float4 baseColor213 = ( ( float4( (temp_output_43_0_g131).rgb , 0.0 ) * (temp_output_43_0_g131).a * pow( max( dotResult19_g131 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g131 ) + ( ( ( temp_output_40_0_g131 * max( dotResult14_g131 , 0.0 ) ) + float4( bakedGI34_g131 , 0.0 ) ) * float4( (temp_output_42_0_g131).rgb , 0.0 ) ) );
				float4 temp_output_43_0_g137 = _SpecularColor;
				float3 normalizeResult4_g138 = normalize( ( ase_viewDirWS + _MainLightPosition.xyz ) );
				float3 tanNormal12_g137 = normalUnpacked196;
				float3 worldNormal12_g137 = float3( dot( tanToWorld0, tanNormal12_g137 ), dot( tanToWorld1, tanNormal12_g137 ), dot( tanToWorld2, tanNormal12_g137 ) );
				float3 normalizeResult64_g137 = normalize( worldNormal12_g137 );
				float dotResult19_g137 = dot( normalizeResult4_g138 , normalizeResult64_g137 );
				float4 temp_output_40_0_g137 = ( ase_lightColor * ase_lightAtten );
				float dotResult14_g137 = dot( normalizeResult64_g137 , _MainLightPosition.xyz );
				float3 bakedGI34_g137 = ASEIndirectDiffuse( input, normalizeResult64_g137, PositionWS, ase_viewDirWS );
				MixRealtimeAndBakedGI( ase_mainLight, normalizeResult64_g137, bakedGI34_g137, half4( 0, 0, 0, 0 ) );
				float4 temp_cast_14 = (1.0).xxxx;
				float4 temp_output_42_0_g137 = temp_cast_14;
				float4 temp_output_306_0 = ( ( float4( (temp_output_43_0_g137).rgb , 0.0 ) * (temp_output_43_0_g137).a * pow( max( dotResult19_g137 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g137 ) + ( ( ( temp_output_40_0_g137 * max( dotResult14_g137 , 0.0 ) ) + float4( bakedGI34_g137 , 0.0 ) ) * float4( (temp_output_42_0_g137).rgb , 0.0 ) ) );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - PositionWS ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - PositionWS ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - PositionWS ).z;
				float3 ase_viewDirTS = normalize( ase_viewVectorTS );
				float3 normalizeResult5_g127 = normalize( normalUnpacked196 );
				float dotResult14_g127 = dot( ase_viewDirTS , normalizeResult5_g127 );
				float detailX235 = break138.r;
				float4 fresnel268 = saturate( ( ( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - dotResult14_g127 ) ) ) , _FresnelPower ) ) * _FrenselMult ) * _FresnelColor ) * detailX235 ) );
				float3 tanNormal51_g129 = float3( 0, 0, 1 );
				float3 worldNormal51_g129 = float3( dot( tanToWorld0, tanNormal51_g129 ), dot( tanToWorld1, tanNormal51_g129 ), dot( tanToWorld2, tanNormal51_g129 ) );
				float4 appendResult63_g129 = (float4(worldNormal51_g129 , 0.0));
				float4 temp_output_57_0_g129 = mul( GetWorldToObjectMatrix(), appendResult63_g129 );
				float4 temp_cast_16 = (5.0).xxxx;
				float4 temp_output_4_0_g129 = pow( abs( temp_output_57_0_g129 ) , temp_cast_16 );
				float4 break6_g129 = temp_output_4_0_g129;
				float4 projNormal10_g129 = ( temp_output_4_0_g129 / ( break6_g129.x + break6_g129.y + break6_g129.z ) );
				float4 appendResult62_g129 = (float4(PositionWS , 1.0));
				float4 break26_g129 = mul( GetWorldToObjectMatrix(), appendResult62_g129 );
				float2 appendResult27_g129 = (float2(break26_g129.z , break26_g129.y));
				float4 nSign18_g129 = sign( temp_output_57_0_g129 );
				float4 break20_g129 = nSign18_g129;
				float2 appendResult21_g129 = (float2(break20_g129.x , 1.0));
				float temp_output_29_0_g129 = _DistortionTiling;
				float temp_output_10_0_g128 = ( _TimeParameters.x * _DistortionSpeed );
				float2 appendResult12_g128 = (float2(temp_output_10_0_g128 , temp_output_10_0_g128));
				float3 tanNormal51_g130 = float3( 0, 0, 1 );
				float3 worldNormal51_g130 = float3( dot( tanToWorld0, tanNormal51_g130 ), dot( tanToWorld1, tanNormal51_g130 ), dot( tanToWorld2, tanNormal51_g130 ) );
				float4 appendResult63_g130 = (float4(worldNormal51_g130 , 0.0));
				float4 temp_output_57_0_g130 = mul( GetWorldToObjectMatrix(), appendResult63_g130 );
				float4 temp_cast_17 = (5.0).xxxx;
				float4 temp_output_4_0_g130 = pow( abs( temp_output_57_0_g130 ) , temp_cast_17 );
				float4 break6_g130 = temp_output_4_0_g130;
				float4 projNormal10_g130 = ( temp_output_4_0_g130 / ( break6_g130.x + break6_g130.y + break6_g130.z ) );
				float4 appendResult62_g130 = (float4(PositionWS , 1.0));
				float4 break26_g130 = mul( GetWorldToObjectMatrix(), appendResult62_g130 );
				float2 appendResult27_g130 = (float2(break26_g130.z , break26_g130.y));
				float4 nSign18_g130 = sign( temp_output_57_0_g130 );
				float4 break20_g130 = nSign18_g130;
				float2 appendResult21_g130 = (float2(break20_g130.x , 1.0));
				float temp_output_29_0_g130 = _DistortionUVTiling;
				float temp_output_2_0_g128 = ( _TimeParameters.x * _DistortionUVSpeed );
				float2 appendResult5_g128 = (float2(temp_output_2_0_g128 , temp_output_2_0_g128));
				float2 temp_output_65_0_g130 = appendResult5_g128;
				float2 appendResult32_g130 = (float2(break26_g130.x , break26_g130.z));
				float2 appendResult22_g130 = (float2(break20_g130.y , 1.0));
				float2 appendResult34_g130 = (float2(break26_g130.x , break26_g130.y));
				float2 appendResult25_g130 = (float2(-break20_g130.z , 1.0));
				float4 break11_g128 = ( saturate( ( ( projNormal10_g130.x * tex2D( _DistortionMap, ( ( appendResult27_g130 * appendResult21_g130 * temp_output_29_0_g130 ) + temp_output_65_0_g130 ) ) ) + ( projNormal10_g130.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g130 * appendResult32_g130 * appendResult22_g130 ) + temp_output_65_0_g130 ) ) ) + ( projNormal10_g130.z * tex2D( _DistortionMap, ( temp_output_65_0_g130 + ( temp_output_29_0_g130 * appendResult34_g130 * appendResult25_g130 ) ) ) ) ) ) * _DistortionFactor );
				float2 appendResult13_g128 = (float2(break11_g128.r , break11_g128.g));
				float2 temp_output_65_0_g129 = ( appendResult12_g128 + appendResult13_g128 );
				float2 appendResult32_g129 = (float2(break26_g129.x , break26_g129.z));
				float2 appendResult22_g129 = (float2(break20_g129.y , 1.0));
				float2 appendResult34_g129 = (float2(break26_g129.x , break26_g129.y));
				float2 appendResult25_g129 = (float2(-break20_g129.z , 1.0));
				float3 tanNormal51_g142 = float3( 0, 0, 1 );
				float3 worldNormal51_g142 = float3( dot( tanToWorld0, tanNormal51_g142 ), dot( tanToWorld1, tanNormal51_g142 ), dot( tanToWorld2, tanNormal51_g142 ) );
				float4 appendResult63_g142 = (float4(worldNormal51_g142 , 0.0));
				float4 temp_output_57_0_g142 = mul( GetWorldToObjectMatrix(), appendResult63_g142 );
				float4 temp_cast_18 = (2.0).xxxx;
				float4 temp_output_4_0_g142 = pow( abs( temp_output_57_0_g142 ) , temp_cast_18 );
				float4 break6_g142 = temp_output_4_0_g142;
				float4 projNormal10_g142 = ( temp_output_4_0_g142 / ( break6_g142.x + break6_g142.y + break6_g142.z ) );
				float4 appendResult62_g142 = (float4(PositionWS , 1.0));
				float4 break26_g142 = mul( GetWorldToObjectMatrix(), appendResult62_g142 );
				float2 appendResult27_g142 = (float2(break26_g142.z , break26_g142.y));
				float4 nSign18_g142 = sign( temp_output_57_0_g142 );
				float4 break20_g142 = nSign18_g142;
				float2 appendResult21_g142 = (float2(break20_g142.x , 1.0));
				float temp_output_29_0_g142 = _MagmaTiling;
				float2 temp_output_65_0_g142 = float2( 0,0 );
				float2 appendResult32_g142 = (float2(break26_g142.x , break26_g142.z));
				float2 appendResult22_g142 = (float2(break20_g142.y , 1.0));
				float2 appendResult34_g142 = (float2(break26_g142.x , break26_g142.y));
				float2 appendResult25_g142 = (float2(-break20_g142.z , 1.0));
				float4 temp_output_214_0 = saturate( ( ( projNormal10_g142.x * tex2D( _MagmaMap, ( ( appendResult27_g142 * appendResult21_g142 * temp_output_29_0_g142 ) + temp_output_65_0_g142 ) ) ) + ( projNormal10_g142.y * tex2D( _MagmaMap, ( ( temp_output_29_0_g142 * appendResult32_g142 * appendResult22_g142 ) + temp_output_65_0_g142 ) ) ) + ( projNormal10_g142.z * tex2D( _MagmaMap, ( temp_output_65_0_g142 + ( temp_output_29_0_g142 * appendResult34_g142 * appendResult25_g142 ) ) ) ) ) );
				float4 temp_cast_19 = (_MagmaPower).xxxx;
				float4 magmaDetial234 = saturate( ( saturate( pow( max( float4( 0,0,0,0 ) , temp_output_214_0 ) , temp_cast_19 ) ) * _MagmaBoost * temp_output_214_0 ) );
				float3 tanNormal51_g141 = float3( 0, 0, 1 );
				float3 worldNormal51_g141 = float3( dot( tanToWorld0, tanNormal51_g141 ), dot( tanToWorld1, tanNormal51_g141 ), dot( tanToWorld2, tanNormal51_g141 ) );
				float4 appendResult63_g141 = (float4(worldNormal51_g141 , 0.0));
				float4 temp_output_57_0_g141 = mul( GetWorldToObjectMatrix(), appendResult63_g141 );
				float4 temp_cast_20 = (2.0).xxxx;
				float4 temp_output_4_0_g141 = pow( abs( temp_output_57_0_g141 ) , temp_cast_20 );
				float4 break6_g141 = temp_output_4_0_g141;
				float4 projNormal10_g141 = ( temp_output_4_0_g141 / ( break6_g141.x + break6_g141.y + break6_g141.z ) );
				float4 appendResult62_g141 = (float4(PositionWS , 1.0));
				float4 break26_g141 = mul( GetWorldToObjectMatrix(), appendResult62_g141 );
				float2 appendResult27_g141 = (float2(break26_g141.z , break26_g141.y));
				float4 nSign18_g141 = sign( temp_output_57_0_g141 );
				float4 break20_g141 = nSign18_g141;
				float2 appendResult21_g141 = (float2(break20_g141.x , 1.0));
				float temp_output_29_0_g141 = _LavaMaskTiling;
				float2 temp_output_65_0_g141 = float2( 0,0 );
				float2 appendResult32_g141 = (float2(break26_g141.x , break26_g141.z));
				float2 appendResult22_g141 = (float2(break20_g141.y , 1.0));
				float2 appendResult34_g141 = (float2(break26_g141.x , break26_g141.y));
				float2 appendResult25_g141 = (float2(-break20_g141.z , 1.0));
				float lavaMaskMap229 = saturate( ( ( projNormal10_g141.x * tex2D( _HeightMap, ( ( appendResult27_g141 * appendResult21_g141 * temp_output_29_0_g141 ) + temp_output_65_0_g141 ) ) ) + ( projNormal10_g141.y * tex2D( _HeightMap, ( ( temp_output_29_0_g141 * appendResult32_g141 * appendResult22_g141 ) + temp_output_65_0_g141 ) ) ) + ( projNormal10_g141.z * tex2D( _HeightMap, ( temp_output_65_0_g141 + ( temp_output_29_0_g141 * appendResult34_g141 * appendResult25_g141 ) ) ) ) ) ).r;
				float dotResult254 = dot( ase_viewDirTS , normalUnpacked196 );
				float lavaMask272 = saturate( ( magmaDetial234.r + ( saturate( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - lavaMaskMap229 ) ) ) , _LavaMaskFactorsX ) ) * _LavaMaskFactorsY ) ) * saturate( ( saturate( pow( max( 0.0 , dotResult254 ) , _LavaMaskPower ) ) * _LavaMaskBoost ) ) ) ) );
				float4 lerpResult274 = lerp( _MagmaColorMin , _MagmaColorMax , lavaMask272);
				float4 lavaColor277 = ( saturate( ( ( projNormal10_g129.x * tex2D( _DistortionMap, ( ( appendResult27_g129 * appendResult21_g129 * temp_output_29_0_g129 ) + temp_output_65_0_g129 ) ) ) + ( projNormal10_g129.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g129 * appendResult32_g129 * appendResult22_g129 ) + temp_output_65_0_g129 ) ) ) + ( projNormal10_g129.z * tex2D( _DistortionMap, ( temp_output_65_0_g129 + ( temp_output_29_0_g129 * appendResult34_g129 * appendResult25_g129 ) ) ) ) ) ) * lerpResult274 * _MagmaGlow );
				

				float3 BaseColor = temp_cast_0;
				float3 Emission = ( saturate( ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g121 ) * _ScatterStretch ) ) * _ScatterColor * ase_lightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( baseColor213 + ( temp_output_306_0 * fresnel268 ) ) ) ) + ( ( lavaColor277 * lavaMask272 ) * saturate( ( _LavaPasstrough + temp_output_306_0 ) ) ) ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#if defined( _ALPHATEST_ON )
					AlphaDiscard( Alpha, AlphaClipThreshold );
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = input.VizUV.xy;
					metaInput.LightCoord = input.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define ASE_GEOMETRY
			#define _SPECULAR_SETUP 1
			#define _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 170200


			#pragma vertex vert
			#pragma fragment frag

			#if defined( _SPECULAR_SETUP ) && defined( ASE_LIGHTING_SIMPLE )
				#if defined( _SPECULARHIGHLIGHTS_OFF )
					#undef _SPECULAR_COLOR
				#else
					#define _SPECULAR_COLOR
				#endif
			#endif

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _NormalMap_ST;
			float4 _FresnelColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _SpecularColor;
			float _FrenselMult;
			float _LavaMaskBoost;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _DistortionUVTiling;
			float _LavaMaskPower;
			float _LavaMaskFactorsY;
			float _DistortionFactor;
			float _LavaMaskFactorsX;
			float _FresnelPower;
			float _LavaMaskTiling;
			float _MagmaTiling;
			float _MagmaPower;
			float _DistortionUVSpeed;
			float _MagmaBoost;
			float _LavaFactorsY;
			float _MagmaGlow;
			float _NormalTiling;
			float _NormalScale;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _Smoothness;
			float _LavaFactorsZ;
			float _ScatterCenterShift;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _ScatterStretch;
			float _LavaPasstrough;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_TRANSFER_INSTANCE_ID( input, output );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord = TransformWorldToShadowCoord(input.positionWS);
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( input.positionWS );
				float4 ShadowCoord = shadowCoord;

				float3 temp_cast_0 = (0.0).xxx;
				

				float3 BaseColor = temp_cast_0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4(BaseColor, Alpha );

				#if defined( _ALPHATEST_ON )
					AlphaDiscard( Alpha, AlphaClipThreshold );
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define ASE_GEOMETRY
			#define _SPECULAR_SETUP 1
			#define _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 170200


			#pragma vertex vert
			#pragma fragment frag

			#if defined( _SPECULAR_SETUP ) && defined( ASE_LIGHTING_SIMPLE )
				#if defined( _SPECULARHIGHLIGHTS_OFF )
					#undef _SPECULAR_COLOR
				#else
					#define _SPECULAR_COLOR
				#endif
			#endif

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY
			//#define SHADERPASS SHADERPASS_DEPTHNORMALS

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined( UNITY_INSTANCING_ENABLED ) && defined( ASE_INSTANCED_TERRAIN ) && ( defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL) || defined(_INSTANCEDTERRAINNORMALS_PIXEL) )
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				half4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				half3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2; // holds terrainUV ifdef ENABLE_TERRAIN_PERPIXEL_NORMAL
				float4 ase_texcoord3 : TEXCOORD3;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _NormalMap_ST;
			float4 _FresnelColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _SpecularColor;
			float _FrenselMult;
			float _LavaMaskBoost;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _DistortionUVTiling;
			float _LavaMaskPower;
			float _LavaMaskFactorsY;
			float _DistortionFactor;
			float _LavaMaskFactorsX;
			float _FresnelPower;
			float _LavaMaskTiling;
			float _MagmaTiling;
			float _MagmaPower;
			float _DistortionUVSpeed;
			float _MagmaBoost;
			float _LavaFactorsY;
			float _MagmaGlow;
			float _NormalTiling;
			float _NormalScale;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _Smoothness;
			float _LavaFactorsZ;
			float _ScatterCenterShift;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _ScatterStretch;
			float _LavaPasstrough;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _NormalMap;


			inline float4 TriplanarSampling193( sampler2D topTexMap, const float4 topST, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_texcoord3 = input.positionOS;
				output.ase_normal = input.normalOS;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS, input.tangentOS );

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				output.normalWS = normalInput.normalWS;
				output.tangentWS = float4( normalInput.tangentWS, ( input.tangentOS.w > 0.0 ? 1.0 : -1.0 ) * GetOddNegativeScale() );

				#if defined( ENABLE_TERRAIN_PERPIXEL_NORMAL )
					output.tangentWS.zw = input.texcoord.xy;
					output.tangentWS.xy = input.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.texcoord = input.texcoord;
				
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			void frag(	PackedVaryings input
						, out half4 outNormalWS : SV_Target0
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out uint outRenderingLayers : SV_Target1
						#endif
						 )
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord = TransformWorldToShadowCoord(input.positionWS);
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				// @diogo: mikktspace compliant
				float renormFactor = 1.0 / max( FLT_MIN, length( input.normalWS ) );

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( input.positionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );
				float3 TangentWS = input.tangentWS.xyz * renormFactor;
				float3 BitangentWS = cross( input.normalWS, input.tangentWS.xyz ) * input.tangentWS.w * renormFactor;
				float3 NormalWS = input.normalWS * renormFactor;

				#if defined( ENABLE_TERRAIN_PERPIXEL_NORMAL )
					float2 sampleCoords = (input.tangentWS.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					NormalWS = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					TangentWS = -cross(GetObjectToWorldMatrix()._13_23_33, NormalWS);
					BitangentWS = cross(NormalWS, -TangentWS);
				#endif

				float4 triplanar193 = TriplanarSampling193( _NormalMap, _NormalMap_ST, input.ase_texcoord3.xyz, input.ase_normal, 1.0, _NormalTiling, 1.0, 0 );
				float3 unpack195 = UnpackNormalScale( triplanar193, _NormalScale );
				unpack195.z = lerp( 1, unpack195.z, saturate(_NormalScale) );
				float3 normalUnpacked196 = unpack195;
				

				float3 Normal = normalUnpacked196;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#if defined( _ALPHATEST_ON )
					AlphaDiscard( Alpha, AlphaClipThreshold );
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(NormalWS);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(TangentWS, BitangentWS, NormalWS));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = NormalWS;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					outRenderingLayers = EncodeMeshRenderingLayer();
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			#define ASE_GEOMETRY
			#define _SPECULAR_SETUP 1
			#define _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 170200


			// Deferred Rendering Path does not support the OpenGL-based graphics API:
			// Desktop OpenGL, OpenGL ES 3.0, WebGL 2.0.
			#pragma exclude_renderers glcore gles3 

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#if ( UNITY_VERSION >= 60000206 )
			#pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
			#endif
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED
			#pragma multi_compile _ _CLUSTER_LIGHT_LOOP

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ USE_LEGACY_LIGHTMAPS
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile_fragment _ LIGHTMAP_BICUBIC_SAMPLING
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#if defined( _SPECULAR_SETUP ) && defined( ASE_LIGHTING_SIMPLE )
				#if defined( _SPECULARHIGHLIGHTS_OFF )
					#undef _SPECULAR_COLOR
				#else
					#define _SPECULAR_COLOR
				#endif
			#endif

			#define SHADERPASS SHADERPASS_GBUFFER

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined( UNITY_INSTANCING_ENABLED ) && defined( ASE_INSTANCED_TERRAIN ) && ( defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL) || defined(_INSTANCEDTERRAINNORMALS_PIXEL) )
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					float4 texcoord1 : TEXCOORD1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					float4 texcoord2 : TEXCOORD2;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				half3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2; // holds terrainUV ifdef ENABLE_TERRAIN_PERPIXEL_NORMAL
				float4 lightmapUVOrVertexSH : TEXCOORD3;
				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					half4 fogFactorAndVertexLight : TEXCOORD4;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD5;
				#endif
				#if defined(USE_APV_PROBE_OCCLUSION)
					float4 probeOcclusion : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _NormalMap_ST;
			float4 _FresnelColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _SpecularColor;
			float _FrenselMult;
			float _LavaMaskBoost;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _DistortionUVTiling;
			float _LavaMaskPower;
			float _LavaMaskFactorsY;
			float _DistortionFactor;
			float _LavaMaskFactorsX;
			float _FresnelPower;
			float _LavaMaskTiling;
			float _MagmaTiling;
			float _MagmaPower;
			float _DistortionUVSpeed;
			float _MagmaBoost;
			float _LavaFactorsY;
			float _MagmaGlow;
			float _NormalTiling;
			float _NormalScale;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _Smoothness;
			float _LavaFactorsZ;
			float _ScatterCenterShift;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _ScatterStretch;
			float _LavaPasstrough;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _NormalMap;
			sampler2D _DetailMap;
			sampler2D _ScatterMap;
			sampler2D _HeightMap;
			sampler2D _DistortionMap;
			sampler2D _MagmaMap;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/GBufferOutput.hlsl"

			inline float4 TriplanarSampling193( sampler2D topTexMap, const float4 topST, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			half3 ASEIndirectDiffuse( PackedVaryings input, half3 normalWS, float3 positionWS, half3 viewDirWS )
			{
			#if defined( DYNAMICLIGHTMAP_ON )
				return SAMPLE_GI( input.lightmapUVOrVertexSH.xy, input.dynamicLightmapUV.xy, 0, normalWS );
			#elif defined( LIGHTMAP_ON )
				return SAMPLE_GI( input.lightmapUVOrVertexSH.xy, 0, normalWS );
			#elif defined( PROBE_VOLUMES_L1 ) || defined( PROBE_VOLUMES_L2 )
				return SampleProbeVolumePixel( SampleSH( normalWS ), positionWS, normalWS, viewDirWS, input.positionCS.xy );
			#else
				return SampleSH( normalWS );
			#endif
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_texcoord7 = input.positionOS;
				output.ase_normal = input.normalOS;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS, input.tangentOS );

				OUTPUT_LIGHTMAP_UV(input.texcoord1, unity_LightmapST, output.lightmapUVOrVertexSH.xy);
				#if defined(DYNAMICLIGHTMAP_ON)
					output.dynamicLightmapUV.xy = input.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				OUTPUT_SH4(vertexInput.positionWS, normalInput.normalWS.xyz, GetWorldSpaceNormalizeViewDir(vertexInput.positionWS), output.lightmapUVOrVertexSH.xyz, output.probeOcclusion);

				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					output.fogFactorAndVertexLight = 0;
					#if defined(ASE_FOG) && !defined(_FOG_FRAGMENT)
						// @diogo: no fog applied in GBuffer
					#endif
					#ifdef _ADDITIONAL_LIGHTS_VERTEX
						half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );
						output.fogFactorAndVertexLight.yzw = vertexLight;
					#endif
				#endif

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				output.normalWS = normalInput.normalWS;
				output.tangentWS = float4( normalInput.tangentWS, ( input.tangentOS.w > 0.0 ? 1.0 : -1.0 ) * GetOddNegativeScale() );

				#if defined( ENABLE_TERRAIN_PERPIXEL_NORMAL )
					output.tangentWS.zw = input.texcoord.xy;
					output.tangentWS.xy = input.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					float4 texcoord1 : TEXCOORD1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					float4 texcoord2 : TEXCOORD2;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.texcoord = input.texcoord;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					output.texcoord1 = input.texcoord1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					output.texcoord2 = input.texcoord2;
				#endif
				
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					output.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					output.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				#endif
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			GBufferFragOutput frag ( PackedVaryings input
								#if defined( ASE_DEPTH_WRITE_ON )
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					float4 shadowCoord = TransformWorldToShadowCoord( input.positionWS );
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				// @diogo: mikktspace compliant
				float renormFactor = 1.0 / max( FLT_MIN, length( input.normalWS ) );

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				float3 ViewDirWS = GetWorldSpaceNormalizeViewDir( PositionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );
				float3 TangentWS = input.tangentWS.xyz * renormFactor;
				float3 BitangentWS = cross( input.normalWS, input.tangentWS.xyz ) * input.tangentWS.w * renormFactor;
				float3 NormalWS = input.normalWS * renormFactor;

				#if defined( ENABLE_TERRAIN_PERPIXEL_NORMAL )
					float2 sampleCoords = (input.tangentWS.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					NormalWS = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					TangentWS = -cross(GetObjectToWorldMatrix()._13_23_33, NormalWS);
					BitangentWS = cross(NormalWS, -TangentWS);
				#endif

				float3 temp_cast_0 = (0.0).xxx;
				
				float4 triplanar193 = TriplanarSampling193( _NormalMap, _NormalMap_ST, input.ase_texcoord7.xyz, input.ase_normal, 1.0, _NormalTiling, 1.0, 0 );
				float3 unpack195 = UnpackNormalScale( triplanar193, _NormalScale );
				unpack195.z = lerp( 1, unpack195.z, saturate(_NormalScale) );
				float3 normalUnpacked196 = unpack195;
				
				float3 tanToWorld0 = float3( TangentWS.x, BitangentWS.x, NormalWS.x );
				float3 tanToWorld1 = float3( TangentWS.y, BitangentWS.y, NormalWS.y );
				float3 tanToWorld2 = float3( TangentWS.z, BitangentWS.z, NormalWS.z );
				float3 tanNormal51_g139 = float3( 0, 0, 1 );
				float3 worldNormal51_g139 = float3( dot( tanToWorld0, tanNormal51_g139 ), dot( tanToWorld1, tanNormal51_g139 ), dot( tanToWorld2, tanNormal51_g139 ) );
				float4 appendResult63_g139 = (float4(worldNormal51_g139 , 0.0));
				float4 temp_output_57_0_g139 = mul( GetWorldToObjectMatrix(), appendResult63_g139 );
				float4 temp_cast_1 = (2.0).xxxx;
				float4 temp_output_4_0_g139 = pow( abs( temp_output_57_0_g139 ) , temp_cast_1 );
				float4 break6_g139 = temp_output_4_0_g139;
				float4 projNormal10_g139 = ( temp_output_4_0_g139 / ( break6_g139.x + break6_g139.y + break6_g139.z ) );
				float4 appendResult62_g139 = (float4(PositionWS , 1.0));
				float4 break26_g139 = mul( GetWorldToObjectMatrix(), appendResult62_g139 );
				float2 appendResult27_g139 = (float2(break26_g139.z , break26_g139.y));
				float4 nSign18_g139 = sign( temp_output_57_0_g139 );
				float4 break20_g139 = nSign18_g139;
				float2 appendResult21_g139 = (float2(break20_g139.x , 1.0));
				float temp_output_29_0_g139 = _DetailTiling;
				float2 temp_output_65_0_g139 = float2( 0,0 );
				float2 appendResult32_g139 = (float2(break26_g139.x , break26_g139.z));
				float2 appendResult22_g139 = (float2(break20_g139.y , 1.0));
				float2 appendResult34_g139 = (float2(break26_g139.x , break26_g139.y));
				float2 appendResult25_g139 = (float2(-break20_g139.z , 1.0));
				float4 break138 = saturate( ( ( projNormal10_g139.x * tex2D( _DetailMap, ( ( appendResult27_g139 * appendResult21_g139 * temp_output_29_0_g139 ) + temp_output_65_0_g139 ) ) ) + ( projNormal10_g139.y * tex2D( _DetailMap, ( ( temp_output_29_0_g139 * appendResult32_g139 * appendResult22_g139 ) + temp_output_65_0_g139 ) ) ) + ( projNormal10_g139.z * tex2D( _DetailMap, ( temp_output_65_0_g139 + ( temp_output_29_0_g139 * appendResult34_g139 * appendResult25_g139 ) ) ) ) ) );
				float detailTex146 = saturate( ( _DetailExp * pow( max( 0.0 , ( break138.r * break138.g ) ) , _DetailExp ) * 5000.0 ) );
				float4 temp_output_204_0 = saturate( ( detailTex146 * _Specular * _SpecularColor * _SpecularBoost ) );
				
				float temp_output_206_0 = ( ( 1.0 - detailTex146 ) * _Smoothness );
				
				float4 transform4_g120 = mul(GetObjectToWorldMatrix(),float4( input.ase_normal , 0.0 ));
				float4 normalizeResult6_g120 = normalize( transform4_g120 );
				float3 temp_output_1_0_g121 = normalizeResult6_g120.xyz;
				float3 normalizeResult7_g120 = normalize( _MainLightPosition.xyz );
				float dotResult4_g121 = dot( temp_output_1_0_g121 , normalizeResult7_g120 );
				float3 normalizeResult8_g120 = normalize( ViewDirWS );
				float dotResult7_g121 = dot( temp_output_1_0_g121 , normalizeResult8_g120 );
				float2 appendResult10_g121 = (float2(( ( dotResult4_g121 / 2.0 ) + 0.5 ) , dotResult7_g121));
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b ) + 1e-7;
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 temp_output_43_0_g131 = temp_output_204_0;
				float3 normalizeResult4_g132 = normalize( ( ViewDirWS + _MainLightPosition.xyz ) );
				float3 tanNormal12_g131 = normalUnpacked196;
				float3 worldNormal12_g131 = float3( dot( tanToWorld0, tanNormal12_g131 ), dot( tanToWorld1, tanNormal12_g131 ), dot( tanToWorld2, tanNormal12_g131 ) );
				float3 normalizeResult64_g131 = normalize( worldNormal12_g131 );
				float dotResult19_g131 = dot( normalizeResult4_g132 , normalizeResult64_g131 );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoord );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_output_40_0_g131 = ( ase_lightColor * ase_lightAtten );
				float dotResult14_g131 = dot( normalizeResult64_g131 , _MainLightPosition.xyz );
				float3 bakedGI34_g131 = ASEIndirectDiffuse( input, normalizeResult64_g131, PositionWS, ViewDirWS );
				MixRealtimeAndBakedGI( ase_mainLight, normalizeResult64_g131, bakedGI34_g131, half4( 0, 0, 0, 0 ) );
				float3 tanNormal51_g140 = float3( 0, 0, 1 );
				float3 worldNormal51_g140 = float3( dot( tanToWorld0, tanNormal51_g140 ), dot( tanToWorld1, tanNormal51_g140 ), dot( tanToWorld2, tanNormal51_g140 ) );
				float4 appendResult63_g140 = (float4(worldNormal51_g140 , 0.0));
				float4 temp_output_57_0_g140 = mul( GetWorldToObjectMatrix(), appendResult63_g140 );
				float4 temp_cast_9 = (2.0).xxxx;
				float4 temp_output_4_0_g140 = pow( abs( temp_output_57_0_g140 ) , temp_cast_9 );
				float4 break6_g140 = temp_output_4_0_g140;
				float4 projNormal10_g140 = ( temp_output_4_0_g140 / ( break6_g140.x + break6_g140.y + break6_g140.z ) );
				float4 appendResult62_g140 = (float4(PositionWS , 1.0));
				float4 break26_g140 = mul( GetWorldToObjectMatrix(), appendResult62_g140 );
				float2 appendResult27_g140 = (float2(break26_g140.z , break26_g140.y));
				float4 nSign18_g140 = sign( temp_output_57_0_g140 );
				float4 break20_g140 = nSign18_g140;
				float2 appendResult21_g140 = (float2(break20_g140.x , 1.0));
				float temp_output_29_0_g140 = _HeightTiling;
				float2 temp_output_65_0_g140 = float2( 0,0 );
				float2 appendResult32_g140 = (float2(break26_g140.x , break26_g140.z));
				float2 appendResult22_g140 = (float2(break20_g140.y , 1.0));
				float2 appendResult34_g140 = (float2(break26_g140.x , break26_g140.y));
				float2 appendResult25_g140 = (float2(-break20_g140.z , 1.0));
				float detaledHeight167 = saturate( ( detailTex146 * saturate( ( saturate( ( ( projNormal10_g140.x * tex2D( _HeightMap, ( ( appendResult27_g140 * appendResult21_g140 * temp_output_29_0_g140 ) + temp_output_65_0_g140 ) ) ) + ( projNormal10_g140.y * tex2D( _HeightMap, ( ( temp_output_29_0_g140 * appendResult32_g140 * appendResult22_g140 ) + temp_output_65_0_g140 ) ) ) + ( projNormal10_g140.z * tex2D( _HeightMap, ( temp_output_65_0_g140 + ( temp_output_29_0_g140 * appendResult34_g140 * appendResult25_g140 ) ) ) ) ) ).r * _HeightDetail ) ) ) );
				float temp_output_2_0_g119 = saturate( ( _LavaFactorsX - _LavaDetail ) );
				float detaledHeight01178 = saturate( saturate( ( ( detaledHeight167 - temp_output_2_0_g119 ) / ( saturate( ( _LavaFactorsY - _LavaDetail ) ) - temp_output_2_0_g119 ) ) ) );
				float temp_output_6_0_g133 = ( detaledHeight01178 / _LavaFactorsZ );
				float3 lerpResult8_g133 = lerp( _LavaLow.rgb , _LavaMid.rgb , saturate( temp_output_6_0_g133 ));
				float3 lerpResult12_g133 = lerp( lerpResult8_g133 , _LavaHigh.rgb , saturate( ( temp_output_6_0_g133 - 1.0 ) ));
				float3 temp_output_179_0 = lerpResult12_g133;
				float4 temp_output_42_0_g131 = float4( temp_output_179_0 , 0.0 );
				float4 baseColor213 = ( ( float4( (temp_output_43_0_g131).rgb , 0.0 ) * (temp_output_43_0_g131).a * pow( max( dotResult19_g131 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g131 ) + ( ( ( temp_output_40_0_g131 * max( dotResult14_g131 , 0.0 ) ) + float4( bakedGI34_g131 , 0.0 ) ) * float4( (temp_output_42_0_g131).rgb , 0.0 ) ) );
				float4 temp_output_43_0_g137 = _SpecularColor;
				float3 normalizeResult4_g138 = normalize( ( ViewDirWS + _MainLightPosition.xyz ) );
				float3 tanNormal12_g137 = normalUnpacked196;
				float3 worldNormal12_g137 = float3( dot( tanToWorld0, tanNormal12_g137 ), dot( tanToWorld1, tanNormal12_g137 ), dot( tanToWorld2, tanNormal12_g137 ) );
				float3 normalizeResult64_g137 = normalize( worldNormal12_g137 );
				float dotResult19_g137 = dot( normalizeResult4_g138 , normalizeResult64_g137 );
				float4 temp_output_40_0_g137 = ( ase_lightColor * ase_lightAtten );
				float dotResult14_g137 = dot( normalizeResult64_g137 , _MainLightPosition.xyz );
				float3 bakedGI34_g137 = ASEIndirectDiffuse( input, normalizeResult64_g137, PositionWS, ViewDirWS );
				MixRealtimeAndBakedGI( ase_mainLight, normalizeResult64_g137, bakedGI34_g137, half4( 0, 0, 0, 0 ) );
				float4 temp_cast_15 = (1.0).xxxx;
				float4 temp_output_42_0_g137 = temp_cast_15;
				float4 temp_output_306_0 = ( ( float4( (temp_output_43_0_g137).rgb , 0.0 ) * (temp_output_43_0_g137).a * pow( max( dotResult19_g137 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g137 ) + ( ( ( temp_output_40_0_g137 * max( dotResult14_g137 , 0.0 ) ) + float4( bakedGI34_g137 , 0.0 ) ) * float4( (temp_output_42_0_g137).rgb , 0.0 ) ) );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - PositionWS ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - PositionWS ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - PositionWS ).z;
				float3 ase_viewDirTS = normalize( ase_viewVectorTS );
				float3 normalizeResult5_g127 = normalize( normalUnpacked196 );
				float dotResult14_g127 = dot( ase_viewDirTS , normalizeResult5_g127 );
				float detailX235 = break138.r;
				float4 fresnel268 = saturate( ( ( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - dotResult14_g127 ) ) ) , _FresnelPower ) ) * _FrenselMult ) * _FresnelColor ) * detailX235 ) );
				float3 tanNormal51_g129 = float3( 0, 0, 1 );
				float3 worldNormal51_g129 = float3( dot( tanToWorld0, tanNormal51_g129 ), dot( tanToWorld1, tanNormal51_g129 ), dot( tanToWorld2, tanNormal51_g129 ) );
				float4 appendResult63_g129 = (float4(worldNormal51_g129 , 0.0));
				float4 temp_output_57_0_g129 = mul( GetWorldToObjectMatrix(), appendResult63_g129 );
				float4 temp_cast_17 = (5.0).xxxx;
				float4 temp_output_4_0_g129 = pow( abs( temp_output_57_0_g129 ) , temp_cast_17 );
				float4 break6_g129 = temp_output_4_0_g129;
				float4 projNormal10_g129 = ( temp_output_4_0_g129 / ( break6_g129.x + break6_g129.y + break6_g129.z ) );
				float4 appendResult62_g129 = (float4(PositionWS , 1.0));
				float4 break26_g129 = mul( GetWorldToObjectMatrix(), appendResult62_g129 );
				float2 appendResult27_g129 = (float2(break26_g129.z , break26_g129.y));
				float4 nSign18_g129 = sign( temp_output_57_0_g129 );
				float4 break20_g129 = nSign18_g129;
				float2 appendResult21_g129 = (float2(break20_g129.x , 1.0));
				float temp_output_29_0_g129 = _DistortionTiling;
				float temp_output_10_0_g128 = ( _TimeParameters.x * _DistortionSpeed );
				float2 appendResult12_g128 = (float2(temp_output_10_0_g128 , temp_output_10_0_g128));
				float3 tanNormal51_g130 = float3( 0, 0, 1 );
				float3 worldNormal51_g130 = float3( dot( tanToWorld0, tanNormal51_g130 ), dot( tanToWorld1, tanNormal51_g130 ), dot( tanToWorld2, tanNormal51_g130 ) );
				float4 appendResult63_g130 = (float4(worldNormal51_g130 , 0.0));
				float4 temp_output_57_0_g130 = mul( GetWorldToObjectMatrix(), appendResult63_g130 );
				float4 temp_cast_18 = (5.0).xxxx;
				float4 temp_output_4_0_g130 = pow( abs( temp_output_57_0_g130 ) , temp_cast_18 );
				float4 break6_g130 = temp_output_4_0_g130;
				float4 projNormal10_g130 = ( temp_output_4_0_g130 / ( break6_g130.x + break6_g130.y + break6_g130.z ) );
				float4 appendResult62_g130 = (float4(PositionWS , 1.0));
				float4 break26_g130 = mul( GetWorldToObjectMatrix(), appendResult62_g130 );
				float2 appendResult27_g130 = (float2(break26_g130.z , break26_g130.y));
				float4 nSign18_g130 = sign( temp_output_57_0_g130 );
				float4 break20_g130 = nSign18_g130;
				float2 appendResult21_g130 = (float2(break20_g130.x , 1.0));
				float temp_output_29_0_g130 = _DistortionUVTiling;
				float temp_output_2_0_g128 = ( _TimeParameters.x * _DistortionUVSpeed );
				float2 appendResult5_g128 = (float2(temp_output_2_0_g128 , temp_output_2_0_g128));
				float2 temp_output_65_0_g130 = appendResult5_g128;
				float2 appendResult32_g130 = (float2(break26_g130.x , break26_g130.z));
				float2 appendResult22_g130 = (float2(break20_g130.y , 1.0));
				float2 appendResult34_g130 = (float2(break26_g130.x , break26_g130.y));
				float2 appendResult25_g130 = (float2(-break20_g130.z , 1.0));
				float4 break11_g128 = ( saturate( ( ( projNormal10_g130.x * tex2D( _DistortionMap, ( ( appendResult27_g130 * appendResult21_g130 * temp_output_29_0_g130 ) + temp_output_65_0_g130 ) ) ) + ( projNormal10_g130.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g130 * appendResult32_g130 * appendResult22_g130 ) + temp_output_65_0_g130 ) ) ) + ( projNormal10_g130.z * tex2D( _DistortionMap, ( temp_output_65_0_g130 + ( temp_output_29_0_g130 * appendResult34_g130 * appendResult25_g130 ) ) ) ) ) ) * _DistortionFactor );
				float2 appendResult13_g128 = (float2(break11_g128.r , break11_g128.g));
				float2 temp_output_65_0_g129 = ( appendResult12_g128 + appendResult13_g128 );
				float2 appendResult32_g129 = (float2(break26_g129.x , break26_g129.z));
				float2 appendResult22_g129 = (float2(break20_g129.y , 1.0));
				float2 appendResult34_g129 = (float2(break26_g129.x , break26_g129.y));
				float2 appendResult25_g129 = (float2(-break20_g129.z , 1.0));
				float3 tanNormal51_g142 = float3( 0, 0, 1 );
				float3 worldNormal51_g142 = float3( dot( tanToWorld0, tanNormal51_g142 ), dot( tanToWorld1, tanNormal51_g142 ), dot( tanToWorld2, tanNormal51_g142 ) );
				float4 appendResult63_g142 = (float4(worldNormal51_g142 , 0.0));
				float4 temp_output_57_0_g142 = mul( GetWorldToObjectMatrix(), appendResult63_g142 );
				float4 temp_cast_19 = (2.0).xxxx;
				float4 temp_output_4_0_g142 = pow( abs( temp_output_57_0_g142 ) , temp_cast_19 );
				float4 break6_g142 = temp_output_4_0_g142;
				float4 projNormal10_g142 = ( temp_output_4_0_g142 / ( break6_g142.x + break6_g142.y + break6_g142.z ) );
				float4 appendResult62_g142 = (float4(PositionWS , 1.0));
				float4 break26_g142 = mul( GetWorldToObjectMatrix(), appendResult62_g142 );
				float2 appendResult27_g142 = (float2(break26_g142.z , break26_g142.y));
				float4 nSign18_g142 = sign( temp_output_57_0_g142 );
				float4 break20_g142 = nSign18_g142;
				float2 appendResult21_g142 = (float2(break20_g142.x , 1.0));
				float temp_output_29_0_g142 = _MagmaTiling;
				float2 temp_output_65_0_g142 = float2( 0,0 );
				float2 appendResult32_g142 = (float2(break26_g142.x , break26_g142.z));
				float2 appendResult22_g142 = (float2(break20_g142.y , 1.0));
				float2 appendResult34_g142 = (float2(break26_g142.x , break26_g142.y));
				float2 appendResult25_g142 = (float2(-break20_g142.z , 1.0));
				float4 temp_output_214_0 = saturate( ( ( projNormal10_g142.x * tex2D( _MagmaMap, ( ( appendResult27_g142 * appendResult21_g142 * temp_output_29_0_g142 ) + temp_output_65_0_g142 ) ) ) + ( projNormal10_g142.y * tex2D( _MagmaMap, ( ( temp_output_29_0_g142 * appendResult32_g142 * appendResult22_g142 ) + temp_output_65_0_g142 ) ) ) + ( projNormal10_g142.z * tex2D( _MagmaMap, ( temp_output_65_0_g142 + ( temp_output_29_0_g142 * appendResult34_g142 * appendResult25_g142 ) ) ) ) ) );
				float4 temp_cast_20 = (_MagmaPower).xxxx;
				float4 magmaDetial234 = saturate( ( saturate( pow( max( float4( 0,0,0,0 ) , temp_output_214_0 ) , temp_cast_20 ) ) * _MagmaBoost * temp_output_214_0 ) );
				float3 tanNormal51_g141 = float3( 0, 0, 1 );
				float3 worldNormal51_g141 = float3( dot( tanToWorld0, tanNormal51_g141 ), dot( tanToWorld1, tanNormal51_g141 ), dot( tanToWorld2, tanNormal51_g141 ) );
				float4 appendResult63_g141 = (float4(worldNormal51_g141 , 0.0));
				float4 temp_output_57_0_g141 = mul( GetWorldToObjectMatrix(), appendResult63_g141 );
				float4 temp_cast_21 = (2.0).xxxx;
				float4 temp_output_4_0_g141 = pow( abs( temp_output_57_0_g141 ) , temp_cast_21 );
				float4 break6_g141 = temp_output_4_0_g141;
				float4 projNormal10_g141 = ( temp_output_4_0_g141 / ( break6_g141.x + break6_g141.y + break6_g141.z ) );
				float4 appendResult62_g141 = (float4(PositionWS , 1.0));
				float4 break26_g141 = mul( GetWorldToObjectMatrix(), appendResult62_g141 );
				float2 appendResult27_g141 = (float2(break26_g141.z , break26_g141.y));
				float4 nSign18_g141 = sign( temp_output_57_0_g141 );
				float4 break20_g141 = nSign18_g141;
				float2 appendResult21_g141 = (float2(break20_g141.x , 1.0));
				float temp_output_29_0_g141 = _LavaMaskTiling;
				float2 temp_output_65_0_g141 = float2( 0,0 );
				float2 appendResult32_g141 = (float2(break26_g141.x , break26_g141.z));
				float2 appendResult22_g141 = (float2(break20_g141.y , 1.0));
				float2 appendResult34_g141 = (float2(break26_g141.x , break26_g141.y));
				float2 appendResult25_g141 = (float2(-break20_g141.z , 1.0));
				float lavaMaskMap229 = saturate( ( ( projNormal10_g141.x * tex2D( _HeightMap, ( ( appendResult27_g141 * appendResult21_g141 * temp_output_29_0_g141 ) + temp_output_65_0_g141 ) ) ) + ( projNormal10_g141.y * tex2D( _HeightMap, ( ( temp_output_29_0_g141 * appendResult32_g141 * appendResult22_g141 ) + temp_output_65_0_g141 ) ) ) + ( projNormal10_g141.z * tex2D( _HeightMap, ( temp_output_65_0_g141 + ( temp_output_29_0_g141 * appendResult34_g141 * appendResult25_g141 ) ) ) ) ) ).r;
				float dotResult254 = dot( ase_viewDirTS , normalUnpacked196 );
				float lavaMask272 = saturate( ( magmaDetial234.r + ( saturate( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - lavaMaskMap229 ) ) ) , _LavaMaskFactorsX ) ) * _LavaMaskFactorsY ) ) * saturate( ( saturate( pow( max( 0.0 , dotResult254 ) , _LavaMaskPower ) ) * _LavaMaskBoost ) ) ) ) );
				float4 lerpResult274 = lerp( _MagmaColorMin , _MagmaColorMax , lavaMask272);
				float4 lavaColor277 = ( saturate( ( ( projNormal10_g129.x * tex2D( _DistortionMap, ( ( appendResult27_g129 * appendResult21_g129 * temp_output_29_0_g129 ) + temp_output_65_0_g129 ) ) ) + ( projNormal10_g129.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g129 * appendResult32_g129 * appendResult22_g129 ) + temp_output_65_0_g129 ) ) ) + ( projNormal10_g129.z * tex2D( _DistortionMap, ( temp_output_65_0_g129 + ( temp_output_29_0_g129 * appendResult34_g129 * appendResult25_g129 ) ) ) ) ) ) * lerpResult274 * _MagmaGlow );
				

				float3 BaseColor = temp_cast_0;
				float3 Normal = normalUnpacked196;
				float3 Specular = temp_output_204_0.rgb;
				float Metallic = 0;
				float Smoothness = temp_output_206_0;
				float Occlusion = 1;
				float3 Emission = ( saturate( ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g121 ) * _ScatterStretch ) ) * _ScatterColor * ase_lightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( baseColor213 + ( temp_output_306_0 * fresnel268 ) ) ) ) + ( ( lavaColor277 * lavaMask272 ) * saturate( ( _LavaPasstrough + temp_output_306_0 ) ) ) ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = ClipPos.z;
				#endif

				#if defined( _ALPHATEST_ON )
					AlphaDiscard( Alpha, AlphaClipThreshold );
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_CHANGES_WORLD_POS)
					ShadowCoord = TransformWorldToShadowCoord( PositionWS );
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = PositionWS;
				inputData.positionCS = float4( input.positionCS.xy, ClipPos.zw / ClipPos.w );
				inputData.normalizedScreenSpaceUV = ScreenPosNorm.xy;
				inputData.shadowCoord = ShadowCoord;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( TangentWS, BitangentWS, NormalWS ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = NormalWS;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( ViewDirWS );

				#ifdef ASE_FOG
					// @diogo: no fog applied in GBuffer
				#endif
				#ifdef _ADDITIONAL_LIGHTS_VERTEX
					inputData.vertexLighting = input.fogFactorAndVertexLight.yzw;
				#endif

				#if defined( ENABLE_TERRAIN_PERPIXEL_NORMAL )
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = input.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(input.lightmapUVOrVertexSH.xy, input.dynamicLightmapUV.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.lightmapUVOrVertexSH.xy);
				#elif !defined(LIGHTMAP_ON) && (defined(PROBE_VOLUMES_L1) || defined(PROBE_VOLUMES_L2))
					inputData.bakedGI = SAMPLE_GI(SH,
						GetAbsolutePositionWS(inputData.positionWS),
						inputData.normalWS,
						inputData.viewDirectionWS,
						input.positionCS.xy,
						input.probeOcclusion,
						inputData.shadowMask);
				#else
					inputData.bakedGI = SAMPLE_GI(input.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.lightmapUVOrVertexSH.xy);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = input.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = input.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
					#if defined(USE_APV_PROBE_OCCLUSION)
						inputData.probeOcclusion = input.probeOcclusion;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(input.positionCS,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);

				color.rgb = GlobalIllumination(brdfData, (BRDFData)0, 0,
                              inputData.bakedGI, Occlusion, inputData.positionWS,
                              inputData.normalWS, inputData.viewDirectionWS, inputData.normalizedScreenSpaceUV);

				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				return PackGBuffersBRDFData(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			#define ASE_GEOMETRY
			#define _SPECULAR_SETUP 1
			#define _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 170200


			#pragma vertex vert
			#pragma fragment frag

			#if defined( _SPECULAR_SETUP ) && defined( ASE_LIGHTING_SIMPLE )
				#if defined( _SPECULARHIGHLIGHTS_OFF )
					#undef _SPECULAR_COLOR
				#else
					#define _SPECULAR_COLOR
				#endif
			#endif

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _NormalMap_ST;
			float4 _FresnelColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _SpecularColor;
			float _FrenselMult;
			float _LavaMaskBoost;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _DistortionUVTiling;
			float _LavaMaskPower;
			float _LavaMaskFactorsY;
			float _DistortionFactor;
			float _LavaMaskFactorsX;
			float _FresnelPower;
			float _LavaMaskTiling;
			float _MagmaTiling;
			float _MagmaPower;
			float _DistortionUVSpeed;
			float _MagmaBoost;
			float _LavaFactorsY;
			float _MagmaGlow;
			float _NormalTiling;
			float _NormalScale;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _Smoothness;
			float _LavaFactorsZ;
			float _ScatterCenterShift;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _ScatterStretch;
			float _LavaPasstrough;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction(Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag( PackedVaryings input
				#if defined( ASE_DEPTH_WRITE_ON )
				,out float outputDepth : ASE_SV_DEPTH
				#endif
				 ) : SV_Target
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				return half4( _ObjectId, _PassValue, 1.0, 1.0 );
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			#define ASE_GEOMETRY
			#define _SPECULAR_SETUP 1
			#define _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 170200


			#pragma vertex vert
			#pragma fragment frag

			#if defined( _SPECULAR_SETUP ) && defined( ASE_LIGHTING_SIMPLE )
				#if defined( _SPECULARHIGHLIGHTS_OFF )
					#undef _SPECULAR_COLOR
				#else
					#define _SPECULAR_COLOR
				#endif
			#endif

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _NormalMap_ST;
			float4 _FresnelColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _SpecularColor;
			float _FrenselMult;
			float _LavaMaskBoost;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _DistortionUVTiling;
			float _LavaMaskPower;
			float _LavaMaskFactorsY;
			float _DistortionFactor;
			float _LavaMaskFactorsX;
			float _FresnelPower;
			float _LavaMaskTiling;
			float _MagmaTiling;
			float _MagmaPower;
			float _DistortionUVSpeed;
			float _MagmaBoost;
			float _LavaFactorsY;
			float _MagmaGlow;
			float _NormalTiling;
			float _NormalScale;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _Smoothness;
			float _LavaFactorsZ;
			float _ScatterCenterShift;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _ScatterStretch;
			float _LavaPasstrough;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag( PackedVaryings input
				#if defined( ASE_DEPTH_WRITE_ON )
				,out float outputDepth : ASE_SV_DEPTH
				#endif
				 ) : SV_Target
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				return unity_SelectionID;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "MotionVectors"
			Tags { "LightMode"="MotionVectors" }

			ColorMask RG

			HLSLPROGRAM

			#define ASE_GEOMETRY
			#define _SPECULAR_SETUP 1
			#define _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 170200


			#pragma vertex vert
			#pragma fragment frag

			#if defined( _SPECULAR_SETUP ) && defined( ASE_LIGHTING_SIMPLE )
				#if defined( _SPECULARHIGHLIGHTS_OFF )
					#undef _SPECULAR_COLOR
				#else
					#define _SPECULAR_COLOR
				#endif
			#endif

            #define SHADERPASS SHADERPASS_MOTION_VECTORS

            #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
				#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MotionVectorsCommon.hlsl"

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 positionOld : TEXCOORD4;
				#if _ADD_PRECOMPUTED_VELOCITY
					float3 alembicMotionVector : TEXCOORD5;
				#endif
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 positionCSNoJitter : TEXCOORD0;
				float4 previousPositionCSNoJitter : TEXCOORD1;
				float3 positionWS : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _NormalMap_ST;
			float4 _FresnelColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _SpecularColor;
			float _FrenselMult;
			float _LavaMaskBoost;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _DistortionUVTiling;
			float _LavaMaskPower;
			float _LavaMaskFactorsY;
			float _DistortionFactor;
			float _LavaMaskFactorsX;
			float _FresnelPower;
			float _LavaMaskTiling;
			float _MagmaTiling;
			float _MagmaPower;
			float _DistortionUVSpeed;
			float _MagmaBoost;
			float _LavaFactorsY;
			float _MagmaGlow;
			float _NormalTiling;
			float _NormalScale;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _Smoothness;
			float _LavaFactorsZ;
			float _ScatterCenterShift;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _ScatterStretch;
			float _LavaPasstrough;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				#if defined(APPLICATION_SPACE_WARP_MOTION)
					output.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, input.positionOS));
					output.positionCS = output.positionCSNoJitter;
				#else
					output.positionCS = vertexInput.positionCS;
					output.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, input.positionOS));
				#endif

				float4 prevPos = ( unity_MotionVectorsParams.x == 1 ) ? float4( input.positionOld, 1 ) : input.positionOS;

				#if _ADD_PRECOMPUTED_VELOCITY
					prevPos = prevPos - float4(input.alembicMotionVector, 0);
				#endif

				output.previousPositionCSNoJitter = mul( _PrevViewProjMatrix, mul( UNITY_PREV_MATRIX_M, prevPos ) );

				output.positionWS = vertexInput.positionWS;

				// removed in ObjectMotionVectors.hlsl found in unity 6000.0.23 and higher
				//ApplyMotionVectorZBias( output.positionCS );
				return output;
			}

			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}

			half4 frag(	PackedVaryings input
				#if defined( ASE_DEPTH_WRITE_ON )
				,out float outputDepth : ASE_SV_DEPTH
				#endif
				 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(ASE_CHANGES_WORLD_POS)
					float3 positionOS = mul( GetWorldToObjectMatrix(),  float4( PositionWS, 1.0 ) ).xyz;
					float3 previousPositionWS = mul( GetPrevObjectToWorldMatrix(),  float4( positionOS, 1.0 ) ).xyz;
					input.positionCSNoJitter = mul( _NonJitteredViewProjMatrix, float4( PositionWS, 1.0 ) );
					input.previousPositionCSNoJitter = mul( _PrevViewProjMatrix, float4( previousPositionWS, 1.0 ) );
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				#if defined(APPLICATION_SPACE_WARP_MOTION)
					return float4( CalcAswNdcMotionVectorFromCsPositions( input.positionCSNoJitter, input.previousPositionCSNoJitter ), 1 );
				#else
					return float4( CalcNdcMotionVectorFromCsPositions( input.positionCSNoJitter, input.previousPositionCSNoJitter ), 0, 0 );
				#endif
			}
			ENDHLSL
		}

	
	}
	
	CustomEditor "UnityEditor.ShaderGraphLitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/InternalErrorShader"
}

/*ASEBEGIN
Version=19905
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;133;-492.5569,-703.8184;Float;False;Property;_DetailTiling;Detail Tiling;18;0;Create;True;0;0;0;False;0;False;2;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;203;2454.349,89.99643;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;271;5848.078,544.6608;Float;False;Property;_MagmaColorMax;Magma Color Max;40;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.4779411,0.278815,0.1124567,0;False;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;263;5347.742,71.1476;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;265;5342.673,-101.9409;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;213;3317.469,34.21539;Float;False;baseColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;253;5151.091,67.45267;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;200;2082.349,-97.0036;Float;False;Property;_SpecularColor;Specular Color;21;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.6397059,0.4562608,0.4562608,0;False;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;197;2434.336,9.572575;Inherit;False;196;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;272;5944.078,34.66083;Float;False;lavaMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;205;2040.56,271.9925;Float;False;Property;_SpecularBoost;Specular Boost;24;0;Create;True;0;0;0;False;0;False;0.03;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;206;2627.449,233.7819;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;204;2693.349,107.9964;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;267;5777.186,39.53471;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;180;1751.91,-286.7233;Float;False;Property;_LavaLow;Lava Low;25;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.3088233,0.1362455,0.1362455,0;False;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;176;1144.376,-310.1707;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;169;1323.91,-410.7233;Inherit;False;Linstep;-1;;119;aade3b0317e32b148b41ee41b85032e6;0;3;4;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;181;1755.91,-112.7233;Float;False;Property;_LavaMid;Lava Mid;26;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.2573528,0.003784606,0.003784606,0;False;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;178;1690.91,-427.7233;Float;False;detaledHeight01;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;199;2039.984,353.0802;Float;False;Property;_Smoothness;Smoothness;23;0;Create;True;0;0;0;False;0;False;0;0.921;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;236;3702.81,1125.339;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;256;4152.658,470.5074;Inherit;False;196;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;144;48.60071,-512.8726;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;175;1144.631,-382.3737;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;269;3886.583,1125.671;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;198;2088.854,96.48244;Inherit;False;146;detailTex;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;177;1532.91,-414.7233;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;266;5626.074,47.6591;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;212;2445.988,236.0645;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;184;1728.922,247.0016;Float;False;Property;_LavaFactorsZ;Lava Factors Z;30;0;Create;True;0;0;0;False;0;False;0;0.79;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;296;7251.182,20.07087;Inherit;False;ScatterColor;5;;120;5984f944e2b849e44aad6ac4d7027dc1;0;0;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;237;3459.81,1213.339;Inherit;False;235;detailX;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;280;6849.969,209.5274;Inherit;False;213;baseColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMaxOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;319;4551.637,246.6962;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;277;6605.116,345.3349;Float;False;lavaColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;243;3429.75,1124.092;Inherit;False;Fresnel;44;;127;f8c497a0c2d6d334f8e7138f24a77d5f;0;1;22;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;289;6899.482,709.0476;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;292;6436.51,592.8249;Float;False;Property;_LavaPasstrough;Lava Passtrough;38;0;Create;True;0;0;0;False;0;False;0.02;0.1;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;281;7302.269,212.0158;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;274;6193.078,431.6608;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CustomStandardSurface, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;185;2869.314,37.61211;Inherit;False;Specular;Tangent;6;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;293;6898.51,601.8249;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;282;6269.269,680.0158;Float;False;Constant;_Float1;Float 1;35;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;291;6760.51,597.8249;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;279;6638.116,433.3349;Inherit;False;272;lavaMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;299;6142.52,346.9752;Inherit;False;TriplanarUVDist;48;;128;01791187aaf871246af28f7438b407d3;0;0;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;233;3172.133,1119.562;Inherit;False;196;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;275;6401.116,346.3349;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;215;3184.727,719.5782;Float;True;Property;_MagmaMap;Magma Map;13;0;Create;True;0;0;0;False;0;False;None;7bfa2038811711f43b9b2a102f5b9ef7;False;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;182;1759.91,63.27673;Float;False;Property;_LavaHigh;Lava High;27;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.2499998,0.1992899,0.1764704,0;False;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;307;2956.723,-123.3205;Inherit;False;Blinn-Phong Light;0;;131;cf814dba44d007a4e958d2ddd5813da6;0;3;42;COLOR;0,0,0,0;False;52;FLOAT3;0,0,0;False;43;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT;57
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;217;3536.454,882.8323;Float;False;Property;_MagmaPower;Magma Power;41;0;Create;True;0;0;0;False;0;False;0;1.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;273;5872.078,720.6608;Inherit;False;272;lavaMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;260;4841.317,301.4274;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;179;2100.91,-260.7233;Inherit;False;Ramp3;-1;;133;d38b6eed89401a040a9f914ae79b3d2f;0;5;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;5;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;295;7893.51,223.8249;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;288;6547.596,888.4902;Inherit;False;268;fresnel;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;276;6194.116,557.3349;Float;False;Property;_MagmaGlow;Magma Glow;43;0;Create;True;0;0;0;False;0;False;0;613;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;268;4061.583,1119.671;Float;False;fresnel;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;270;5843.078,363.6608;Float;False;Property;_MagmaColorMin;Magma Color Min;39;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.4485294,0,0,0;False;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;290;6187.482,753.0476;Inherit;False;196;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;278;6858.116,342.3349;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;298;7664.51,189.8249;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;315;7690.349,-35.71765;Inherit;False;196;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;216;3189.567,922.8467;Float;False;Property;_MagmaTiling;Magma Tiling;19;0;Create;True;0;0;0;False;0;False;2;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;235;405.3693,-730.9871;Float;False;detailX;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;234;4620.982,740.1832;Float;False;magmaDetial;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;142;-489.3993,-518.8726;Float;True;Property;_HeightMap;Height Map;4;0;Create;True;0;0;0;False;0;False;None;05b697d04446b8845a75c99bfa391492;False;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;166;459.7019,-1127.488;Float;False;Constant;_Float0;Float 0;8;0;Create;True;0;0;0;False;0;False;5000;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;202;2037.349,193.9965;Float;False;Property;_Specular;Specular;22;0;Create;True;0;0;0;False;0;False;0.03;0.326;0.03;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.UnpackScaleNormalNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;195;597.0527,25.46639;Inherit;False;Tangent;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;264;5073.974,-102.2409;Inherit;False;234;magmaDetial;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;155;104.1018,-359.1874;Float;False;Property;_HeightDetail;Height Detail;33;0;Create;True;0;0;0;False;0;False;0;0.88;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;164;680.7016,-1063.788;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;1000;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;262;5153.317,302.4274;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;228;52.67383,-229.3097;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;194;346.3918,228.5305;Float;False;Property;_NormalScale;Normal Scale;15;0;Create;True;0;0;0;False;0;False;0;1.28;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;196;872.2377,18.50697;Float;False;normalUnpacked;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;191;-91.8899,221.7792;Float;False;Property;_NormalTiling;Normal Tiling;16;0;Create;True;0;0;0;False;0;False;0;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;192;-92.37891,20.9383;Float;True;Property;_NormalMap;Normal Map;14;0;Create;True;0;0;0;False;0;False;None;4610b58d5667c8b488023068867fe203;True;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;171;675.631,-375.3737;Float;False;Property;_LavaFactorsX;Lava Factors X;28;0;Create;True;0;0;0;False;0;False;0;0.728;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;134;518.6178,-903.6335;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.6;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;227;-474.9816,-180.0085;Float;False;Property;_LavaMaskTiling;Lava Mask Tiling;20;0;Create;True;0;0;0;False;0;False;2;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;132;-497.3967,-907.0871;Float;True;Property;_DetailMap;Detail Map;12;0;Create;True;0;0;0;False;0;False;None;7bfa2038811711f43b9b2a102f5b9ef7;False;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;143;-471.3993,-325.8726;Float;False;Property;_HeightTiling;Height Tiling;17;0;Create;True;0;0;0;False;0;False;2;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;163;184.1019,-1057.288;Float;False;Property;_DetailExp;Detail Exp;32;0;Create;True;0;0;0;False;0;False;0;0.87;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;146;898.4141,-916.097;Float;False;detailTex;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;172;672.3959,-207.8755;Float;False;Property;_LavaFactorsY;Lava Factors Y;29;0;Create;True;0;0;0;False;0;False;0;0.91;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;162;655.302,-585.3875;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;167;1008.302,-539.8874;Float;False;detaledHeight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;261;5000.317,301.4274;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;244;4029.651,61.21515;Inherit;False;229;lavaMaskMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;138;59.69622,-901.6342;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;314;7687.078,-206.6565;Inherit;False;Constant;_Float2;Float 2;38;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TriplanarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;193;167.8278,24.54628;Inherit;True;Spherical;Object;False;Top Texture 2;_TopTexture2;white;0;None;Mid Texture 2;_MidTexture2;white;0;None;Bot Texture 2;_BotTexture2;white;1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;249;4341.859,162.3618;Float;False;Property;_LavaMaskFactorsX;Lava Mask Factors X;34;0;Create;True;0;0;0;False;0;False;0;6.89;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;284;7111.569,345.1158;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMaxOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;318;4551.637,-54.3038;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;246;4255.617,66.51323;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;170;671.1091,-296.3696;Float;False;Property;_LavaDetail;Lava Detail;31;0;Create;True;0;0;0;False;0;False;0;0.593;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;250;4739.862,170.3618;Float;False;Property;_LavaMaskFactorsY;Lava Mask Factors Y;35;0;Create;True;0;0;0;False;0;False;0;4.12;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;160;819.102,-587.9873;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;174;969.6312,-244.3735;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;229;345.8156,-233.3071;Float;False;lavaMaskMap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;173;966.6312,-357.3737;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;252;4828.862,75.3618;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;255;4187.158,300.0071;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;147;405.3009,-591.5728;Inherit;False;146;detailTex;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;317;3705.856,530.9779;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;221;3948.454,723.8323;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;225;4370.931,745.8948;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;297;7489.897,177.2944;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;254;4422.158,305.0071;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;251;4992.862,80.3618;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;259;4731.317,419.4274;Float;False;Property;_LavaMaskBoost;Lava Mask Boost;37;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;258;4432.314,424.4274;Float;False;Property;_LavaMaskPower;Lava Mask Power;36;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;247;4429.86,70.3618;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;306;6500.714,710.3367;Inherit;False;Blinn-Phong Light;0;;137;cf814dba44d007a4e958d2ddd5813da6;0;3;42;COLOR;0,0,0,0;False;52;FLOAT3;0,0,0;False;43;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT;57
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;218;3885.454,825.8323;Float;False;Property;_MagmaBoost;Magma Boost;42;0;Create;True;0;0;0;False;0;False;0;888;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;157;461.6021,-476.1873;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;222;4126.454,720.8323;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;257;4685.317,301.4274;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;156;312.1019,-472.2874;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;248;4641.862,74.3618;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;139;220.4893,-901.5146;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;316;373.4872,-966.9308;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;220;3790.454,657.8323;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;153;715.0361,-916.0713;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;136;-212.9422,-903.2474;Inherit;False;Triplanar;-1;;139;61abc9e6202a1a94ab1548c8ccbc2e48;0;4;36;SAMPLER2D;0.0;False;29;FLOAT;0;False;2;FLOAT;2;False;65;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;141;-232.3993,-512.8726;Inherit;False;Triplanar;-1;;140;61abc9e6202a1a94ab1548c8ccbc2e48;0;4;36;SAMPLER2D;0.0;False;29;FLOAT;0;False;2;FLOAT;2;False;65;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;226;-212.4865,-231.9746;Inherit;False;Triplanar;-1;;141;61abc9e6202a1a94ab1548c8ccbc2e48;0;4;36;SAMPLER2D;0.0;False;29;FLOAT;0;False;2;FLOAT;2;False;65;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;214;3469.181,723.4182;Inherit;False;Triplanar;-1;;142;61abc9e6202a1a94ab1548c8ccbc2e48;0;4;36;SAMPLER2D;0.0;False;29;FLOAT;0;False;2;FLOAT;2;False;65;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;309;8113.301,-18.8024;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;17;FORGE3D/Planets HD/Lava;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;51;Category;0;0;  Instanced Terrain Normals;1;0;Lighting Model;0;0;Workflow;0;0;Surface;0;0;  Keep Alpha;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Alpha Clipping;1;0;  Use Shadow Threshold;0;0;Fragment Normal Space;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;Receive Shadows;1;0;Specular Highlights;2;0;Environment Reflections;2;0;Receive SSAO;1;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;  XR Motion Vectors;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position;1;0;Debug Display;0;0;Clear Coat;0;0;0;12;False;True;True;True;True;True;True;True;True;True;True;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;312;8113.301,-18.8024;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;311;8113.301,-18.8024;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;322;8113.301,41.1976;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;308;8113.301,-18.8024;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;6;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;320;8113.301,41.1976;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;321;8113.301,41.1976;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;True;12;d3d11;gles;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;switch2;webgpu;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;313;8113.301,-18.8024;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;310;8113.301,-18.8024;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;323;8113.301,41.1976;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;324;8113.301,81.1976;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;325;8113.301,91.1976;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;XRMotionVectors;0;11;XRMotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;True;1;False;;255;False;;1;False;;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;1;LightMode=XRMotionVectors;False;False;0;;0;0;Standard;0;False;0
WireConnection;203;0;198;0
WireConnection;203;1;202;0
WireConnection;203;2;200;0
WireConnection;203;3;205;0
WireConnection;263;0;253;0
WireConnection;263;1;262;0
WireConnection;265;0;264;0
WireConnection;213;0;307;0
WireConnection;253;0;251;0
WireConnection;272;0;267;0
WireConnection;206;0;212;0
WireConnection;206;1;199;0
WireConnection;204;0;203;0
WireConnection;267;0;266;0
WireConnection;176;0;174;0
WireConnection;169;4;167;0
WireConnection;169;2;175;0
WireConnection;169;3;176;0
WireConnection;178;0;177;0
WireConnection;236;0;243;0
WireConnection;236;1;237;0
WireConnection;144;0;141;0
WireConnection;175;0;173;0
WireConnection;269;0;236;0
WireConnection;177;0;169;0
WireConnection;266;0;265;0
WireConnection;266;1;263;0
WireConnection;212;0;198;0
WireConnection;319;1;254;0
WireConnection;277;0;275;0
WireConnection;243;22;233;0
WireConnection;289;0;306;0
WireConnection;289;1;288;0
WireConnection;281;0;280;0
WireConnection;281;1;289;0
WireConnection;274;0;270;0
WireConnection;274;1;271;0
WireConnection;274;2;273;0
WireConnection;185;0;179;0
WireConnection;185;1;197;0
WireConnection;185;3;204;0
WireConnection;185;4;206;0
WireConnection;293;0;291;0
WireConnection;291;0;292;0
WireConnection;291;1;306;0
WireConnection;275;0;299;0
WireConnection;275;1;274;0
WireConnection;275;2;276;0
WireConnection;307;42;179;0
WireConnection;307;52;197;0
WireConnection;307;43;204;0
WireConnection;260;0;257;0
WireConnection;179;1;180;0
WireConnection;179;2;181;0
WireConnection;179;3;182;0
WireConnection;179;5;184;0
WireConnection;179;4;178;0
WireConnection;295;0;298;0
WireConnection;295;1;284;0
WireConnection;268;0;269;0
WireConnection;278;0;277;0
WireConnection;278;1;279;0
WireConnection;298;0;297;0
WireConnection;235;0;138;0
WireConnection;234;0;225;0
WireConnection;195;0;193;0
WireConnection;195;1;194;0
WireConnection;164;0;163;0
WireConnection;164;1;134;0
WireConnection;164;2;166;0
WireConnection;262;0;261;0
WireConnection;228;0;226;0
WireConnection;196;0;195;0
WireConnection;134;0;316;0
WireConnection;134;1;163;0
WireConnection;146;0;153;0
WireConnection;162;0;147;0
WireConnection;162;1;157;0
WireConnection;167;0;160;0
WireConnection;261;0;260;0
WireConnection;261;1;259;0
WireConnection;138;0;136;0
WireConnection;193;0;192;0
WireConnection;193;3;191;0
WireConnection;284;0;278;0
WireConnection;284;1;293;0
WireConnection;318;1;247;0
WireConnection;246;0;244;0
WireConnection;160;0;162;0
WireConnection;174;0;172;0
WireConnection;174;1;170;0
WireConnection;229;0;228;0
WireConnection;173;0;171;0
WireConnection;173;1;170;0
WireConnection;252;0;248;0
WireConnection;317;1;214;0
WireConnection;221;0;220;0
WireConnection;225;0;222;0
WireConnection;297;0;296;0
WireConnection;297;1;281;0
WireConnection;254;0;255;0
WireConnection;254;1;256;0
WireConnection;251;0;252;0
WireConnection;251;1;250;0
WireConnection;247;0;246;0
WireConnection;306;42;282;0
WireConnection;306;52;290;0
WireConnection;157;0;156;0
WireConnection;222;0;221;0
WireConnection;222;1;218;0
WireConnection;222;2;214;0
WireConnection;257;0;319;0
WireConnection;257;1;258;0
WireConnection;156;0;144;0
WireConnection;156;1;155;0
WireConnection;248;0;318;0
WireConnection;248;1;249;0
WireConnection;139;0;138;0
WireConnection;139;1;138;1
WireConnection;316;1;139;0
WireConnection;220;0;317;0
WireConnection;220;1;217;0
WireConnection;153;0;164;0
WireConnection;136;36;132;0
WireConnection;136;29;133;0
WireConnection;141;36;142;0
WireConnection;141;29;143;0
WireConnection;226;36;142;0
WireConnection;226;29;227;0
WireConnection;214;36;215;0
WireConnection;214;29;216;0
WireConnection;309;0;314;0
WireConnection;309;1;315;0
WireConnection;309;9;204;0
WireConnection;309;4;206;0
WireConnection;309;2;295;0
ASEEND*/
//CHKSM=2B32E1D32D030CC3F90338E06BAC0174BF93A1F1