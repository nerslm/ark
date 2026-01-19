// Made with Amplify Shader Editor v1.9.9.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FORGE3D/Planets HD/Terrestrial"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		_GlobalBoost( "Global Boost", Float ) = 1
		_FresnelLandColor( "Fresnel Land Color", Color ) = ( 0.4558824, 0.4558824, 0.4558824, 1 )
		_FresnelLandPower( "Fresnel Land Power", Range( 0.003, 25 ) ) = 0.003
		_FrenselLandMult( "Frensel Land Mult", Range( 0, 10 ) ) = 0
		_FresnelWaterColor( "Fresnel Water Color", Color ) = ( 0.4558824, 0.4558824, 0.4558824, 1 )
		_FresnelWaterPower( "Fresnel Water Power", Range( 0.003, 25 ) ) = 0.003
		_FresnelWaterMult( "Fresnel Water Mult", Range( 0, 10 ) ) = 0
		_CityLightMap( "City Light Map", 2D ) = "white" {}
		_CityLightUVMap( "CityLight UV Map", 2D ) = "white" {}
		_CityLightMaskMap( "CityLight Mask Map", 2D ) = "white" {}
		_CityLightColor( "CityLight Color", Color ) = ( 0, 0, 0, 0 )
		_CityLightPopulation( "CityLight Population", Float ) = 0
		_ScatterMap( "Scatter Map", 2D ) = "white" {}
		_ScatterColor( "Scatter Color", Color ) = ( 0, 0, 0, 0 )
		_ScatterBoost( "Scatter Boost", Range( 0, 5 ) ) = 1
		_ScatterIndirect( "Scatter Indirect", Range( 0, 1 ) ) = 0
		_ScatterStretch( "Scatter Stretch", Range( -2, 2 ) ) = 0
		_ScatterCenterShift( "Scatter Center Shift", Range( -2, 2 ) ) = 0
		_WaterShoreFactor( "Water Shore Factor", Float ) = 0
		_WaterDetailFactor( "Water Detail Factor", Float ) = 0
		_WaterDetailBoost( "Water Detail Boost", Float ) = 0
		_WaterShallowColor( "Water Shallow Color", Color ) = ( 0, 0, 0, 0 )
		_WaterShoreColor( "Water Shore Color", Color ) = ( 0, 0, 0, 0 )
		_WaterDeepColor( "Water Deep Color", Color ) = ( 0, 0, 0, 0 )
		_WaterSpecularColor( "Water Specular Color", Color ) = ( 1, 1, 1, 1 )
		_WaterSpecular( "Water Specular", Range( 0.003, 1 ) ) = 0.003
		_WaterSmoothness( "Water Smoothness", Range( 0, 1 ) ) = 0
		_LandSpecular( "Land Specular", Range( 0.03, 1 ) ) = 0.03
		_LandSmoothness( "Land Smoothness", Range( 0, 1 ) ) = 0.03
		_NormalMap( "Normal Map", 2D ) = "white" {}
		_NormalTiling( "Normal Tiling", Float ) = 0
		_NormalFresnelScale( "Normal Fresnel Scale", Float ) = 0
		_NormalScale( "Normal Scale", Float ) = 0
		_HeightMap( "Height Map", 2D ) = "white" {}
		_HeightTiling( "Height Tiling", Float ) = 0
		_LandMask( "Land Mask", 2D ) = "white" {}
		_BaseColor( "Base Color", Color ) = ( 0.5220588, 0.5220588, 0.5220588, 0 )
		_DesertColor( "Desert Color", Color ) = ( 0.4779412, 0.4779412, 0.4779412, 1 )
		_DesertCoverage( "Desert Coverage", Range( 0, 1 ) ) = 1
		_DesertFactors( "Desert Factors", Range( 0, 50 ) ) = 0.5
		_VegetationColor( "Vegetation Color", Color ) = ( 0.4779412, 0.4779412, 0.4779412, 1 )
		_VegetationCoverage( "Vegetation Coverage", Range( 0, 1 ) ) = 1
		_VegetationFactors( "Vegetation Factors", Range( 0, 20 ) ) = 0.5
		_MountainColor( "Mountain Color", Color ) = ( 0.4779412, 0.4779412, 0.4779412, 1 )
		_MountainCoverage( "Mountain Coverage", Range( 0, 1 ) ) = 1
		_MountainFactors( "Mountain Factors", Range( 0, 50 ) ) = 0.5
		_Gradient( "Gradient", 2D ) = "white" {}
		_CloudsTop( "Clouds Top", 2D ) = "white" {}
		_CloudsMiddle( "Clouds Middle", 2D ) = "white" {}
		_CloudsBlendWeight( "Clouds Blend Weight", Range( -1000, 1000 ) ) = 0
		_CloudsTopSpeed( "Clouds Top Speed", Range( -0.02, 0.02 ) ) = 0
		_CloudsMiddleSpeed( "Clouds Middle Speed", Range( -0.02, 0.02 ) ) = 0
		_CloudsHeight( "Clouds Height", Float ) = 0.005
		_CloudsTint( "Clouds Tint", Color ) = ( 0, 0, 0, 0 )
		_CloudShadows( "Cloud Shadows", Range( 0, 1 ) ) = 0.03
		_CloudsOutput( "Clouds Output", Range( 0, 1 ) ) = 1
		_CloudsSpecularLerp( "Clouds Specular Lerp", Float ) = 9
		_CloudsSmoothnessLerp( "Clouds Smoothness  Lerp", Float ) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


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
			#define ASE_USING_SAMPLING_MACROS 1


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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS


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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _HeightMap_ST;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _CityLightUVMap_ST;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _LandMask_ST;
			float4 _BaseColor;
			float4 _FresnelWaterColor;
			float4 _NormalMap_ST;
			float4 _CloudsTint;
			float4 _Gradient_ST;
			float4 _CityLightMaskMap_ST;
			float4 _ScatterColor;
			float4 _CityLightColor;
			float4 _CloudsMiddle_ST;
			float4 _WaterSpecularColor;
			float4 _CloudsTop_ST;
			float _WaterSpecular;
			float _NormalTiling;
			float _NormalFresnelScale;
			float _CloudsSmoothnessLerp;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSmoothness;
			float _FresnelWaterPower;
			float _LandSmoothness;
			float _FresnelWaterMult;
			float _CloudsSpecularLerp;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailBoost;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterDetailFactor;
			float _WaterShoreFactor;
			float _CityLightPopulation;
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

			TEXTURE2D(_ScatterMap);
			SAMPLER(sampler_ScatterMap);
			TEXTURE2D(_CloudsTop);
			SAMPLER(sampler_CloudsTop);
			TEXTURE2D(_CloudsMiddle);
			SAMPLER(sampler_CloudsMiddle);
			TEXTURE2D(_Gradient);
			SAMPLER(sampler_Gradient);
			TEXTURE2D(_HeightMap);
			SAMPLER(sampler_HeightMap);
			TEXTURE2D(_LandMask);
			SAMPLER(sampler_LandMask);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_CityLightMaskMap);
			SAMPLER(sampler_CityLightMaskMap);
			TEXTURE2D(_CityLightMap);
			TEXTURE2D(_CityLightUVMap);
			SAMPLER(sampler_CityLightUVMap);
			SAMPLER(sampler_CityLightMap);


			float2 rotateUV1_g390( float time, float2 uv, float speed )
			{
					
					uv -= 0.5;
					float s = sin ( speed * time );
					float c = cos ( speed * time );
					float2x2 rotationMatrix = float2x2( c, -s, s, c);
					rotationMatrix *= 0.5;
					rotationMatrix += 0.5;
					rotationMatrix = rotationMatrix * 2 - 1;
					uv = mul ( uv, rotationMatrix );
					return uv + 0.5;
			}
			
			inline float4 TriplanarSampling5( TEXTURE2D(topTexMap), const float4 topST, SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling51( TEXTURE2D(topTexMap), const float4 topST, SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_normal = input.normalOS;
				output.ase_texcoord7.xy = input.texcoord1.xy;
				output.ase_texcoord7.zw = input.texcoord.xy;
				output.ase_texcoord8 = input.positionOS;

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

				float4 transform4_g384 = mul(GetObjectToWorldMatrix(),float4( input.ase_normal , 0.0 ));
				float4 normalizeResult6_g384 = normalize( transform4_g384 );
				float3 temp_output_1_0_g385 = normalizeResult6_g384.xyz;
				float3 normalizeResult7_g384 = normalize( _MainLightPosition.xyz );
				float dotResult4_g385 = dot( temp_output_1_0_g385 , normalizeResult7_g384 );
				float3 normalizeResult8_g384 = normalize( ViewDirWS );
				float dotResult7_g385 = dot( temp_output_1_0_g385 , normalizeResult8_g384 );
				float2 appendResult10_g385 = (float2(( ( dotResult4_g385 / 2.0 ) + 0.5 ) , dotResult7_g385));
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b ) + 1e-7;
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float time1_g390 = _TimeParameters.x;
				float2 uv2_CloudsTop = input.ase_texcoord7.xy * _CloudsTop_ST.xy + _CloudsTop_ST.zw;
				float2 uv1_g390 = uv2_CloudsTop;
				float speed1_g390 = _CloudsTopSpeed;
				float2 localrotateUV1_g390 = rotateUV1_g390( time1_g390 , uv1_g390 , speed1_g390 );
				float2 poleUV63_g389 = localrotateUV1_g390;
				float cloudPole76_g389 = SAMPLE_TEXTURE2D( _CloudsTop, sampler_CloudsTop, poleUV63_g389 ).r;
				float2 uv_CloudsMiddle = input.ase_texcoord7.zw * _CloudsMiddle_ST.xy + _CloudsMiddle_ST.zw;
				float2 break53_g389 = uv_CloudsMiddle;
				float2 appendResult55_g389 = (float2(( break53_g389.x + ( _CloudsMiddleSpeed * _TimeParameters.x ) ) , break53_g389.y));
				float2 bellyUV56_g389 = appendResult55_g389;
				float cloudBelly73_g389 = SAMPLE_TEXTURE2D( _CloudsMiddle, sampler_CloudsMiddle, bellyUV56_g389 ).r;
				float2 uv_Gradient = input.ase_texcoord7.zw * _Gradient_ST.xy + _Gradient_ST.zw;
				float gradientMap93_g389 = pow( max( SAMPLE_TEXTURE2D( _Gradient, sampler_Gradient, uv_Gradient ).r , 0.0 ) , _CloudsBlendWeight );
				float lerpResult25_g389 = lerp( cloudPole76_g389 , cloudBelly73_g389 , gradientMap93_g389);
				float cloudMix80_g389 = lerpResult25_g389;
				float4 temp_output_298_0 = saturate( ( cloudMix80_g389 * _CloudsTint * _CloudsOutput ) );
				float3 normalizeResult126_g389 = normalize( _MainLightPosition.xyz );
				float2 shadowUVPole47_g389 = (( _CloudsHeight * normalizeResult126_g389 )).xx;
				float cloudPoleShadow94_g389 = SAMPLE_TEXTURE2D( _CloudsTop, sampler_CloudsTop, ( poleUV63_g389 + shadowUVPole47_g389 ) ).r;
				float3x3 ase_worldToTangent = float3x3( TangentWS, BitangentWS, NormalWS );
				float3 normalizeResult36_g389 = normalize( mul( ase_worldToTangent, _MainLightPosition.xyz ) );
				float2 shadowUVBelly46_g389 = (( normalizeResult36_g389 * _CloudsHeight )).xx;
				float cloudBellyShadow85_g389 = SAMPLE_TEXTURE2D( _CloudsMiddle, sampler_CloudsMiddle, ( shadowUVBelly46_g389 + bellyUV56_g389 ) ).r;
				float lerpResult95_g389 = lerp( cloudPoleShadow94_g389 , cloudBellyShadow85_g389 , ( gradientMap93_g389 + 0.1 ));
				float cloudMixShadow99_g389 = saturate( pow( max( 0.0 , ( 1.0 - lerpResult95_g389 ) ) , ( _CloudShadows * 50.0 ) ) );
				float temp_output_298_122 = cloudMixShadow99_g389;
				float4 triplanar5 = TriplanarSampling5( _HeightMap, _HeightMap_ST, sampler_HeightMap, input.ase_texcoord8.xyz, input.ase_normal, 5.0, _HeightTiling, 1.0, 0 );
				float4 height6 = triplanar5;
				float4 break16 = height6;
				float temp_output_10_0_g386 = break16.z;
				float lerpResult16_g386 = lerp( 0.0 , 1.0 , ( ( _DesertCoverage - ( break16.x * temp_output_10_0_g386 ) ) * _DesertFactors ));
				float4 lerpResult19_g386 = lerp( float4( ( _BaseColor * height6.x ).rgb , 0.0 ) , ( _DesertColor * temp_output_10_0_g386 ) , saturate( lerpResult16_g386 ));
				float lerpResult16_g387 = lerp( 0.0 , 1.0 , ( ( _VegetationCoverage - ( break16.x * break16.z ) ) * _VegetationFactors ));
				float4 lerpResult19_g387 = lerp( float4( saturate( lerpResult19_g386 ).rgb , 0.0 ) , ( _VegetationColor * break16.y ) , saturate( lerpResult16_g387 ));
				float lerpResult16_g391 = lerp( 0.0 , 1.0 , ( ( _MountainCoverage - break16.z ) * _MountainFactors ));
				float4 lerpResult19_g391 = lerp( float4( saturate( lerpResult19_g387 ).rgb , 0.0 ) , ( break16.x * _MountainColor ) , saturate( lerpResult16_g391 ));
				float4 temp_output_15_0 = saturate( lerpResult19_g391 );
				float4 break22 = height6;
				float depth11_g393 = saturate( ( pow( max( 0.0 , ( break22.x * break22.z ) ) , _WaterDetailFactor ) * _WaterDetailBoost ) );
				float4 lerpResult19_g393 = lerp( _WaterDeepColor , _WaterShallowColor , depth11_g393);
				float2 uv_LandMask = input.ase_texcoord7.zw * _LandMask_ST.xy + _LandMask_ST.zw;
				float4 tex2DNode2 = SAMPLE_TEXTURE2D( _LandMask, sampler_LandMask, uv_LandMask );
				float shoreMask16_g393 = saturate( pow( max( 0.0 , tex2DNode2.g ) , _WaterShoreFactor ) );
				float4 lerpResult23_g393 = lerp( ( _WaterShoreColor + lerpResult19_g393 ) , lerpResult19_g393 , shoreMask16_g393);
				float4 waterColor25_g393 = lerpResult23_g393;
				float4 lerpResult27_g393 = lerp( float4( temp_output_15_0.rgb , 0.0 ) , waterColor25_g393 , tex2DNode2.r);
				float3 tanToWorld0 = float3( TangentWS.x, BitangentWS.x, NormalWS.x );
				float3 tanToWorld1 = float3( TangentWS.y, BitangentWS.y, NormalWS.y );
				float3 tanToWorld2 = float3( TangentWS.z, BitangentWS.z, NormalWS.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - PositionWS ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - PositionWS ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - PositionWS ).z;
				float3 ase_viewDirTS = normalize( ase_viewVectorTS );
				float4 triplanar51 = TriplanarSampling51( _NormalMap, _NormalMap_ST, sampler_NormalMap, input.ase_texcoord8.xyz, input.ase_normal, 5.0, _NormalTiling, 1.0, 0 );
				float3 unpack71 = UnpackNormalScale( triplanar51, _NormalFresnelScale );
				unpack71.z = lerp( 1, unpack71.z, saturate(_NormalFresnelScale) );
				float3 fresnelNormalUnpacked73 = unpack71;
				float3 unpack52 = UnpackNormalScale( triplanar51, _NormalScale );
				unpack52.z = lerp( 1, unpack52.z, saturate(_NormalScale) );
				float3 normalUnpacked54 = unpack52;
				float3 lerpResult80 = lerp( fresnelNormalUnpacked73 , normalUnpacked54 , tex2DNode2.r);
				float3 normalizeResult5_g392 = normalize( lerpResult80 );
				float dotResult14_g392 = dot( ase_viewDirTS , normalizeResult5_g392 );
				float temp_output_37_0_g392 = max( 0.0 , saturate( ( 1.0 - dotResult14_g392 ) ) );
				float4 lerpResult32_g392 = lerp( ( ( saturate( pow( temp_output_37_0_g392 , _FresnelLandPower ) ) * _FrenselLandMult ) * _FresnelLandColor ) , ( ( saturate( pow( temp_output_37_0_g392 , _FresnelWaterPower ) ) * _FresnelWaterMult ) * _FresnelWaterColor ) , tex2DNode2.r);
				
				float4 normalizeResult60 = normalize( float4( 0, 0, 1, 0 ) );
				float4 lerpResult66 = lerp( float4( normalUnpacked54 , 0.0 ) , normalizeResult60 , tex2DNode2.r);
				float4 lerpResult192 = lerp( lerpResult66 , float4( 0, 0, 1, 0 ) , ( 1.0 - temp_output_298_122 ));
				float4 normalizeResult220 = normalize( lerpResult192 );
				
				float4 lerpResult47 = lerp( ( temp_output_15_0 * _LandSpecular ) , saturate( ( _WaterSpecular * ( depth11_g393 + 0.1 ) * _WaterSpecularColor ) ) , tex2DNode2.r);
				float4 temp_cast_15 = (_CloudsSpecularLerp).xxxx;
				float temp_output_187_0 = (temp_output_298_0).r;
				float4 lerpResult185 = lerp( lerpResult47 , temp_cast_15 , temp_output_187_0);
				
				float lerpResult48 = lerp( ( _LandSmoothness * ( break16.x + break16.y + break16.z ) ) , _WaterSmoothness , tex2DNode2.r);
				float temp_output_95_0 = saturate( lerpResult48 );
				float lerpResult189 = lerp( temp_output_95_0 , _CloudsSmoothnessLerp , ( temp_output_95_0 * temp_output_187_0 ));
				
				float2 uv_CityLightMaskMap = input.ase_texcoord7.zw * _CityLightMaskMap_ST.xy + _CityLightMaskMap_ST.zw;
				float mask19_g382 = SAMPLE_TEXTURE2D( _CityLightMaskMap, sampler_CityLightMaskMap, uv_CityLightMaskMap ).r;
				float2 uv_CityLightUVMap = input.ase_texcoord7.zw * _CityLightUVMap_ST.xy + _CityLightUVMap_ST.zw;
				float4 tex2DNode12_g382 = SAMPLE_TEXTURE2D( _CityLightUVMap, sampler_CityLightUVMap, uv_CityLightUVMap );
				float2 appendResult20_g382 = (float2(tex2DNode12_g382.r , tex2DNode12_g382.g));
				float2 detailUV21_g382 = appendResult20_g382;
				float cityLightMap24_g382 = ( mask19_g382 * SAMPLE_TEXTURE2D( _CityLightMap, sampler_CityLightMap, detailUV21_g382 ).r );
				float3 lerpResult5_g383 = lerp( _MainLightPosition.xyz , ( _MainLightPosition.xyz - PositionWS ) , _MainLightPosition.w);
				float3 normalizeResult6_g383 = normalize( lerpResult5_g383 );
				float dotResult1_g383 = dot( normalizeResult6_g383 , NormalWS );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoord );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float temp_output_30_0_g382 = ( 1.0 - saturate( ( dotResult1_g383 * ase_lightAtten ) ) );
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( SAMPLE_TEXTURE2D( _ScatterMap, sampler_ScatterMap, ( ( _ScatterCenterShift + appendResult10_g385 ) * _ScatterStretch ) ) * _ScatterColor * ase_lightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( temp_output_298_0 + ( temp_output_298_122 * saturate( ( saturate( ( _GlobalBoost * lerpResult27_g393 ) ) + saturate( ( float4( ase_lightColor.rgb , 0.0 ) * lerpResult32_g392 ) ) ) ) ) ) ).rgb;
				float3 Normal = normalizeResult220.xyz;
				float3 Specular = ( temp_output_298_122 * lerpResult185 ).rgb;
				float Metallic = 0;
				float Smoothness = ( temp_output_298_122 * lerpResult189 );
				float Occlusion = 1;
				float3 Emission = ( temp_output_298_122 * ( _CityLightColor * pow( max( 0.0 , cityLightMap24_g382 ) , ( 1.0 / _CityLightPopulation ) ) * ( 1.0 - tex2DNode2.r ) * saturate( ( temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 ) ) ) ).rgb;
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
			#define ASE_USING_SAMPLING_MACROS 1


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
			float4 _HeightMap_ST;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _CityLightUVMap_ST;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _LandMask_ST;
			float4 _BaseColor;
			float4 _FresnelWaterColor;
			float4 _NormalMap_ST;
			float4 _CloudsTint;
			float4 _Gradient_ST;
			float4 _CityLightMaskMap_ST;
			float4 _ScatterColor;
			float4 _CityLightColor;
			float4 _CloudsMiddle_ST;
			float4 _WaterSpecularColor;
			float4 _CloudsTop_ST;
			float _WaterSpecular;
			float _NormalTiling;
			float _NormalFresnelScale;
			float _CloudsSmoothnessLerp;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSmoothness;
			float _FresnelWaterPower;
			float _LandSmoothness;
			float _FresnelWaterMult;
			float _CloudsSpecularLerp;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailBoost;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterDetailFactor;
			float _WaterShoreFactor;
			float _CityLightPopulation;
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
			#define ASE_USING_SAMPLING_MACROS 1


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
			float4 _HeightMap_ST;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _CityLightUVMap_ST;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _LandMask_ST;
			float4 _BaseColor;
			float4 _FresnelWaterColor;
			float4 _NormalMap_ST;
			float4 _CloudsTint;
			float4 _Gradient_ST;
			float4 _CityLightMaskMap_ST;
			float4 _ScatterColor;
			float4 _CityLightColor;
			float4 _CloudsMiddle_ST;
			float4 _WaterSpecularColor;
			float4 _CloudsTop_ST;
			float _WaterSpecular;
			float _NormalTiling;
			float _NormalFresnelScale;
			float _CloudsSmoothnessLerp;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSmoothness;
			float _FresnelWaterPower;
			float _LandSmoothness;
			float _FresnelWaterMult;
			float _CloudsSpecularLerp;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailBoost;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterDetailFactor;
			float _WaterShoreFactor;
			float _CityLightPopulation;
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
			#define ASE_USING_SAMPLING_MACROS 1

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
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS


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
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _HeightMap_ST;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _CityLightUVMap_ST;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _LandMask_ST;
			float4 _BaseColor;
			float4 _FresnelWaterColor;
			float4 _NormalMap_ST;
			float4 _CloudsTint;
			float4 _Gradient_ST;
			float4 _CityLightMaskMap_ST;
			float4 _ScatterColor;
			float4 _CityLightColor;
			float4 _CloudsMiddle_ST;
			float4 _WaterSpecularColor;
			float4 _CloudsTop_ST;
			float _WaterSpecular;
			float _NormalTiling;
			float _NormalFresnelScale;
			float _CloudsSmoothnessLerp;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSmoothness;
			float _FresnelWaterPower;
			float _LandSmoothness;
			float _FresnelWaterMult;
			float _CloudsSpecularLerp;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailBoost;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterDetailFactor;
			float _WaterShoreFactor;
			float _CityLightPopulation;
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

			TEXTURE2D(_ScatterMap);
			SAMPLER(sampler_ScatterMap);
			TEXTURE2D(_CloudsTop);
			SAMPLER(sampler_CloudsTop);
			TEXTURE2D(_CloudsMiddle);
			SAMPLER(sampler_CloudsMiddle);
			TEXTURE2D(_Gradient);
			SAMPLER(sampler_Gradient);
			TEXTURE2D(_HeightMap);
			SAMPLER(sampler_HeightMap);
			TEXTURE2D(_LandMask);
			SAMPLER(sampler_LandMask);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_CityLightMaskMap);
			SAMPLER(sampler_CityLightMaskMap);
			TEXTURE2D(_CityLightMap);
			TEXTURE2D(_CityLightUVMap);
			SAMPLER(sampler_CityLightUVMap);
			SAMPLER(sampler_CityLightMap);


			float2 rotateUV1_g390( float time, float2 uv, float speed )
			{
					
					uv -= 0.5;
					float s = sin ( speed * time );
					float c = cos ( speed * time );
					float2x2 rotationMatrix = float2x2( c, -s, s, c);
					rotationMatrix *= 0.5;
					rotationMatrix += 0.5;
					rotationMatrix = rotationMatrix * 2 - 1;
					uv = mul ( uv, rotationMatrix );
					return uv + 0.5;
			}
			
			inline float4 TriplanarSampling5( TEXTURE2D(topTexMap), const float4 topST, SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling51( TEXTURE2D(topTexMap), const float4 topST, SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 ase_tangentWS = TransformObjectToWorldDir( input.tangentOS.xyz );
				output.ase_texcoord4.xyz = ase_tangentWS;
				float3 ase_normalWS = TransformObjectToWorldNormal( input.normalOS );
				output.ase_texcoord5.xyz = ase_normalWS;
				float ase_tangentSign = input.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
				output.ase_texcoord6.xyz = ase_bitangentWS;
				
				output.ase_normal = input.normalOS;
				output.ase_texcoord3.xy = input.texcoord1.xy;
				output.ase_texcoord3.zw = input.texcoord.xy;
				output.ase_texcoord7 = input.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord4.w = 0;
				output.ase_texcoord5.w = 0;
				output.ase_texcoord6.w = 0;

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

				float4 transform4_g384 = mul(GetObjectToWorldMatrix(),float4( input.ase_normal , 0.0 ));
				float4 normalizeResult6_g384 = normalize( transform4_g384 );
				float3 temp_output_1_0_g385 = normalizeResult6_g384.xyz;
				float3 normalizeResult7_g384 = normalize( _MainLightPosition.xyz );
				float dotResult4_g385 = dot( temp_output_1_0_g385 , normalizeResult7_g384 );
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - PositionWS );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				float3 normalizeResult8_g384 = normalize( ase_viewDirWS );
				float dotResult7_g385 = dot( temp_output_1_0_g385 , normalizeResult8_g384 );
				float2 appendResult10_g385 = (float2(( ( dotResult4_g385 / 2.0 ) + 0.5 ) , dotResult7_g385));
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b ) + 1e-7;
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float time1_g390 = _TimeParameters.x;
				float2 uv2_CloudsTop = input.ase_texcoord3.xy * _CloudsTop_ST.xy + _CloudsTop_ST.zw;
				float2 uv1_g390 = uv2_CloudsTop;
				float speed1_g390 = _CloudsTopSpeed;
				float2 localrotateUV1_g390 = rotateUV1_g390( time1_g390 , uv1_g390 , speed1_g390 );
				float2 poleUV63_g389 = localrotateUV1_g390;
				float cloudPole76_g389 = SAMPLE_TEXTURE2D( _CloudsTop, sampler_CloudsTop, poleUV63_g389 ).r;
				float2 uv_CloudsMiddle = input.ase_texcoord3.zw * _CloudsMiddle_ST.xy + _CloudsMiddle_ST.zw;
				float2 break53_g389 = uv_CloudsMiddle;
				float2 appendResult55_g389 = (float2(( break53_g389.x + ( _CloudsMiddleSpeed * _TimeParameters.x ) ) , break53_g389.y));
				float2 bellyUV56_g389 = appendResult55_g389;
				float cloudBelly73_g389 = SAMPLE_TEXTURE2D( _CloudsMiddle, sampler_CloudsMiddle, bellyUV56_g389 ).r;
				float2 uv_Gradient = input.ase_texcoord3.zw * _Gradient_ST.xy + _Gradient_ST.zw;
				float gradientMap93_g389 = pow( max( SAMPLE_TEXTURE2D( _Gradient, sampler_Gradient, uv_Gradient ).r , 0.0 ) , _CloudsBlendWeight );
				float lerpResult25_g389 = lerp( cloudPole76_g389 , cloudBelly73_g389 , gradientMap93_g389);
				float cloudMix80_g389 = lerpResult25_g389;
				float4 temp_output_298_0 = saturate( ( cloudMix80_g389 * _CloudsTint * _CloudsOutput ) );
				float3 normalizeResult126_g389 = normalize( _MainLightPosition.xyz );
				float2 shadowUVPole47_g389 = (( _CloudsHeight * normalizeResult126_g389 )).xx;
				float cloudPoleShadow94_g389 = SAMPLE_TEXTURE2D( _CloudsTop, sampler_CloudsTop, ( poleUV63_g389 + shadowUVPole47_g389 ) ).r;
				float3 ase_tangentWS = input.ase_texcoord4.xyz;
				float3 ase_normalWS = input.ase_texcoord5.xyz;
				float3 ase_bitangentWS = input.ase_texcoord6.xyz;
				float3x3 ase_worldToTangent = float3x3( ase_tangentWS, ase_bitangentWS, ase_normalWS );
				float3 normalizeResult36_g389 = normalize( mul( ase_worldToTangent, _MainLightPosition.xyz ) );
				float2 shadowUVBelly46_g389 = (( normalizeResult36_g389 * _CloudsHeight )).xx;
				float cloudBellyShadow85_g389 = SAMPLE_TEXTURE2D( _CloudsMiddle, sampler_CloudsMiddle, ( shadowUVBelly46_g389 + bellyUV56_g389 ) ).r;
				float lerpResult95_g389 = lerp( cloudPoleShadow94_g389 , cloudBellyShadow85_g389 , ( gradientMap93_g389 + 0.1 ));
				float cloudMixShadow99_g389 = saturate( pow( max( 0.0 , ( 1.0 - lerpResult95_g389 ) ) , ( _CloudShadows * 50.0 ) ) );
				float temp_output_298_122 = cloudMixShadow99_g389;
				float4 triplanar5 = TriplanarSampling5( _HeightMap, _HeightMap_ST, sampler_HeightMap, input.ase_texcoord7.xyz, input.ase_normal, 5.0, _HeightTiling, 1.0, 0 );
				float4 height6 = triplanar5;
				float4 break16 = height6;
				float temp_output_10_0_g386 = break16.z;
				float lerpResult16_g386 = lerp( 0.0 , 1.0 , ( ( _DesertCoverage - ( break16.x * temp_output_10_0_g386 ) ) * _DesertFactors ));
				float4 lerpResult19_g386 = lerp( float4( ( _BaseColor * height6.x ).rgb , 0.0 ) , ( _DesertColor * temp_output_10_0_g386 ) , saturate( lerpResult16_g386 ));
				float lerpResult16_g387 = lerp( 0.0 , 1.0 , ( ( _VegetationCoverage - ( break16.x * break16.z ) ) * _VegetationFactors ));
				float4 lerpResult19_g387 = lerp( float4( saturate( lerpResult19_g386 ).rgb , 0.0 ) , ( _VegetationColor * break16.y ) , saturate( lerpResult16_g387 ));
				float lerpResult16_g391 = lerp( 0.0 , 1.0 , ( ( _MountainCoverage - break16.z ) * _MountainFactors ));
				float4 lerpResult19_g391 = lerp( float4( saturate( lerpResult19_g387 ).rgb , 0.0 ) , ( break16.x * _MountainColor ) , saturate( lerpResult16_g391 ));
				float4 temp_output_15_0 = saturate( lerpResult19_g391 );
				float4 break22 = height6;
				float depth11_g393 = saturate( ( pow( max( 0.0 , ( break22.x * break22.z ) ) , _WaterDetailFactor ) * _WaterDetailBoost ) );
				float4 lerpResult19_g393 = lerp( _WaterDeepColor , _WaterShallowColor , depth11_g393);
				float2 uv_LandMask = input.ase_texcoord3.zw * _LandMask_ST.xy + _LandMask_ST.zw;
				float4 tex2DNode2 = SAMPLE_TEXTURE2D( _LandMask, sampler_LandMask, uv_LandMask );
				float shoreMask16_g393 = saturate( pow( max( 0.0 , tex2DNode2.g ) , _WaterShoreFactor ) );
				float4 lerpResult23_g393 = lerp( ( _WaterShoreColor + lerpResult19_g393 ) , lerpResult19_g393 , shoreMask16_g393);
				float4 waterColor25_g393 = lerpResult23_g393;
				float4 lerpResult27_g393 = lerp( float4( temp_output_15_0.rgb , 0.0 ) , waterColor25_g393 , tex2DNode2.r);
				float3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, ase_normalWS.x );
				float3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, ase_normalWS.y );
				float3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, ase_normalWS.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - PositionWS ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - PositionWS ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - PositionWS ).z;
				float3 ase_viewDirTS = normalize( ase_viewVectorTS );
				float4 triplanar51 = TriplanarSampling51( _NormalMap, _NormalMap_ST, sampler_NormalMap, input.ase_texcoord7.xyz, input.ase_normal, 5.0, _NormalTiling, 1.0, 0 );
				float3 unpack71 = UnpackNormalScale( triplanar51, _NormalFresnelScale );
				unpack71.z = lerp( 1, unpack71.z, saturate(_NormalFresnelScale) );
				float3 fresnelNormalUnpacked73 = unpack71;
				float3 unpack52 = UnpackNormalScale( triplanar51, _NormalScale );
				unpack52.z = lerp( 1, unpack52.z, saturate(_NormalScale) );
				float3 normalUnpacked54 = unpack52;
				float3 lerpResult80 = lerp( fresnelNormalUnpacked73 , normalUnpacked54 , tex2DNode2.r);
				float3 normalizeResult5_g392 = normalize( lerpResult80 );
				float dotResult14_g392 = dot( ase_viewDirTS , normalizeResult5_g392 );
				float temp_output_37_0_g392 = max( 0.0 , saturate( ( 1.0 - dotResult14_g392 ) ) );
				float4 lerpResult32_g392 = lerp( ( ( saturate( pow( temp_output_37_0_g392 , _FresnelLandPower ) ) * _FrenselLandMult ) * _FresnelLandColor ) , ( ( saturate( pow( temp_output_37_0_g392 , _FresnelWaterPower ) ) * _FresnelWaterMult ) * _FresnelWaterColor ) , tex2DNode2.r);
				
				float2 uv_CityLightMaskMap = input.ase_texcoord3.zw * _CityLightMaskMap_ST.xy + _CityLightMaskMap_ST.zw;
				float mask19_g382 = SAMPLE_TEXTURE2D( _CityLightMaskMap, sampler_CityLightMaskMap, uv_CityLightMaskMap ).r;
				float2 uv_CityLightUVMap = input.ase_texcoord3.zw * _CityLightUVMap_ST.xy + _CityLightUVMap_ST.zw;
				float4 tex2DNode12_g382 = SAMPLE_TEXTURE2D( _CityLightUVMap, sampler_CityLightUVMap, uv_CityLightUVMap );
				float2 appendResult20_g382 = (float2(tex2DNode12_g382.r , tex2DNode12_g382.g));
				float2 detailUV21_g382 = appendResult20_g382;
				float cityLightMap24_g382 = ( mask19_g382 * SAMPLE_TEXTURE2D( _CityLightMap, sampler_CityLightMap, detailUV21_g382 ).r );
				float3 lerpResult5_g383 = lerp( _MainLightPosition.xyz , ( _MainLightPosition.xyz - PositionWS ) , _MainLightPosition.w);
				float3 normalizeResult6_g383 = normalize( lerpResult5_g383 );
				float dotResult1_g383 = dot( normalizeResult6_g383 , ase_normalWS );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoord );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float temp_output_30_0_g382 = ( 1.0 - saturate( ( dotResult1_g383 * ase_lightAtten ) ) );
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( SAMPLE_TEXTURE2D( _ScatterMap, sampler_ScatterMap, ( ( _ScatterCenterShift + appendResult10_g385 ) * _ScatterStretch ) ) * _ScatterColor * ase_lightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( temp_output_298_0 + ( temp_output_298_122 * saturate( ( saturate( ( _GlobalBoost * lerpResult27_g393 ) ) + saturate( ( float4( ase_lightColor.rgb , 0.0 ) * lerpResult32_g392 ) ) ) ) ) ) ).rgb;
				float3 Emission = ( temp_output_298_122 * ( _CityLightColor * pow( max( 0.0 , cityLightMap24_g382 ) , ( 1.0 / _CityLightPopulation ) ) * ( 1.0 - tex2DNode2.r ) * saturate( ( temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 ) ) ) ).rgb;
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
			#define ASE_USING_SAMPLING_MACROS 1


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

			#define ASE_NEEDS_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_POSITION


			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _HeightMap_ST;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _CityLightUVMap_ST;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _LandMask_ST;
			float4 _BaseColor;
			float4 _FresnelWaterColor;
			float4 _NormalMap_ST;
			float4 _CloudsTint;
			float4 _Gradient_ST;
			float4 _CityLightMaskMap_ST;
			float4 _ScatterColor;
			float4 _CityLightColor;
			float4 _CloudsMiddle_ST;
			float4 _WaterSpecularColor;
			float4 _CloudsTop_ST;
			float _WaterSpecular;
			float _NormalTiling;
			float _NormalFresnelScale;
			float _CloudsSmoothnessLerp;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSmoothness;
			float _FresnelWaterPower;
			float _LandSmoothness;
			float _FresnelWaterMult;
			float _CloudsSpecularLerp;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailBoost;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterDetailFactor;
			float _WaterShoreFactor;
			float _CityLightPopulation;
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

			TEXTURE2D(_ScatterMap);
			SAMPLER(sampler_ScatterMap);
			TEXTURE2D(_CloudsTop);
			SAMPLER(sampler_CloudsTop);
			TEXTURE2D(_CloudsMiddle);
			SAMPLER(sampler_CloudsMiddle);
			TEXTURE2D(_Gradient);
			SAMPLER(sampler_Gradient);
			TEXTURE2D(_HeightMap);
			SAMPLER(sampler_HeightMap);
			TEXTURE2D(_LandMask);
			SAMPLER(sampler_LandMask);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);


			float2 rotateUV1_g390( float time, float2 uv, float speed )
			{
					
					uv -= 0.5;
					float s = sin ( speed * time );
					float c = cos ( speed * time );
					float2x2 rotationMatrix = float2x2( c, -s, s, c);
					rotationMatrix *= 0.5;
					rotationMatrix += 0.5;
					rotationMatrix = rotationMatrix * 2 - 1;
					uv = mul ( uv, rotationMatrix );
					return uv + 0.5;
			}
			
			inline float4 TriplanarSampling5( TEXTURE2D(topTexMap), const float4 topST, SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling51( TEXTURE2D(topTexMap), const float4 topST, SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_TRANSFER_INSTANCE_ID( input, output );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float3 ase_tangentWS = TransformObjectToWorldDir( input.tangentOS.xyz );
				output.ase_texcoord2.xyz = ase_tangentWS;
				float3 ase_normalWS = TransformObjectToWorldNormal( input.normalOS );
				output.ase_texcoord3.xyz = ase_normalWS;
				float ase_tangentSign = input.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
				output.ase_texcoord4.xyz = ase_bitangentWS;
				
				output.ase_normal = input.normalOS;
				output.ase_texcoord1.xy = input.ase_texcoord1.xy;
				output.ase_texcoord1.zw = input.ase_texcoord.xy;
				output.ase_texcoord5 = input.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord2.w = 0;
				output.ase_texcoord3.w = 0;
				output.ase_texcoord4.w = 0;

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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord : TEXCOORD0;

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
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_texcoord = input.ase_texcoord;
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
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
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

				float4 transform4_g384 = mul(GetObjectToWorldMatrix(),float4( input.ase_normal , 0.0 ));
				float4 normalizeResult6_g384 = normalize( transform4_g384 );
				float3 temp_output_1_0_g385 = normalizeResult6_g384.xyz;
				float3 normalizeResult7_g384 = normalize( _MainLightPosition.xyz );
				float dotResult4_g385 = dot( temp_output_1_0_g385 , normalizeResult7_g384 );
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - PositionWS );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				float3 normalizeResult8_g384 = normalize( ase_viewDirWS );
				float dotResult7_g385 = dot( temp_output_1_0_g385 , normalizeResult8_g384 );
				float2 appendResult10_g385 = (float2(( ( dotResult4_g385 / 2.0 ) + 0.5 ) , dotResult7_g385));
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b ) + 1e-7;
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float time1_g390 = _TimeParameters.x;
				float2 uv2_CloudsTop = input.ase_texcoord1.xy * _CloudsTop_ST.xy + _CloudsTop_ST.zw;
				float2 uv1_g390 = uv2_CloudsTop;
				float speed1_g390 = _CloudsTopSpeed;
				float2 localrotateUV1_g390 = rotateUV1_g390( time1_g390 , uv1_g390 , speed1_g390 );
				float2 poleUV63_g389 = localrotateUV1_g390;
				float cloudPole76_g389 = SAMPLE_TEXTURE2D( _CloudsTop, sampler_CloudsTop, poleUV63_g389 ).r;
				float2 uv_CloudsMiddle = input.ase_texcoord1.zw * _CloudsMiddle_ST.xy + _CloudsMiddle_ST.zw;
				float2 break53_g389 = uv_CloudsMiddle;
				float2 appendResult55_g389 = (float2(( break53_g389.x + ( _CloudsMiddleSpeed * _TimeParameters.x ) ) , break53_g389.y));
				float2 bellyUV56_g389 = appendResult55_g389;
				float cloudBelly73_g389 = SAMPLE_TEXTURE2D( _CloudsMiddle, sampler_CloudsMiddle, bellyUV56_g389 ).r;
				float2 uv_Gradient = input.ase_texcoord1.zw * _Gradient_ST.xy + _Gradient_ST.zw;
				float gradientMap93_g389 = pow( max( SAMPLE_TEXTURE2D( _Gradient, sampler_Gradient, uv_Gradient ).r , 0.0 ) , _CloudsBlendWeight );
				float lerpResult25_g389 = lerp( cloudPole76_g389 , cloudBelly73_g389 , gradientMap93_g389);
				float cloudMix80_g389 = lerpResult25_g389;
				float4 temp_output_298_0 = saturate( ( cloudMix80_g389 * _CloudsTint * _CloudsOutput ) );
				float3 normalizeResult126_g389 = normalize( _MainLightPosition.xyz );
				float2 shadowUVPole47_g389 = (( _CloudsHeight * normalizeResult126_g389 )).xx;
				float cloudPoleShadow94_g389 = SAMPLE_TEXTURE2D( _CloudsTop, sampler_CloudsTop, ( poleUV63_g389 + shadowUVPole47_g389 ) ).r;
				float3 ase_tangentWS = input.ase_texcoord2.xyz;
				float3 ase_normalWS = input.ase_texcoord3.xyz;
				float3 ase_bitangentWS = input.ase_texcoord4.xyz;
				float3x3 ase_worldToTangent = float3x3( ase_tangentWS, ase_bitangentWS, ase_normalWS );
				float3 normalizeResult36_g389 = normalize( mul( ase_worldToTangent, _MainLightPosition.xyz ) );
				float2 shadowUVBelly46_g389 = (( normalizeResult36_g389 * _CloudsHeight )).xx;
				float cloudBellyShadow85_g389 = SAMPLE_TEXTURE2D( _CloudsMiddle, sampler_CloudsMiddle, ( shadowUVBelly46_g389 + bellyUV56_g389 ) ).r;
				float lerpResult95_g389 = lerp( cloudPoleShadow94_g389 , cloudBellyShadow85_g389 , ( gradientMap93_g389 + 0.1 ));
				float cloudMixShadow99_g389 = saturate( pow( max( 0.0 , ( 1.0 - lerpResult95_g389 ) ) , ( _CloudShadows * 50.0 ) ) );
				float temp_output_298_122 = cloudMixShadow99_g389;
				float4 triplanar5 = TriplanarSampling5( _HeightMap, _HeightMap_ST, sampler_HeightMap, input.ase_texcoord5.xyz, input.ase_normal, 5.0, _HeightTiling, 1.0, 0 );
				float4 height6 = triplanar5;
				float4 break16 = height6;
				float temp_output_10_0_g386 = break16.z;
				float lerpResult16_g386 = lerp( 0.0 , 1.0 , ( ( _DesertCoverage - ( break16.x * temp_output_10_0_g386 ) ) * _DesertFactors ));
				float4 lerpResult19_g386 = lerp( float4( ( _BaseColor * height6.x ).rgb , 0.0 ) , ( _DesertColor * temp_output_10_0_g386 ) , saturate( lerpResult16_g386 ));
				float lerpResult16_g387 = lerp( 0.0 , 1.0 , ( ( _VegetationCoverage - ( break16.x * break16.z ) ) * _VegetationFactors ));
				float4 lerpResult19_g387 = lerp( float4( saturate( lerpResult19_g386 ).rgb , 0.0 ) , ( _VegetationColor * break16.y ) , saturate( lerpResult16_g387 ));
				float lerpResult16_g391 = lerp( 0.0 , 1.0 , ( ( _MountainCoverage - break16.z ) * _MountainFactors ));
				float4 lerpResult19_g391 = lerp( float4( saturate( lerpResult19_g387 ).rgb , 0.0 ) , ( break16.x * _MountainColor ) , saturate( lerpResult16_g391 ));
				float4 temp_output_15_0 = saturate( lerpResult19_g391 );
				float4 break22 = height6;
				float depth11_g393 = saturate( ( pow( max( 0.0 , ( break22.x * break22.z ) ) , _WaterDetailFactor ) * _WaterDetailBoost ) );
				float4 lerpResult19_g393 = lerp( _WaterDeepColor , _WaterShallowColor , depth11_g393);
				float2 uv_LandMask = input.ase_texcoord1.zw * _LandMask_ST.xy + _LandMask_ST.zw;
				float4 tex2DNode2 = SAMPLE_TEXTURE2D( _LandMask, sampler_LandMask, uv_LandMask );
				float shoreMask16_g393 = saturate( pow( max( 0.0 , tex2DNode2.g ) , _WaterShoreFactor ) );
				float4 lerpResult23_g393 = lerp( ( _WaterShoreColor + lerpResult19_g393 ) , lerpResult19_g393 , shoreMask16_g393);
				float4 waterColor25_g393 = lerpResult23_g393;
				float4 lerpResult27_g393 = lerp( float4( temp_output_15_0.rgb , 0.0 ) , waterColor25_g393 , tex2DNode2.r);
				float3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, ase_normalWS.x );
				float3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, ase_normalWS.y );
				float3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, ase_normalWS.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - PositionWS ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - PositionWS ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - PositionWS ).z;
				float3 ase_viewDirTS = normalize( ase_viewVectorTS );
				float4 triplanar51 = TriplanarSampling51( _NormalMap, _NormalMap_ST, sampler_NormalMap, input.ase_texcoord5.xyz, input.ase_normal, 5.0, _NormalTiling, 1.0, 0 );
				float3 unpack71 = UnpackNormalScale( triplanar51, _NormalFresnelScale );
				unpack71.z = lerp( 1, unpack71.z, saturate(_NormalFresnelScale) );
				float3 fresnelNormalUnpacked73 = unpack71;
				float3 unpack52 = UnpackNormalScale( triplanar51, _NormalScale );
				unpack52.z = lerp( 1, unpack52.z, saturate(_NormalScale) );
				float3 normalUnpacked54 = unpack52;
				float3 lerpResult80 = lerp( fresnelNormalUnpacked73 , normalUnpacked54 , tex2DNode2.r);
				float3 normalizeResult5_g392 = normalize( lerpResult80 );
				float dotResult14_g392 = dot( ase_viewDirTS , normalizeResult5_g392 );
				float temp_output_37_0_g392 = max( 0.0 , saturate( ( 1.0 - dotResult14_g392 ) ) );
				float4 lerpResult32_g392 = lerp( ( ( saturate( pow( temp_output_37_0_g392 , _FresnelLandPower ) ) * _FrenselLandMult ) * _FresnelLandColor ) , ( ( saturate( pow( temp_output_37_0_g392 , _FresnelWaterPower ) ) * _FresnelWaterMult ) * _FresnelWaterColor ) , tex2DNode2.r);
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( SAMPLE_TEXTURE2D( _ScatterMap, sampler_ScatterMap, ( ( _ScatterCenterShift + appendResult10_g385 ) * _ScatterStretch ) ) * _ScatterColor * ase_lightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( temp_output_298_0 + ( temp_output_298_122 * saturate( ( saturate( ( _GlobalBoost * lerpResult27_g393 ) ) + saturate( ( float4( ase_lightColor.rgb , 0.0 ) * lerpResult32_g392 ) ) ) ) ) ) ).rgb;
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
			#define ASE_USING_SAMPLING_MACROS 1


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
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0


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
				float4 ase_texcoord1 : TEXCOORD1;
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
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _HeightMap_ST;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _CityLightUVMap_ST;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _LandMask_ST;
			float4 _BaseColor;
			float4 _FresnelWaterColor;
			float4 _NormalMap_ST;
			float4 _CloudsTint;
			float4 _Gradient_ST;
			float4 _CityLightMaskMap_ST;
			float4 _ScatterColor;
			float4 _CityLightColor;
			float4 _CloudsMiddle_ST;
			float4 _WaterSpecularColor;
			float4 _CloudsTop_ST;
			float _WaterSpecular;
			float _NormalTiling;
			float _NormalFresnelScale;
			float _CloudsSmoothnessLerp;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSmoothness;
			float _FresnelWaterPower;
			float _LandSmoothness;
			float _FresnelWaterMult;
			float _CloudsSpecularLerp;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailBoost;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterDetailFactor;
			float _WaterShoreFactor;
			float _CityLightPopulation;
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

			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_LandMask);
			SAMPLER(sampler_LandMask);
			TEXTURE2D(_CloudsTop);
			SAMPLER(sampler_CloudsTop);
			TEXTURE2D(_CloudsMiddle);
			SAMPLER(sampler_CloudsMiddle);
			TEXTURE2D(_Gradient);
			SAMPLER(sampler_Gradient);


			inline float4 TriplanarSampling51( TEXTURE2D(topTexMap), const float4 topST, SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			float2 rotateUV1_g390( float time, float2 uv, float speed )
			{
					
					uv -= 0.5;
					float s = sin ( speed * time );
					float c = cos ( speed * time );
					float2x2 rotationMatrix = float2x2( c, -s, s, c);
					rotationMatrix *= 0.5;
					rotationMatrix += 0.5;
					rotationMatrix = rotationMatrix * 2 - 1;
					uv = mul ( uv, rotationMatrix );
					return uv + 0.5;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_texcoord3 = input.positionOS;
				output.ase_normal = input.normalOS;
				output.ase_texcoord4.xy = input.texcoord.xy;
				output.ase_texcoord4.zw = input.ase_texcoord1.xy;
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
				float4 ase_texcoord1 : TEXCOORD1;

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
				output.texcoord = input.texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
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
				output.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
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

				float4 triplanar51 = TriplanarSampling51( _NormalMap, _NormalMap_ST, sampler_NormalMap, input.ase_texcoord3.xyz, input.ase_normal, 5.0, _NormalTiling, 1.0, 0 );
				float3 unpack52 = UnpackNormalScale( triplanar51, _NormalScale );
				unpack52.z = lerp( 1, unpack52.z, saturate(_NormalScale) );
				float3 normalUnpacked54 = unpack52;
				float4 normalizeResult60 = normalize( float4( 0, 0, 1, 0 ) );
				float2 uv_LandMask = input.ase_texcoord4.xy * _LandMask_ST.xy + _LandMask_ST.zw;
				float4 tex2DNode2 = SAMPLE_TEXTURE2D( _LandMask, sampler_LandMask, uv_LandMask );
				float4 lerpResult66 = lerp( float4( normalUnpacked54 , 0.0 ) , normalizeResult60 , tex2DNode2.r);
				float time1_g390 = _TimeParameters.x;
				float2 uv2_CloudsTop = input.ase_texcoord4.zw * _CloudsTop_ST.xy + _CloudsTop_ST.zw;
				float2 uv1_g390 = uv2_CloudsTop;
				float speed1_g390 = _CloudsTopSpeed;
				float2 localrotateUV1_g390 = rotateUV1_g390( time1_g390 , uv1_g390 , speed1_g390 );
				float2 poleUV63_g389 = localrotateUV1_g390;
				float3 normalizeResult126_g389 = normalize( _MainLightPosition.xyz );
				float2 shadowUVPole47_g389 = (( _CloudsHeight * normalizeResult126_g389 )).xx;
				float cloudPoleShadow94_g389 = SAMPLE_TEXTURE2D( _CloudsTop, sampler_CloudsTop, ( poleUV63_g389 + shadowUVPole47_g389 ) ).r;
				float3x3 ase_worldToTangent = float3x3( TangentWS, BitangentWS, NormalWS );
				float3 normalizeResult36_g389 = normalize( mul( ase_worldToTangent, _MainLightPosition.xyz ) );
				float2 shadowUVBelly46_g389 = (( normalizeResult36_g389 * _CloudsHeight )).xx;
				float2 uv_CloudsMiddle = input.ase_texcoord4.xy * _CloudsMiddle_ST.xy + _CloudsMiddle_ST.zw;
				float2 break53_g389 = uv_CloudsMiddle;
				float2 appendResult55_g389 = (float2(( break53_g389.x + ( _CloudsMiddleSpeed * _TimeParameters.x ) ) , break53_g389.y));
				float2 bellyUV56_g389 = appendResult55_g389;
				float cloudBellyShadow85_g389 = SAMPLE_TEXTURE2D( _CloudsMiddle, sampler_CloudsMiddle, ( shadowUVBelly46_g389 + bellyUV56_g389 ) ).r;
				float2 uv_Gradient = input.ase_texcoord4.xy * _Gradient_ST.xy + _Gradient_ST.zw;
				float gradientMap93_g389 = pow( max( SAMPLE_TEXTURE2D( _Gradient, sampler_Gradient, uv_Gradient ).r , 0.0 ) , _CloudsBlendWeight );
				float lerpResult95_g389 = lerp( cloudPoleShadow94_g389 , cloudBellyShadow85_g389 , ( gradientMap93_g389 + 0.1 ));
				float cloudMixShadow99_g389 = saturate( pow( max( 0.0 , ( 1.0 - lerpResult95_g389 ) ) , ( _CloudShadows * 50.0 ) ) );
				float temp_output_298_122 = cloudMixShadow99_g389;
				float4 lerpResult192 = lerp( lerpResult66 , float4( 0, 0, 1, 0 ) , ( 1.0 - temp_output_298_122 ));
				float4 normalizeResult220 = normalize( lerpResult192 );
				

				float3 Normal = normalizeResult220.xyz;
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
			#define ASE_USING_SAMPLING_MACROS 1


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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS


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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _HeightMap_ST;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _CityLightUVMap_ST;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _LandMask_ST;
			float4 _BaseColor;
			float4 _FresnelWaterColor;
			float4 _NormalMap_ST;
			float4 _CloudsTint;
			float4 _Gradient_ST;
			float4 _CityLightMaskMap_ST;
			float4 _ScatterColor;
			float4 _CityLightColor;
			float4 _CloudsMiddle_ST;
			float4 _WaterSpecularColor;
			float4 _CloudsTop_ST;
			float _WaterSpecular;
			float _NormalTiling;
			float _NormalFresnelScale;
			float _CloudsSmoothnessLerp;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSmoothness;
			float _FresnelWaterPower;
			float _LandSmoothness;
			float _FresnelWaterMult;
			float _CloudsSpecularLerp;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailBoost;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterDetailFactor;
			float _WaterShoreFactor;
			float _CityLightPopulation;
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

			TEXTURE2D(_ScatterMap);
			SAMPLER(sampler_ScatterMap);
			TEXTURE2D(_CloudsTop);
			SAMPLER(sampler_CloudsTop);
			TEXTURE2D(_CloudsMiddle);
			SAMPLER(sampler_CloudsMiddle);
			TEXTURE2D(_Gradient);
			SAMPLER(sampler_Gradient);
			TEXTURE2D(_HeightMap);
			SAMPLER(sampler_HeightMap);
			TEXTURE2D(_LandMask);
			SAMPLER(sampler_LandMask);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_CityLightMaskMap);
			SAMPLER(sampler_CityLightMaskMap);
			TEXTURE2D(_CityLightMap);
			TEXTURE2D(_CityLightUVMap);
			SAMPLER(sampler_CityLightUVMap);
			SAMPLER(sampler_CityLightMap);


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/GBufferOutput.hlsl"

			float2 rotateUV1_g390( float time, float2 uv, float speed )
			{
					
					uv -= 0.5;
					float s = sin ( speed * time );
					float c = cos ( speed * time );
					float2x2 rotationMatrix = float2x2( c, -s, s, c);
					rotationMatrix *= 0.5;
					rotationMatrix += 0.5;
					rotationMatrix = rotationMatrix * 2 - 1;
					uv = mul ( uv, rotationMatrix );
					return uv + 0.5;
			}
			
			inline float4 TriplanarSampling5( TEXTURE2D(topTexMap), const float4 topST, SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling51( TEXTURE2D(topTexMap), const float4 topST, SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) * topST.xy + topST.zw );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) * topST.xy + topST.zw );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) * topST.xy + topST.zw );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_normal = input.normalOS;
				output.ase_texcoord7.xy = input.texcoord1.xy;
				output.ase_texcoord7.zw = input.texcoord.xy;
				output.ase_texcoord8 = input.positionOS;
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

				float4 transform4_g384 = mul(GetObjectToWorldMatrix(),float4( input.ase_normal , 0.0 ));
				float4 normalizeResult6_g384 = normalize( transform4_g384 );
				float3 temp_output_1_0_g385 = normalizeResult6_g384.xyz;
				float3 normalizeResult7_g384 = normalize( _MainLightPosition.xyz );
				float dotResult4_g385 = dot( temp_output_1_0_g385 , normalizeResult7_g384 );
				float3 normalizeResult8_g384 = normalize( ViewDirWS );
				float dotResult7_g385 = dot( temp_output_1_0_g385 , normalizeResult8_g384 );
				float2 appendResult10_g385 = (float2(( ( dotResult4_g385 / 2.0 ) + 0.5 ) , dotResult7_g385));
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b ) + 1e-7;
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float time1_g390 = _TimeParameters.x;
				float2 uv2_CloudsTop = input.ase_texcoord7.xy * _CloudsTop_ST.xy + _CloudsTop_ST.zw;
				float2 uv1_g390 = uv2_CloudsTop;
				float speed1_g390 = _CloudsTopSpeed;
				float2 localrotateUV1_g390 = rotateUV1_g390( time1_g390 , uv1_g390 , speed1_g390 );
				float2 poleUV63_g389 = localrotateUV1_g390;
				float cloudPole76_g389 = SAMPLE_TEXTURE2D( _CloudsTop, sampler_CloudsTop, poleUV63_g389 ).r;
				float2 uv_CloudsMiddle = input.ase_texcoord7.zw * _CloudsMiddle_ST.xy + _CloudsMiddle_ST.zw;
				float2 break53_g389 = uv_CloudsMiddle;
				float2 appendResult55_g389 = (float2(( break53_g389.x + ( _CloudsMiddleSpeed * _TimeParameters.x ) ) , break53_g389.y));
				float2 bellyUV56_g389 = appendResult55_g389;
				float cloudBelly73_g389 = SAMPLE_TEXTURE2D( _CloudsMiddle, sampler_CloudsMiddle, bellyUV56_g389 ).r;
				float2 uv_Gradient = input.ase_texcoord7.zw * _Gradient_ST.xy + _Gradient_ST.zw;
				float gradientMap93_g389 = pow( max( SAMPLE_TEXTURE2D( _Gradient, sampler_Gradient, uv_Gradient ).r , 0.0 ) , _CloudsBlendWeight );
				float lerpResult25_g389 = lerp( cloudPole76_g389 , cloudBelly73_g389 , gradientMap93_g389);
				float cloudMix80_g389 = lerpResult25_g389;
				float4 temp_output_298_0 = saturate( ( cloudMix80_g389 * _CloudsTint * _CloudsOutput ) );
				float3 normalizeResult126_g389 = normalize( _MainLightPosition.xyz );
				float2 shadowUVPole47_g389 = (( _CloudsHeight * normalizeResult126_g389 )).xx;
				float cloudPoleShadow94_g389 = SAMPLE_TEXTURE2D( _CloudsTop, sampler_CloudsTop, ( poleUV63_g389 + shadowUVPole47_g389 ) ).r;
				float3x3 ase_worldToTangent = float3x3( TangentWS, BitangentWS, NormalWS );
				float3 normalizeResult36_g389 = normalize( mul( ase_worldToTangent, _MainLightPosition.xyz ) );
				float2 shadowUVBelly46_g389 = (( normalizeResult36_g389 * _CloudsHeight )).xx;
				float cloudBellyShadow85_g389 = SAMPLE_TEXTURE2D( _CloudsMiddle, sampler_CloudsMiddle, ( shadowUVBelly46_g389 + bellyUV56_g389 ) ).r;
				float lerpResult95_g389 = lerp( cloudPoleShadow94_g389 , cloudBellyShadow85_g389 , ( gradientMap93_g389 + 0.1 ));
				float cloudMixShadow99_g389 = saturate( pow( max( 0.0 , ( 1.0 - lerpResult95_g389 ) ) , ( _CloudShadows * 50.0 ) ) );
				float temp_output_298_122 = cloudMixShadow99_g389;
				float4 triplanar5 = TriplanarSampling5( _HeightMap, _HeightMap_ST, sampler_HeightMap, input.ase_texcoord8.xyz, input.ase_normal, 5.0, _HeightTiling, 1.0, 0 );
				float4 height6 = triplanar5;
				float4 break16 = height6;
				float temp_output_10_0_g386 = break16.z;
				float lerpResult16_g386 = lerp( 0.0 , 1.0 , ( ( _DesertCoverage - ( break16.x * temp_output_10_0_g386 ) ) * _DesertFactors ));
				float4 lerpResult19_g386 = lerp( float4( ( _BaseColor * height6.x ).rgb , 0.0 ) , ( _DesertColor * temp_output_10_0_g386 ) , saturate( lerpResult16_g386 ));
				float lerpResult16_g387 = lerp( 0.0 , 1.0 , ( ( _VegetationCoverage - ( break16.x * break16.z ) ) * _VegetationFactors ));
				float4 lerpResult19_g387 = lerp( float4( saturate( lerpResult19_g386 ).rgb , 0.0 ) , ( _VegetationColor * break16.y ) , saturate( lerpResult16_g387 ));
				float lerpResult16_g391 = lerp( 0.0 , 1.0 , ( ( _MountainCoverage - break16.z ) * _MountainFactors ));
				float4 lerpResult19_g391 = lerp( float4( saturate( lerpResult19_g387 ).rgb , 0.0 ) , ( break16.x * _MountainColor ) , saturate( lerpResult16_g391 ));
				float4 temp_output_15_0 = saturate( lerpResult19_g391 );
				float4 break22 = height6;
				float depth11_g393 = saturate( ( pow( max( 0.0 , ( break22.x * break22.z ) ) , _WaterDetailFactor ) * _WaterDetailBoost ) );
				float4 lerpResult19_g393 = lerp( _WaterDeepColor , _WaterShallowColor , depth11_g393);
				float2 uv_LandMask = input.ase_texcoord7.zw * _LandMask_ST.xy + _LandMask_ST.zw;
				float4 tex2DNode2 = SAMPLE_TEXTURE2D( _LandMask, sampler_LandMask, uv_LandMask );
				float shoreMask16_g393 = saturate( pow( max( 0.0 , tex2DNode2.g ) , _WaterShoreFactor ) );
				float4 lerpResult23_g393 = lerp( ( _WaterShoreColor + lerpResult19_g393 ) , lerpResult19_g393 , shoreMask16_g393);
				float4 waterColor25_g393 = lerpResult23_g393;
				float4 lerpResult27_g393 = lerp( float4( temp_output_15_0.rgb , 0.0 ) , waterColor25_g393 , tex2DNode2.r);
				float3 tanToWorld0 = float3( TangentWS.x, BitangentWS.x, NormalWS.x );
				float3 tanToWorld1 = float3( TangentWS.y, BitangentWS.y, NormalWS.y );
				float3 tanToWorld2 = float3( TangentWS.z, BitangentWS.z, NormalWS.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - PositionWS ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - PositionWS ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - PositionWS ).z;
				float3 ase_viewDirTS = normalize( ase_viewVectorTS );
				float4 triplanar51 = TriplanarSampling51( _NormalMap, _NormalMap_ST, sampler_NormalMap, input.ase_texcoord8.xyz, input.ase_normal, 5.0, _NormalTiling, 1.0, 0 );
				float3 unpack71 = UnpackNormalScale( triplanar51, _NormalFresnelScale );
				unpack71.z = lerp( 1, unpack71.z, saturate(_NormalFresnelScale) );
				float3 fresnelNormalUnpacked73 = unpack71;
				float3 unpack52 = UnpackNormalScale( triplanar51, _NormalScale );
				unpack52.z = lerp( 1, unpack52.z, saturate(_NormalScale) );
				float3 normalUnpacked54 = unpack52;
				float3 lerpResult80 = lerp( fresnelNormalUnpacked73 , normalUnpacked54 , tex2DNode2.r);
				float3 normalizeResult5_g392 = normalize( lerpResult80 );
				float dotResult14_g392 = dot( ase_viewDirTS , normalizeResult5_g392 );
				float temp_output_37_0_g392 = max( 0.0 , saturate( ( 1.0 - dotResult14_g392 ) ) );
				float4 lerpResult32_g392 = lerp( ( ( saturate( pow( temp_output_37_0_g392 , _FresnelLandPower ) ) * _FrenselLandMult ) * _FresnelLandColor ) , ( ( saturate( pow( temp_output_37_0_g392 , _FresnelWaterPower ) ) * _FresnelWaterMult ) * _FresnelWaterColor ) , tex2DNode2.r);
				
				float4 normalizeResult60 = normalize( float4( 0, 0, 1, 0 ) );
				float4 lerpResult66 = lerp( float4( normalUnpacked54 , 0.0 ) , normalizeResult60 , tex2DNode2.r);
				float4 lerpResult192 = lerp( lerpResult66 , float4( 0, 0, 1, 0 ) , ( 1.0 - temp_output_298_122 ));
				float4 normalizeResult220 = normalize( lerpResult192 );
				
				float4 lerpResult47 = lerp( ( temp_output_15_0 * _LandSpecular ) , saturate( ( _WaterSpecular * ( depth11_g393 + 0.1 ) * _WaterSpecularColor ) ) , tex2DNode2.r);
				float4 temp_cast_15 = (_CloudsSpecularLerp).xxxx;
				float temp_output_187_0 = (temp_output_298_0).r;
				float4 lerpResult185 = lerp( lerpResult47 , temp_cast_15 , temp_output_187_0);
				
				float lerpResult48 = lerp( ( _LandSmoothness * ( break16.x + break16.y + break16.z ) ) , _WaterSmoothness , tex2DNode2.r);
				float temp_output_95_0 = saturate( lerpResult48 );
				float lerpResult189 = lerp( temp_output_95_0 , _CloudsSmoothnessLerp , ( temp_output_95_0 * temp_output_187_0 ));
				
				float2 uv_CityLightMaskMap = input.ase_texcoord7.zw * _CityLightMaskMap_ST.xy + _CityLightMaskMap_ST.zw;
				float mask19_g382 = SAMPLE_TEXTURE2D( _CityLightMaskMap, sampler_CityLightMaskMap, uv_CityLightMaskMap ).r;
				float2 uv_CityLightUVMap = input.ase_texcoord7.zw * _CityLightUVMap_ST.xy + _CityLightUVMap_ST.zw;
				float4 tex2DNode12_g382 = SAMPLE_TEXTURE2D( _CityLightUVMap, sampler_CityLightUVMap, uv_CityLightUVMap );
				float2 appendResult20_g382 = (float2(tex2DNode12_g382.r , tex2DNode12_g382.g));
				float2 detailUV21_g382 = appendResult20_g382;
				float cityLightMap24_g382 = ( mask19_g382 * SAMPLE_TEXTURE2D( _CityLightMap, sampler_CityLightMap, detailUV21_g382 ).r );
				float3 lerpResult5_g383 = lerp( _MainLightPosition.xyz , ( _MainLightPosition.xyz - PositionWS ) , _MainLightPosition.w);
				float3 normalizeResult6_g383 = normalize( lerpResult5_g383 );
				float dotResult1_g383 = dot( normalizeResult6_g383 , NormalWS );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoord );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float temp_output_30_0_g382 = ( 1.0 - saturate( ( dotResult1_g383 * ase_lightAtten ) ) );
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( SAMPLE_TEXTURE2D( _ScatterMap, sampler_ScatterMap, ( ( _ScatterCenterShift + appendResult10_g385 ) * _ScatterStretch ) ) * _ScatterColor * ase_lightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( temp_output_298_0 + ( temp_output_298_122 * saturate( ( saturate( ( _GlobalBoost * lerpResult27_g393 ) ) + saturate( ( float4( ase_lightColor.rgb , 0.0 ) * lerpResult32_g392 ) ) ) ) ) ) ).rgb;
				float3 Normal = normalizeResult220.xyz;
				float3 Specular = ( temp_output_298_122 * lerpResult185 ).rgb;
				float Metallic = 0;
				float Smoothness = ( temp_output_298_122 * lerpResult189 );
				float Occlusion = 1;
				float3 Emission = ( temp_output_298_122 * ( _CityLightColor * pow( max( 0.0 , cityLightMap24_g382 ) , ( 1.0 / _CityLightPopulation ) ) * ( 1.0 - tex2DNode2.r ) * saturate( ( temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 ) ) ) ).rgb;
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
			#define ASE_USING_SAMPLING_MACROS 1


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
			float4 _HeightMap_ST;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _CityLightUVMap_ST;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _LandMask_ST;
			float4 _BaseColor;
			float4 _FresnelWaterColor;
			float4 _NormalMap_ST;
			float4 _CloudsTint;
			float4 _Gradient_ST;
			float4 _CityLightMaskMap_ST;
			float4 _ScatterColor;
			float4 _CityLightColor;
			float4 _CloudsMiddle_ST;
			float4 _WaterSpecularColor;
			float4 _CloudsTop_ST;
			float _WaterSpecular;
			float _NormalTiling;
			float _NormalFresnelScale;
			float _CloudsSmoothnessLerp;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSmoothness;
			float _FresnelWaterPower;
			float _LandSmoothness;
			float _FresnelWaterMult;
			float _CloudsSpecularLerp;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailBoost;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterDetailFactor;
			float _WaterShoreFactor;
			float _CityLightPopulation;
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
			#define ASE_USING_SAMPLING_MACROS 1


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
			float4 _HeightMap_ST;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _CityLightUVMap_ST;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _LandMask_ST;
			float4 _BaseColor;
			float4 _FresnelWaterColor;
			float4 _NormalMap_ST;
			float4 _CloudsTint;
			float4 _Gradient_ST;
			float4 _CityLightMaskMap_ST;
			float4 _ScatterColor;
			float4 _CityLightColor;
			float4 _CloudsMiddle_ST;
			float4 _WaterSpecularColor;
			float4 _CloudsTop_ST;
			float _WaterSpecular;
			float _NormalTiling;
			float _NormalFresnelScale;
			float _CloudsSmoothnessLerp;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSmoothness;
			float _FresnelWaterPower;
			float _LandSmoothness;
			float _FresnelWaterMult;
			float _CloudsSpecularLerp;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailBoost;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterDetailFactor;
			float _WaterShoreFactor;
			float _CityLightPopulation;
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
			#define ASE_USING_SAMPLING_MACROS 1


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
			float4 _HeightMap_ST;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _CityLightUVMap_ST;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _LandMask_ST;
			float4 _BaseColor;
			float4 _FresnelWaterColor;
			float4 _NormalMap_ST;
			float4 _CloudsTint;
			float4 _Gradient_ST;
			float4 _CityLightMaskMap_ST;
			float4 _ScatterColor;
			float4 _CityLightColor;
			float4 _CloudsMiddle_ST;
			float4 _WaterSpecularColor;
			float4 _CloudsTop_ST;
			float _WaterSpecular;
			float _NormalTiling;
			float _NormalFresnelScale;
			float _CloudsSmoothnessLerp;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSmoothness;
			float _FresnelWaterPower;
			float _LandSmoothness;
			float _FresnelWaterMult;
			float _CloudsSpecularLerp;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailBoost;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterDetailFactor;
			float _WaterShoreFactor;
			float _CityLightPopulation;
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
	
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/InternalErrorShader"
}

