varying vec2 vUv;

#define PI 3.1415926

float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.543123);
}

vec2 rotate(vec2 uv, float rotation, vec2 mid)
{
    return vec2(
        cos(rotation) * (uv.x -  mid.x) - sin(rotation) * (uv.y - mid.y) + mid.x,
        cos(rotation) * (uv.y -  mid.y) + sin(rotation) * (uv.x - mid.x) + mid.y
    );
}

void main()
{
    //Pattern 3
//    float strength = vUv.x;
//    //Pattern 4
//    float weight = vUv.y;
//    //Pattern 5
//    float upsideDownWeight = 1.0 - weight;
//    //Pattern 6
//    float fan = mod(weight * 10.0, 1.5);
//    //Pattern 7
//    float fanTwo = mod(weight * 10.0, 1.0);
//    fanTwo = step(0.9, fanTwo); //Very intersting for modulations
//
//    //Pattern 10
//    float fanThree = mod(strength * 10.0, 1.0);
//    fanThree = step(0.9, fanThree);
//
//    //Pattern 11 - Grid
//    float fanFour = step(0.8, mod(weight * 10.0, 1.0));
//    fanFour -= step(0.6, mod(strength * 10.0, 1.0));
//
//    //Pattern 14
//    float barX = step(0.4, mod(strength * 10.0, 1.0));
//    barX *= step(0.8, mod(weight * 10.0, 1.0));
//    float barY = step(0.4, mod(weight * 10.0, 1.0));
//    barY *= step(0.8, mod(strength * 10.0, 1.0));
//
//    float newStrength = barX + barY;
//
//    //Pattern 15
//    float barFifteenX = step(0.4, mod(strength * 10.0 - 0.2, 1.0));
//    barFifteenX *= step(0.8, mod(weight * 10.0, 1.0));
//
//    float barFifteenY = step(0.4, mod(weight * 10.0 - 0.2, 1.0));
//    barFifteenY *= step(0.8, mod(strength * 10.0, 1.0));
//
//    float patternFifteen = barFifteenX + barFifteenY;
//
//    //Pattern 16
//    float patternSixteen = abs(vUv.x - 0.5);
//
//    //Pattern 17
//    float patternSeventeenX = abs(vUv.x - 0.5);
//    float patternSeventeenY = abs(vUv.y - 0.5);
//    float patternSeventeen = min(patternSeventeenX, patternSeventeenY);
//
//    //Pattern 18
//    float patternEighteenX = abs(vUv.x - 0.5);
//    float patternEighteenY = abs(vUv.y - 0.5);
//    float patternEighteen = max(patternEighteenX, patternEighteenY);
//
//    //Pattern 19
//    float patternNineteenX = abs(vUv.x - 0.5);
//    float patternNineteenY = abs(vUv.y - 0.5);
//    float patternNineteen = step(0.2, max(patternEighteenX, patternEighteenY));
//
//    //Pattern 20
//    float patternTwentyX = abs(vUv.x - 0.5);
//    float patternTwentyY = abs(vUv.y - 0.5);
//    float patternTwenty = step(0.4, max(patternEighteenX, patternEighteenY));
//
//    //Pattern 21
//    float round = floor(vUv.x * 10.0) / 10.0;
//
//    //Pattern 22
//    float roundSquare = floor(vUv.x * 10.0) / 10.0;
//    roundSquare *= floor(vUv.y * 10.0) / 10.0;
//
//    //Pattern 23
//    float randomNoise = random(vUv);
//
//    //Pattern 24
//    vec2 gridUv = vec2(
//        floor(vUv.x * 10.0) / 10.0,
//        floor(vUv.y * 10.0) / 10.0
//
//    );
//    float patternTwentyFour = random(gridUv);
//
//    //Pattern 25
//    vec2 gridUvTwo = vec2(
//    floor(vUv.x * 10.0 + vUv.y * 5.0) / 10.0,
//    floor(vUv.y * 10.0 + vUv.x * 5.0) / 10.0
//
//    );
//    float patternTwentyFive = random(gridUvTwo);
//
//    //Pattern 26
//    float twentySix= length(vUv);
//
//    //Pattern 27 - Simple Shadows!
////    float twentySeven= length(vUv - 0.5);
//        float twentySeven= distance(vUv, vec2(0.8, 0.2));
//
//    //Pattern 28 - Light
//    float twentyEight= 1.0 - distance(vUv, vec2(0.5, 0.5));
//
//    //Pattern 29 - Spotlight
//    float twentyNine= 0.01 / distance(vUv, vec2(0.5));
//
//    //Pattern 30
//    vec2 lightUv = vec2(
//                        0.4 + vUv.x * 0.2,
//                        vUv.y
//                        );
//
//
//    float thirty= 0.015 / distance(lightUv, vec2(0.5));
//
//    //Pattern 31 - Star light
//    vec2 vertUv = vec2(
//    vUv.x,
//    0.4 + + vUv.y * 0.2
//    );
//
//    float thirtyOne = 0.015 / distance(vertUv, vec2(0.5));
//    float thirtyOneAdd = 0.015 / distance(lightUv, vec2(0.5));
//    float thirtyOneFinal = thirtyOne + thirtyOneAdd;

    //Pattern 32
//    vec2 rotatedUv = rotate(vUv, PI * 0.25, vec2(0.5));
//
//    vec2 lightUvX = vec2(rotatedUv.x * 0.1 + 0.45, rotatedUv.y * 0.5 + 0.25);
//    float lightX = 0.015 / distance(lightUvX, vec2(0.5));
//
//    vec2 lightUvY = vec2(rotatedUv.y * 0.1 + 0.45, rotatedUv.x * 0.5 + 0.25);
//    float lightY = 0.015 / distance(lightUvY, vec2(0.5));
//
//   float thirtyTwo = lightX * lightY;

    //Pattern 33


    //Output
    gl_FragColor = vec4(thirtyTwo, thirtyTwo, thirtyTwo, 1.0);
}