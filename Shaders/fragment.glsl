precision mediump float;

const float PI = 3.14159265359;

varying float vRandom;

//===================================
//Test
//===================================
uniform vec2 uResolution;

float plot (vec2 st, float pct) {
    return smoothstep(pct - 0.02, pct, st.y) - smoothstep(pct, pct + 0.02, st.y);
}

void main()
{
//    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);

    //===================================
    //Test
    //===================================
    vec2 st = gl_FragCoord.xy/uResolution;

    float y = pow(st.x, 5.0);

    vec3 color = vec3(y);

    float pct = plot(st, y);

    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    gl_FragColor = vec4(color, 1.0);


}