/*ASEBEGIN
Version=19905
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;4;-1576.536,-178.1983;Float;False;Property;_HeightTiling;Height Tiling;38;0;Create;True;0;0;0;False;0;False;0;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;44;227.1252,48.10492;Float;False;Property;_LandSpecular;Land Specular;31;0;Create;True;0;0;0;False;0;False;0.03;1;0.03;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;185;2805.667,-280.4904;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;191;3219.537,-215.0565;Float;False;Constant;_Vector2;Vector 2;19;0;Create;True;0;0;0;False;0;False;0,0,1,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;131;745.1375,330.9167;Float;False;Constant;_Vector0;Vector 0;19;0;Create;True;0;0;0;False;0;False;0,0,1,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;300;2057.312,-476.0628;Inherit;False;CityLights;8;;382;4cc89f4a87600d74dbfda0723672d233;0;1;17;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;67;500.7089,169.5665;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;230;3218.21,-421.8409;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;286;3620.391,-606.6197;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;189;2928.923,62.78754;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;287;3639.222,-673.3866;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;139;3271.188,-802.3339;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;285;4027.84,-356.6715;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;46;594.1252,-54.89508;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;231;3204.719,49.78511;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;187;2485.439,-173.1112;Inherit;False;FLOAT;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;75;635.043,-208.7202;Inherit;False;73;fresnelNormalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;95;1222.357,46.49732;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;291;3997.026,38.79366;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;283;3370.444,322.6773;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;284;3108.512,-238.5454;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;60;946.5662,333.408;Inherit;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;68;44.43475,188.9308;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;232;2556.178,-644.24;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;47;966.3252,-102.6951;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;188;2528.164,-347.4603;Inherit;False;Property;_CloudsSpecularLerp;Clouds Specular Lerp;65;0;Create;True;0;0;0;False;0;False;9;1.53;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;215;2724.415,177.2647;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;220;3700.905,-411.5891;Inherit;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;48;959.219,59.8451;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;192;3495.477,-402.1153;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;196;3085.296,-543.5886;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;45;227.1252,145.1049;Float;False;Property;_LandSmoothness;Land Smoothness;32;0;Create;True;0;0;0;False;0;False;0.03;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;66;1196.843,341.7189;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;190;2613.219,88.75598;Inherit;False;Property;_CloudsSmoothnessLerp;Clouds Smoothness  Lerp;66;0;Create;True;0;0;0;False;0;False;0;0.62;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;288;3974.769,-476.5096;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;289;1925.538,-414.879;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;140;3045.611,-847.1066;Inherit;False;ScatterColor;14;;384;5984f944e2b849e44aad6ac4d7027dc1;0;0;1;COLOR;0
Node;AmplifyShaderEditor.UnpackScaleNormalNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;52;-921.5544,168.696;Inherit;False;Tangent;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;292;2724.727,-842.2635;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.UnpackScaleNormalNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;71;-915.9163,331.573;Inherit;False;Tangent;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;53;-1237.554,391.696;Float;False;Property;_NormalScale;Normal Scale;36;0;Create;True;0;0;0;False;0;False;0;0.81;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;17;-375.2998,-241.896;Inherit;False;DesertColor;42;;386;1b595ba52fc886e48b4be4810312f928;0;3;3;FLOAT;0;False;10;FLOAT;0;False;6;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TriplanarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;51;-1323.452,168.0363;Inherit;True;Spherical;Object;False;Top Texture 1;_TopTexture1;white;0;None;Mid Texture 1;_MidTexture1;white;0;None;Bot Texture 1;_BotTexture1;white;1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;5;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;13;-51.60282,-171.6952;Inherit;False;VegetationColor;46;;387;7b054f74514e3c545b05ee9d3cc768b8;0;4;23;FLOAT;0;False;10;FLOAT;0;False;3;FLOAT;0;False;6;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;74;-1233.957,479.2798;Float;False;Property;_NormalFresnelScale;Normal Fresnel Scale;35;0;Create;True;0;0;0;False;0;False;0;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;50;-1577.052,283.4705;Float;False;Property;_NormalTiling;Normal Tiling;34;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;16;-710.702,-106.6947;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;49;-1585.307,65.96893;Float;True;Property;_NormalMap;Normal Map;33;0;Create;True;0;0;0;False;0;False;None;3c13bc84830f236458594e2f6cc9c04a;True;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;6;-945.5557,-295.0933;Float;False;height;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TriplanarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5;-1322.935,-290.9525;Inherit;True;Spherical;Object;False;Top Texture 0;_TopTexture0;white;0;None;Mid Texture 0;_MidTexture0;white;0;None;Bot Texture 0;_BotTexture0;white;1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;5;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3;-1584.791,-395.6999;Float;True;Property;_HeightMap;Height Map;37;0;Create;True;0;0;0;False;0;False;None;a01e51192e20ad542bf77849171a65d9;False;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1;-677.4996,-290.1661;Inherit;False;BaseColor;40;;388;436e5fd3b4e5f564d91908d8a8c53f20;0;1;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;22;282.4919,-484.8134;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;23;70.30082,-489.5881;Inherit;False;6;height;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2;233.8507,-327.3218;Inherit;True;Property;_LandMask;Land Mask;39;0;Create;True;0;0;0;False;0;False;-1;None;1744fab73973e9347836cd337c5a59d6;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;293;2510.973,-923.6171;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;298;1607.697,-912.4413;Inherit;False;Clouds;54;;389;b41fa152b94c44b4e9f91f67316d221d;0;1;127;FLOAT4;0,0,0,0;False;2;FLOAT;122;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;15;240.8973,-79.39526;Inherit;False;MountainColor;50;;391;4181dbe52ccd82c468b472a633e7f96c;0;3;3;FLOAT;0;False;10;FLOAT;0;False;6;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;70;1370.123,-319.8434;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;297;1049.029,-256.8683;Inherit;False;FresnelLandWater;1;;392;3e95808d42a13c34980842be780f16a4;0;2;24;FLOAT;0;False;22;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;127;1127.366,-474.9382;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;128;924.366,-489.9382;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;76;1522.043,-315.7202;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;301;587.622,-403.2938;Inherit;False;Water;21;;393;e187dfe8b39989f44abd5e4c0deac419;0;5;4;FLOAT;0;False;3;FLOAT;0;False;26;FLOAT;0;False;12;FLOAT;0;False;1;FLOAT3;0,0,0;False;3;COLOR;0;COLOR;28;FLOAT;35
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;55;862.8409,259.8816;Inherit;False;54;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;81;857.3555,583.1948;Inherit;False;73;fresnelNormalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;126;740.366,-503.9382;Float;False;Property;_GlobalBoost;Global Boost;0;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;73;-634.9438,326.6002;Float;False;fresnelNormalUnpacked;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;54;-649.0061,163.0985;Float;False;normalUnpacked;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;80;1198.739,499.9872;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;303;4112.003,-702.4219;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;True;12;d3d11;gles;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;switch2;webgpu;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;302;4112.003,-702.4219;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;211;4018.578,-843.326;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;209;4112.003,-762.4219;Float;False;True;-1;2;AmplifyShaderEditor.MaterialInspector;0;17;FORGE3D/Planets HD/Terrestrial;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;51;Category;0;0;  Instanced Terrain Normals;1;0;Lighting Model;0;0;Workflow;0;0;Surface;0;0;  Keep Alpha;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Alpha Clipping;1;0;  Use Shadow Threshold;0;0;Fragment Normal Space;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;Receive Shadows;1;0;Specular Highlights;2;0;Environment Reflections;2;0;Receive SSAO;1;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;  XR Motion Vectors;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position;1;0;Debug Display;0;0;Clear Coat;0;0;0;12;False;True;True;True;True;True;True;True;True;True;True;False;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;234;4018.578,-762.4219;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;6;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;210;4018.578,-843.326;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;213;4018.578,-843.326;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;304;4112.003,-702.4219;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;212;4018.578,-843.326;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;305;4112.003,-702.4219;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;306;4112.003,-662.4219;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;307;4112.003,-652.4219;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;XRMotionVectors;0;11;XRMotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;True;1;False;;255;False;;1;False;;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;1;LightMode=XRMotionVectors;False;False;0;;0;0;Standard;0;False;0
WireConnection;185;0;47;0
WireConnection;185;1;188;0
WireConnection;185;2;187;0
WireConnection;300;17;2;1
WireConnection;67;0;45;0
WireConnection;67;1;68;0
WireConnection;230;0;298;122
WireConnection;230;1;185;0
WireConnection;286;0;230;0
WireConnection;189;0;95;0
WireConnection;189;1;190;0
WireConnection;189;2;215;0
WireConnection;287;0;232;0
WireConnection;139;0;140;0
WireConnection;139;1;292;0
WireConnection;285;0;291;0
WireConnection;46;0;15;0
WireConnection;46;1;44;0
WireConnection;231;0;284;0
WireConnection;231;1;189;0
WireConnection;187;0;289;0
WireConnection;95;0;48;0
WireConnection;291;0;231;0
WireConnection;283;0;66;0
WireConnection;284;0;298;122
WireConnection;60;0;131;0
WireConnection;68;0;16;0
WireConnection;68;1;16;1
WireConnection;68;2;16;2
WireConnection;232;0;298;122
WireConnection;232;1;300;0
WireConnection;47;0;46;0
WireConnection;47;1;301;28
WireConnection;47;2;2;1
WireConnection;215;0;95;0
WireConnection;215;1;187;0
WireConnection;220;0;192;0
WireConnection;48;0;67;0
WireConnection;48;1;301;35
WireConnection;48;2;2;1
WireConnection;192;0;283;0
WireConnection;192;1;191;0
WireConnection;192;2;196;0
WireConnection;196;0;298;122
WireConnection;66;0;55;0
WireConnection;66;1;60;0
WireConnection;66;2;2;1
WireConnection;288;0;220;0
WireConnection;289;0;298;0
WireConnection;52;0;51;0
WireConnection;52;1;53;0
WireConnection;292;0;298;0
WireConnection;292;1;293;0
WireConnection;71;0;51;0
WireConnection;71;1;74;0
WireConnection;17;3;16;0
WireConnection;17;10;16;2
WireConnection;17;6;1;0
WireConnection;51;0;49;0
WireConnection;51;3;50;0
WireConnection;13;23;16;0
WireConnection;13;10;16;1
WireConnection;13;3;16;2
WireConnection;13;6;17;0
WireConnection;16;0;6;0
WireConnection;6;0;5;0
WireConnection;5;0;3;0
WireConnection;5;3;4;0
WireConnection;1;1;6;0
WireConnection;22;0;23;0
WireConnection;293;0;298;122
WireConnection;293;1;76;0
WireConnection;15;3;16;0
WireConnection;15;10;16;2
WireConnection;15;6;13;0
WireConnection;70;0;127;0
WireConnection;70;1;297;0
WireConnection;297;24;2;1
WireConnection;297;22;80;0
WireConnection;127;0;128;0
WireConnection;128;0;126;0
WireConnection;128;1;301;0
WireConnection;76;0;70;0
WireConnection;301;4;22;0
WireConnection;301;3;22;2
WireConnection;301;26;2;1
WireConnection;301;12;2;2
WireConnection;301;1;15;0
WireConnection;73;0;71;0
WireConnection;54;0;52;0
WireConnection;80;0;81;0
WireConnection;80;1;55;0
WireConnection;80;2;2;1
WireConnection;209;0;139;0
WireConnection;209;1;288;0
WireConnection;209;9;286;0
WireConnection;209;4;285;0
WireConnection;209;2;287;0
ASEEND*/
//CHKSM=785F1FA298246A5B17F5C8DF6E5F5AD2ECA3C69B