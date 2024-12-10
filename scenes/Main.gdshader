shader_type canvas_item;

uniform vec2 speed = vec2(-0.02, -0.02); // Скорость движения текстуры (X и Y)

void fragment() {
    // Увеличиваем UV координаты на основе времени и скорости
    vec2 offset = TIME * speed;
    
    // Используем модуль чтобы повторять текстуру как тайл
    vec2 uv = fract(UV + offset);
    
    // Применяем текстуру с новыми UV координатами
    COLOR = texture(TEXTURE, uv);
}


//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
