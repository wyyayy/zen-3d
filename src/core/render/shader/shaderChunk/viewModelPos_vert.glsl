#if defined(USE_POINT_LIGHT) || defined(USE_SPOT_LIGHT) || defined(USE_NORMAL_MAP) || defined(USE_BUMPMAP) || defined(FLAT_SHADED) || (defined(USE_PHONG) && defined(USE_DIRECT_LIGHT)) || (defined(USE_PBR) && defined(USE_DIRECT_LIGHT))
    v_ViewModelPos = (u_View * u_Model * vec4(transformed, 1.0)).xyz;
#endif