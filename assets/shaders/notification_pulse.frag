#version 460 core

//precision highp float;

#include <flutter/runtime_effect.glsl>
// Входные параметры


uniform vec4 uColor; // Базовый цвет (красный для уведомления)
uniform vec2 uSize;
uniform float uTime;

// Выходной цвет
//layout(location = 0) out
out vec4 oColor;

void main() {
    vec2 uv = gl_FragCoord.xy / uSize;

    // Центр иконки
    vec2 center = vec2(0.5, 0.5);

    // Расстояние до центра (для создания круглой формы)
    float dist = length(uv - center);

    // Пульсация на основе времени
    float pulse = 0.5 + 0.5 * sin(uTime * 3.0);

    // Базовый цвет иконки (красный по умолчанию)
    vec4 baseColor = vec4(1.0, 0.0, 0.0, 1.0);
    if (uColor.a > 0.0) {
        baseColor = uColor; // Используем переданный цвет, если есть
    }

    // Финальный цвет с пульсацией
    vec4 finalColor = mix(baseColor * 0.7, baseColor, pulse);

    // Применяем форму круга с мягкими краями
    float alpha = smoothstep(0.5, 0.45, dist);

    oColor = vec4(finalColor.rgb, finalColor.a * alpha);

//    float pulse = 0.5 + 0.5 * sin(uTime * 10.0);
//    oColor = vec4(pulse, 0.0, 0.0, 1.0); // пульсирующий красный
}