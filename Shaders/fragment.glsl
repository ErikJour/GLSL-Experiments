varying vec2 vUv;

void main()
{
    //Pattern 3
    float strength = vUv.x;
    //Pattern 4
    float weight = vUv.y;
    //Pattern 5
    float upsideDownWeight = 1.0 - weight;
    //Pattern 6
    float fan = mod(weight * 10.0, 1.5);
    //Pattern 7
    float fanTwo = mod(weight * 10.0, 1.0);
    fanTwo = step(0.9, fanTwo); //Very intersting for modulations

    //Pattern 10
    float fanThree = mod(strength * 10.0, 1.0);
    fanThree = step(0.9, fanThree);

    //Pattern 11 - Grid
    float fanFour = step(0.8, mod(weight * 10.0, 1.0));
    fanFour -= step(0.6, mod(strength * 10.0, 1.0));

    gl_FragColor = vec4(fanFour, fanFour, fanFour, 1.0);
}