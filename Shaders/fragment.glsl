varying vec2 vUv;

float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.543123);
}

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

    //Pattern 14
    float barX = step(0.4, mod(strength * 10.0, 1.0));
    barX *= step(0.8, mod(weight * 10.0, 1.0));
    float barY = step(0.4, mod(weight * 10.0, 1.0));
    barY *= step(0.8, mod(strength * 10.0, 1.0));

    float newStrength = barX + barY;

    //Pattern 15
    float barFifteenX = step(0.4, mod(strength * 10.0 - 0.2, 1.0));
    barFifteenX *= step(0.8, mod(weight * 10.0, 1.0));

    float barFifteenY = step(0.4, mod(weight * 10.0 - 0.2, 1.0));
    barFifteenY *= step(0.8, mod(strength * 10.0, 1.0));

    float patternFifteen = barFifteenX + barFifteenY;

    //Pattern 16
    float patternSixteen = abs(vUv.x - 0.5);

    //Pattern 17
    float patternSeventeenX = abs(vUv.x - 0.5);
    float patternSeventeenY = abs(vUv.y - 0.5);
    float patternSeventeen = min(patternSeventeenX, patternSeventeenY);

    //Pattern 18
    float patternEighteenX = abs(vUv.x - 0.5);
    float patternEighteenY = abs(vUv.y - 0.5);
    float patternEighteen = max(patternEighteenX, patternEighteenY);

    //Pattern 19
    float patternNineteenX = abs(vUv.x - 0.5);
    float patternNineteenY = abs(vUv.y - 0.5);
    float patternNineteen = step(0.2, max(patternEighteenX, patternEighteenY));

    //Pattern 20
    float patternTwentyX = abs(vUv.x - 0.5);
    float patternTwentyY = abs(vUv.y - 0.5);
    float patternTwenty = step(0.4, max(patternEighteenX, patternEighteenY));

    //Pattern 21
    float round = floor(vUv.x * 10.0) / 10.0;

    //Pattern 22
    float roundSquare = floor(vUv.x * 10.0) / 10.0;
    roundSquare *= floor(vUv.y * 10.0) / 10.0;

    //Pattern 23
    float randomNoise = random(vUv);

    gl_FragColor = vec4(randomNoise, randomNoise, randomNoise, 1.0);
}