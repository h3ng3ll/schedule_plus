#version 460 core

#include <flutter/runtime_effect.glsl>

uniform float uTime;
uniform vec2 uSize;


out vec4 oColor;

void main() {
    // Use FlutterFragCoord() instead of gl_FragCoord in Flutter
    vec2 fragCoord = FlutterFragCoord().xy;
    vec2 uv = fragCoord / uSize;

    // Simplified colors
    vec3 color1 = vec3(0.945, 0.941, 1.0); // Light purple
    vec3 color2 = vec3(0.976, 0.976, 0.984); // Almost white

    // Simple wave effect
    float wave = sin(uv.y * 6.0 + uTime) * 0.05;

    // Mix colors based on position and wave
    float mixFactor = uv.y + wave;
    vec3 color = mix(color1, color2, mixFactor);

    // Output final color
    oColor = vec4(color, 1.0);
}