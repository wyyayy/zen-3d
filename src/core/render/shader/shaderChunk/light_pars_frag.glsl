#ifdef USE_AMBIENT_LIGHT
    #include <ambientlight_pars_frag>
#endif
#ifdef USE_DIRECT_LIGHT
    #include <directlight_pars_frag>
#endif
#ifdef USE_POINT_LIGHT
    #include <pointlight_pars_frag>
#endif
#ifdef USE_SPOT_LIGHT
    #include <spotlight_pars_frag>
#endif

#if defined(USE_PBR) && defined(USE_ENV_MAP)

    vec4 getLightProbeIndirectIrradiance(const in int maxMIPLevel) {
        // TODO: replace with properly filtered cubemaps and access the irradiance LOD level, be it the last LOD level
    	// of a specular cubemap, or just the default level of a specially created irradiance cubemap.

    	#ifdef TEXTURE_LOD_EXT

    		vec4 envMapColor = textureCubeLodEXT( envMap, v_EnvPos, float( maxMIPLevel ) );

    	#else

    		// force the bias high to get the last LOD level as it is the most blurred.
    		vec4 envMapColor = textureCube( envMap, v_EnvPos, float( maxMIPLevel ) );

    	#endif

        envMapColor = envMapTexelToLinear( envMapColor );

        return PI * envMapColor * u_EnvMap_Intensity;
    }

    // taken from here: http://casual-effects.blogspot.ca/2011/08/plausible-environment-lighting-in-two.html
    float getSpecularMIPLevel( const in float blinnShininessExponent, const in int maxMIPLevel ) {

    	//float envMapWidth = pow( 2.0, maxMIPLevelScalar );
    	//float desiredMIPLevel = log2( envMapWidth * sqrt( 3.0 ) ) - 0.5 * log2( pow2( blinnShininessExponent ) + 1.0 );

    	float maxMIPLevelScalar = float( maxMIPLevel );
    	float desiredMIPLevel = maxMIPLevelScalar - 0.79248 - 0.5 * log2( pow2( blinnShininessExponent ) + 1.0 );

    	// clamp to allowable LOD ranges.
    	return clamp( desiredMIPLevel, 0.0, maxMIPLevelScalar );

    }

    vec4 getLightProbeIndirectRadiance(const in float blinnShininessExponent, const in int maxMIPLevel) {
        float specularMIPLevel = getSpecularMIPLevel( blinnShininessExponent, maxMIPLevel );

        #ifdef TEXTURE_LOD_EXT

    		vec4 envMapColor = textureCubeLodEXT( envMap, v_EnvPos, specularMIPLevel );

    	#else

    		vec4 envMapColor = textureCube( envMap, v_EnvPos, specularMIPLevel );

    	#endif

        envMapColor = envMapTexelToLinear( envMapColor );

        return envMapColor * u_EnvMap_Intensity;
    }

#endif